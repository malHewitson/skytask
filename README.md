# skytask

Create a sqlserver db, I have called it sky. Since Microsoft do not publish their driver to maven central and I don't have a local maven repository into which I could have downloaded the driver from the microsoft website. I have used the jtds driver, unfortunately this does not support sqlserver 2014 so I have used an earlier version of sql server. 

In the service file application.properites I have used the jtds url assumning the db is local and running on port 1433
spring.datasource.url=jdbc:jtds:sqlserver://localhost:1433/sky

since you will have a microsoft driver then you could use 

spring.datasource.url=jdbc:sqlserver://localhost:1433;databaseName=sky

1) create sql server database I called it sky

2) create product table using create_product_table.sql

3) populate product table using populate_table.sql

4) skyservice.zip contains an intellijIdea version 14 project gradle using maven central repositories
The service is groovy, springboot, springdata jpa (hibernate as the provider) 

The groovy src is in the standard folder SkyService\src\main\groovy

SkyService\src\test\groovy for the tests 

I created another sql server db test and create the table (no need to populate) for the tests 

5) Refresh the intellij project to retrieve the dependencies from maven central 

6) application.properties can either be changed in the intellij project in resources or {install folder}\SkyService\SkyService\lib\SkyService.jar  

the service port can be changed here as well as the datasource url

server.port=8181

6) from within the intellij project terminal gradlew distzip

7) in IdeaProjects\SkyService\build\distributions there will be a zip file SkyService.zip

8) Extract the contents into an appropiate folder {install folder}Staging\SkyService\SkyService\bin

9) run SkyService and you should see your springboot service startup

10) I have downloaded extjs5.1.1 trial and using SenchaCmd created an application sky, this is located in sky.zip

11) The source changes are in sky\app. the majority of my code is in app\view\product I used MVVM

12) I used a Apache HTTP Server version 2.2 as the web server 

13)  Extract sky.zip under htdocs

14) in {Apache2.2 install}\conf\httpd.conf I needed to add the following proxy assuming the sky service is running on port 8181
you need to add this config in a VirtualHost *.*  block -- having problems putting the xml excerpt in this doc

< VirtualHost \*:\* >

    ProxyPreserveHost On
    
    ProxyPass /sky-services http://localhost:8181/sky-services
    
    ProxyPassReverse /sky-services  http://localhost:8181/sky-services
    
< /VirtualHost >

15) Assuming appache is running on localhost port 8090 then the UI can be accessed on http://localhost:8090/sky/
