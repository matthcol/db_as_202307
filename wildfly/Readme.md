# Jboss-cli commands

## 0. Client jboss-cli (shell/bat/powershell)
### Without connection
- jboss-cli.sh
- jboss-cli.bat
- jboss-cli.ps1
### With local connection on default port 9990
- jboss-cli.sh --connect
### With local/distant connection on specific port
- jboss-cli.sh --connect --controller=remote+http://localhost:9999

## 1. Deployment
### Execute one command

- jboss-cli.sh --connect --command='deploy target/bonjour.war'
- jboss-cli.sh --connect --command='undeploy bonjour.war'
- jboss-cli.sh --connect --command='ls /deployment'

### Simplier syntax

- jboss-cli.sh --connect 'deploy target/bonjour.war'

### Other options
	--commands="c1,c2,c3" : several commands
	--file=my-commands-file : several commands in one file

### Interact with deployments
- ls /deployment
- deploy
- deployment list
- deployment list webapp.war
- deployment enable/disable webapp.war
- deployment disable-all
- deployment info
- deployment-info

## 2. Datasources and drivers
### View
- ls /subsystem=datasources
- ls /subsystem=datasources/data-source
- ls /subsystem=datasources/jdbc-driver
- ls /subsystem=datasources:installed-drivers-list
- ls /subsystem=datasources/data-source=ExampleDS

### Deploy driver
- deploy ~/.m2/repository/org/mariadb/jdbc/mariadb-java-client/2.7.2/mariadb-java-client-2.7.2.jar

### main attributes :
- connection-url=jdbc:mariadb://localhost:3306/dbmovie
- driver-name=mariadb-java-client-2.7.2.jar
- jndi-name=java:/movieDS
- password=password
- user-name=movie

### add and manage datasource
- data-source --help --commands
- data-source add --name=MovieDSmaria --jndi-name=java:/movieDS --driver-name=mariadb-java-client-3.0.7.jar --connection-url=jdbc:mariadb://192.168.56.101:3307/dbmovie --user-name=movie --password=password --max-pool-size=15 --min-pool-size=5 --pool-prefill  --statistics-enabled
- data-source disable --name=MovieDSmaria
- data-source enable --name=MovieDSmaria
- data-source test-connection-in-pool --name=MovieDSmaria
- data-source flush-gracefully-connection-in-pool --name=MovieDSmaria
- data-source remove --name=MovieDSmaria
- data-source read-resource --name=MovieDSmaria

### avec JMX
- /subsystem=datasources/data-source=MovieDSmaria:remove
- /subsystem=datasources/data-source=MovieDSmaria:read-attribute(name=driver-name)
- /subsystem=datasources/data-source=MovieDSmaria:read-attribute(name=connection-url)
- /subsystem=datasources/data-source=MovieDSmaria:write-attribute(name=driver-name, value=mariadb-java-client-2.7.2.jar)
- /subsystem=datasources/data-source=MovieDSmaria:write-attribute(name=connection-url,value=jdbc:mariadb://localhost:3306/dbmovie)

### pool seetings
- initial-pool-size=
- max-pool-size=
- min-pool-size=
- pool-prefill=
- statistics-enabled

## 3. Interfaces
### Interface public
- ls /interface=public
- /interface=public:read-attribute(name=inet-address)
- /interface=public:write-attribute(name=inet-address,value=192.168.56.102)
- /interface=public:write-attribute(name=inet-address,value=${jboss.bind.address:192.168.56.102})

### Interface management
- ls /interface=management
- /interface=management:write-attribute(name=inet-address, value=0.0.0.0)

### Ports
- ls /socket-binding-group=standard-sockets/socket-binding=management-http
- /socket-binding-group=standard-socke/socket-binding-group=standard-sockets/socket-binding=management-http:write-attribute(name=port, value=${jboss.management.http.port:9999}ts/socket-binding=http:read-attribute(name=port)
- /socket-binding-group=standard-sockets/socket-binding=http:write-attribute(name=port,value=8081)

