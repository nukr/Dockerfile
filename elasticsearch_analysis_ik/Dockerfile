FROM elasticsearch:2.3.5

ENV IK_VERSION=1.9.5

RUN apt-get update && apt-get install -y git maven openjdk-8-jdk

RUN cd /root \
  && git clone https://github.com/medcl/elasticsearch-analysis-ik.git ik \
  && cd ik \
  && git checkout tags/v${IK_VERSION} \
  && mvn package \
  && unzip target/releases/elasticsearch-analysis-ik-${IK_VERSION}.zip -d /usr/share/elasticsearch/plugins/ik \
  && cp -RT config/ /usr/share/elasticsearch/config/
