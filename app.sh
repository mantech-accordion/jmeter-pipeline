#java -Djava.security.egd=file:/dev/./urandom -jar /app.jar


./mvnw spring-boot:run -Dserver.port=8080 &
 
while ! httping -qc1 http://localhost:8080 ; do sleep 1 ; done
 
jmeter -Jjmeter.save.saveservice.output_format=xml 
  -n -t /var/jenkins_home/workspace/demo/jmeter/src/main/resources/JMeter.jmx 
    -l /var/jenkins_home/workspace/demo/jmeter/src/main/resources/JMeter.jtl
