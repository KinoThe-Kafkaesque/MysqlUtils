source .env
liquibase --url="jdbc:mysql://${MYSQL_LOCAL_HOST}:${MYSQL_LOCAL_PORT}/${MYSQL_LOCAL_DATABASE}" \
  --username=${MYSQL_LOCAL_USERNAME} \
  --password=${MYSQL_LOCAL_PASSWORD} \
  --changeLogFile=diffChangeLog.xml \
  update