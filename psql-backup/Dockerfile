FROM postgres:alpine

COPY backup.sh /

# every day at 2am
ENV CRONTIME "0 2 * * *" 
ENV DBHOST "10.0.0.1"
ENV DBPORT "5432"
ENV DBUSER "postgres"
ENV DBPASS "secret"
ENV DBNAME "postgres"

CMD echo "$CRONTIME /backup.sh" | crontab - && crond -f
