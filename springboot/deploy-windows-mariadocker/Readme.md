# Deploy Movie API Spring Boot

## Summary
- API Spring Boot compiled with Java 11: movieapi.jar
- packaged with driver JDBC PostgreSQL: included in movieapi.jar
- configured for a PotstgreSQL in a Docker container (application.properties)

## Checkup Fat Jar
### Powershell
`jar tvf .\movieapi.jar | Select-String postgres`
### Linux
`jar tvf .\movieapi.jar | grep postgres`

## Change API port

### application.properties
server.port=8081

### command line
java -jar movieapi.jar --server.port=8081

