# Use the official MySQL image as a base
FROM mysql:latest

# Initialize database, set privileges
ADD init/data-playground.sql /docker-entrypoint-initdb.d/data.sql
ADD init/privileges.sh /docker-entrypoint-initdb.d/privileges.sh

# Make sure the shell script is executable
RUN chmod +x /docker-entrypoint-initdb.d/privileges.sh


# Expose port 3306 to allow connections to the database
EXPOSE 3306

# Start the MySQL server when the container is run
CMD ["mysqld"]