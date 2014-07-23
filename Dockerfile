FROM centos:centos6

ADD setup.sh /setup.sh
RUN /setup.sh

ENTRYPOINT ["/usr/bin/cowsay"]
