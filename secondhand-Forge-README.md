The scripts are based on the documentation from *Antonio Goncalves* at [Github](https://github.com/agoncal/agoncal-sample-javaee/tree/master/02-JavaOne2013)

To scaffold the Secondhand EE project invoke following scripts

* `secondhand-plugin.fsh` if you don't have installed arquillian or primefaces
* `secondhand-scaffold.fsh` to create the Secondhand EE applicataion
* `secondhand-javaee7.fsh` to migrate the Java EE 6 project to a Java EE 7 project
* `secondhand-build.fsh` to build the project

To invoke the scripts run following commands

    $ forge
    > run secondhand-plugin.fsh
    > run secondhand-scaffold.fsh
    > run secondhand-javaee7.fsh
    > run secondhand-build.fsh

Make manual changes to

* pom.xml
* persistance.xml

Remove ... from pom.xml

Replace ... in persistence.xml

