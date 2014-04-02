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

make manual changes as described below

    > run secondhand-build.fsh

Make manual changes to

* src/main/webapp/WEB-INF/web.xml
* src/main/webapp/WEB-INF/faces-config.xml
* src/main/webapp/WEB-INF/beans.xml
* src/main/resources/META-INF/validation.xml
* src/main/resources/META-INF/persistence.xml
* pom.xml
* xhtml-files in src/main/webapp/

Following instructions can be found more detailed at [Secondhand EE](http://syc.dyndns.org/drupal/wiki/secondhand-ee)
In all files replace **java.sun.com** with **xmlns.jcp.org**
In **web.xml** replace version="3.0" with version="3.1"
In **faces-config.xml** replace version="2.0" with version="2.2"
In **beans.xml** replace version="1.0" with version="1.1"
In **validation.xml** replace version="1.0" with version="1.1"
In **persistence.xml** replace version="2.0" with version="2.1"
In **pom.xml** replace source and target version 1.6 with 1.7 in the maven-compiler-plugin
In **pom.xml** add

    <build>
      <plugins>
        <plugin>
          <groupId>org.wildfly.plugins</groupId>
          <artifactId>wildfly-maven-plugin</artifactId>
          <version>1.0.1.Final</version>
        </plugin>
      </plugins>
    <build>
