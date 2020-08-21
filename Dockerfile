FROM frolvlad/alpine-glibc:alpine-3.4
MAINTAINER R34L1V3 <r34lv3@gmail.com>

EXPOSE 9987/udp 10011 30033

ENV \
	TS_DIR="/opt/teamspeak" \
	TS_DATA="/data"

RUN mkdir -p "${TS_DIR}"

COPY data/ ${TS_DATA} 
COPY teamspeak/ ${TS_DIR}
RUN chmod -R ugo+rwx ${TS_DIR}
VOLUME ${TS_DATA}
RUN for file in $(find ${TS_DATA} -mindepth 1 -maxdepth 1); do \
	ln -s "${file}" $(echo $file | sed 's@^'"${TS_DATA}"'@'"${TS_DIR}"'@g') \
	; done

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
