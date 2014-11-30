FROM centos:centos6

RUN rpm -Uvh http://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm
RUN yum install -y which tar cowsay gcc-c++ make rubygems && yum clean all
RUN curl -sSL https://rvm.io/mpapis.asc | gpg2 --import -
RUN curl -L get.rvm.io | bash -s stable
RUN gem install --no-ri --no-rdoc bundle

RUN yum install -y ImageMagick && yum clean all 
RUN gem install lolcat 
RUN yum install -y ruby-devel
RUN gem install --no-ri --no-rdoc cowsapi --version 0.0.4

ADD run.sh /run.sh

ENTRYPOINT ["/run.sh"]

EXPOSE 80
