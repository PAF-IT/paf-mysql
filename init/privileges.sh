#!/bin/bash
set -e

# Fail if PAF_ADMIN_PASSWORD is empty
if [ -z "$PAF_ADMIN_PASSWORD" ]; then
  echo "ERROR: Environment variable PAF_ADMIN_PASSWORD is not set."
  exit 1
fi

echo "Creating user paf-admin with provided password..."

mysql -u root -p"$MYSQL_ROOT_PASSWORD" <<-EOSQL
CREATE USER IF NOT EXISTS 'paf-admin'@'%' IDENTIFIED BY '${PAF_ADMIN_PASSWORD}';
GRANT ALL PRIVILEGES ON \`paf-admin\`.* TO 'paf-admin'@'%';
FLUSH PRIVILEGES;
EOSQL

echo "User paf-admin created and granted privileges."
