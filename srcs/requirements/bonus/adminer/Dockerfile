FROM debian:bullseye
RUN apt update && apt install -y adminer php php-mysql wget && apt clean && rm -rf /var/lib/apt/lists/*
COPY tools/run.sh /run.sh
RUN chmod +x /run.sh
EXPOSE 8080
CMD ["/run.sh"]
