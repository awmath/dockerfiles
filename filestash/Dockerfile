FROM machines/filestash

COPY entrypoint.sh /

USER root
RUN cp -R /app/data/config /

EXPOSE 8334

ENTRYPOINT ["/entrypoint.sh"]

CMD /app/filestash

