FROM java:8

MAINTAINER Container Solutions

ENV JMETER_VERSION 2.12
ENV JMETER_DIR apache-jmeter-${JMETER_VERSION}
ENV JMETER_ARCHIVE ${JMETER_DIR}.tgz
ENV JMETER_URL https://archive.apache.org/dist/jmeter/binaries/${JMETER_ARCHIVE}

RUN apt-get update && \
  apt-get install -y wget && \
  wget -q ${JMETER_URL} && \
  wget -q -O - ${JMETER_URL}.md5 | md5sum -c && \
  tar -xzf ${JMETER_ARCHIVE} -C /var/lib && \
  mv /var/lib/${JMETER_DIR} /var/lib/jmeter && \
  rm -rf /var/lib/apt/lists/* ${JMETER_ARCHIVE}

CMD /var/lib/jmeter/bin/jmeter
