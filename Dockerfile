FROM tomcat:8.0

ADD ./webapp/target/*.war /usr/local/tomcat/webapp/

EXPOSE 9090

CMD [ "catalina.sh", "run" ]