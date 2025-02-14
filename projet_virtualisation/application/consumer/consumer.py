#!/usr/bin/env python3
import uuid
import json
import time
from flask import Flask, request, jsonify
import pika
import redis
import os

app = Flask(__name__)

# Configuration des connexions
RABBITMQ_HOST = 'rabbitmq'
RABBITMQ_QUEUE = 'calculations'
REDIS_HOST = 'redis'
REDIS_PORT = 6379
redis_host = os.getenv("REDIS_HOST", "redis")
rabbitmq_host = os.getenv("RABBITMQ_HOST", "rabbitmq")
# Connexion à Redis
r = redis.Redis(host=redis_host, port=REDIS_PORT, db=0)

# Connexion à RabbitMQ
rabbit_connection = pika.BlockingConnection(
    pika.ConnectionParameters(host=rabbitmq_host)  # 5672 est le port par défaut pour RabbitMQ
)

channel = rabbit_connection.channel()
channel.queue_declare(queue=RABBITMQ_QUEUE, durable=True)

@app.route('/api/calc', methods=['POST'])
def calculate():
    data = request.get_json()
    if not data or 'expression' not in data:
        return jsonify({'error': 'L\'expression est manquante'}), 400
    
    expression = data['expression']
    
    # Générer un identifiant unique pour l'opération
    op_id = str(uuid.uuid4())
    
    # Créer le message à publier dans RabbitMQ
    message = {
        'id': op_id,
        'expression': expression
    }
    
    channel.basic_publish(
        exchange='',
        routing_key=RABBITMQ_QUEUE,
        body=json.dumps(message),
        properties=pika.BasicProperties(
            delivery_mode=2  # Rendre le message persistant
        )
    )
    
    # Mettre une valeur par défaut "pending" dans Redis pour cet op_id
    r.set(op_id, 'pending')
    
    # Attendre (polling) que le consumer effectue le calcul et mette à jour Redis
    timeout = 10  # secondes
    start_time = time.time()
    result = None
    while time.time() - start_time < timeout:
        result = r.get(op_id)
        if result and result.decode('utf-8') != 'pending':
            result = result.decode('utf-8')
            break
        time.sleep(0.5)
    
    if not result or result == 'pending':
        return jsonify({'error': 'Timeout, aucun résultat'}), 504
    
    return jsonify({'resultat': result})

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
