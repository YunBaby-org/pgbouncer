FROM pgbouncer/pgbouncer

ENV PGBOUNCER_POOL_MODE=session
ENV PGBOUNCER_LISTEN_PORT=5432
ENV PGBOUNCER_LISTEN_ADDRESS=0.0.0.0
ENV PGBOUNCER_AUTH_USER="pgbouncer"
ENV PGBOUNCER_AUTH_TYPE=md5
ENV PGBOUNCER_AUTH_QUERY="SELECT usename, passwd FROM pgbouncer.get_auth(\$1)"
ENV DATABASES_HOST=postgres
ENV DATABASES_PORT=5432
ENV DATABASES_DBNAME=postgres
ENV PASSWORD_FILE=""

COPY --chown=postgres:postgres ./pre-entrypoint.sh ./
RUN chmod u+x ./pre-entrypoint.sh

COPY --chown=postgres:postgres ./userlist.txt ./

ENTRYPOINT [ "./pre-entrypoint.sh" ]
