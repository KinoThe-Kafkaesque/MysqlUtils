#!/bin/bash
source .env
# Check if a table is specified
# if [ $# -eq 1 ]; then
#     CHANGELOG_TABLE="-Dliquibase.snapshotData=false -Dliquibase.diffTypes=data -Dliquibase.dataOutputDirectory=$PWD -Dliquibase.referenceTableName=$1"
# else
#     CHANGELOG_TABLE=""
# fi

# # Generate changeLog for remote database
# ./liquibase --url="jdbc:mysql://${MYSQL_REMOTE_HOST}:${MYSQL_REMOTE_PORT}/${MYSQL_REMOTE_DATABASE}" \
#   --username=${MYSQL_REMOTE_USERNAME} \
#   --password=${MYSQL_REMOTE_PASSWORD} \
#   --changeLogFile=remote_db.xml \
#   generateChangeLog

# # Generate changeLog for local database
# ./liquibase --url="jdbc:mysql://${MYSQL_LOCAL_HOST}:${MYSQL_LOCAL_PORT}/${MYSQL_LOCAL_DATABASE}" \
#   --username=${MYSQL_LOCAL_USERNAME} \
#   --password=${MYSQL_LOCAL_PASSWORD} \
#   --changeLogFile=local_db.xml \
#   generateChangeLog

# # Diff the two XML files and save the output
# diff -u remote_db.xml local_db.xml > diff.xml
#!/bin/bash

# Check if a table is specified
if [ $# -eq 1 ]; then
    CHANGELOG_TABLE="-Dliquibase.snapshotData=false -Dliquibase.diffTypes=data -Dliquibase.dataOutputDirectory=$PWD -Dliquibase.referenceTableName=$1"
else
    CHANGELOG_TABLE=""
fi

# Generate a diffChangeLog between the remote and local databases
liquibase --referenceUrl="jdbc:mysql://${MYSQL_REMOTE_HOST}:${MYSQL_REMOTE_PORT}/${MYSQL_REMOTE_DATABASE}" \
  --referenceUsername=${MYSQL_REMOTE_USERNAME} \
  --referencePassword=${MYSQL_REMOTE_PASSWORD} \
  --url="jdbc:mysql://${MYSQL_LOCAL_HOST}:${MYSQL_LOCAL_PORT}/${MYSQL_LOCAL_DATABASE}" \
  --username=${MYSQL_LOCAL_USERNAME} \
  --password=${MYSQL_LOCAL_PASSWORD} \
  --changeLogFile=diffChangeLog1.xml \
  diffChangeLog
