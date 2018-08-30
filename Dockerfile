FROM ubuntu
MAINTAINER Marcin Kasiński <marcin.kasinski@gmail.com> 



WORKDIR /opt/

EXPOSE 9092 8080


RUN mkdir /opt/mk  && ls /

ADD install-mailserver.sh /opt/mk/install-mailserver.sh
ADD start.sh /opt/mk/start.sh

WORKDIR /opt/mk

RUN ls /opt/mk

RUN sed -i -e 's/\r//g' /opt/mk/install-mailserver.sh && \
sed -i -e 's/\r//g' /opt/mk/start.sh && \
chmod u+x /opt/mk/*.sh && \
chmod u+x /opt/mk/start.sh

RUN /opt/mk/install-mailserver.sh

#RUN chmod +x /usr/src/myapp/start.sh
#ENTRYPOINT [ "/usr/src/myapp/start.sh" ]

EXPOSE 25
EXPOSE 465
EXPOSE 587

#CMD ["service","postfix","restart"]

#CMD ["supervisord"]

#CMD ["/usr/lib/postfix/sbin/master","-c","/etc/postfix","-d"]
CMD ["/opt/mk/start.sh"]

#CMD ["sleep","30000"]


