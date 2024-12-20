FROM debian:latest
RUN apt-get update
RUN apt-get install bash \
&& apt-get install htop -y \
&& apt-get install vim -y \
&& apt-get install net-tools -y
ENV OWNER="CHARLY"
CMD ["sleep", "3600"]
