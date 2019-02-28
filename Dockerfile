FROM openjdk:8-jre-alpine
RUN apk update && \
	apk upgrade && \
	apk add curl tar && \
	curl -sL https://github.com/igniterealtime/Openfire/releases/download/v4.3.2/openfire_4_3_2.tar.gz -o openfire_4_3_2.tar.gz
RUN tar -xzf openfire_4_3_2.tar.gz -C /opt && \
	rm openfire_4_3_2.tar.gz && \
EXPOSE 3478/tcp 3479/tcp 5222/tcp 5223/tcp 5229/tcp 5275/tcp 5276/tcp 5262/tcp 5263/tcp 7070/tcp 7443/tcp 7777/tcp 9090/tcp 9091/tcp
# CMD ["/opt/openfire/bin/openfire", "start", "&&", "sh"]
# CMD [nohup /opt/openfire/bin/openfire.sh &]
CMD [sh -c '/opt/openfire/bin/openfire run']
