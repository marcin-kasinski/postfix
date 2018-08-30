FROM ubuntu:16.04
MAINTAINER Marcin Kasiński <marcin.kasinski@gmail.com> 



WORKDIR /opt/

EXPOSE 9092 8080


RUN mkdir /opt/mk  && ls /

ADD install-mailserver.sh /opt/mk/install-mailserver.sh

WORKDIR /opt/mk

RUN ls /opt/mk

RUN sed -i -e 's/\r//g' /opt/mk/install-mailserver.sh && \
chmod u+x /opt/mk/install-mailserver.sh && \
cat /opt/mk/install-mailserver.sh

RUN /opt/mk/install-mailserver.sh

#RUN chmod +x /usr/src/myapp/start.sh
#ENTRYPOINT [ "/usr/src/myapp/start.sh" ]

EXPOSE 587

CMD ["service","postfix","restart"]