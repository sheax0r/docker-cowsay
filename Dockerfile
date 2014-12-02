FROM centos:centos6

RUN rpm -Uvh http://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm
RUN yum install -y which tar cowsay gcc-c++ make rubygems && yum clean all
RUN curl -sSL https://rvm.io/mpapis.asc | gpg2 --import -
RUN curl -L get.rvm.io | bash -s stable

RUN yum install -y ImageMagick && yum clean all 
RUN source /etc/profile.d/rvm.sh
RUN /bin/bash -l -c "rvm requirements"
RUN /bin/bash -l -c "rvm install 2.0"
RUN /bin/bash -l -c "gem install --no-ri --no-rdoc bundler"
RUN /bin/bash -l -c "ruby --version"
RUN echo -ne "\n54.186.104.15 api.rubygems.org" >> /etc/hosts
RUN /bin/bash -l -c "gem install --no-ri --no-rdoc cowsapi --version 0.1.1"

ADD run.sh /run.sh

RUN yum -y install git && yum clean all

ENTRYPOINT ["bash -l -c '/run.sh'"]

EXPOSE 80

