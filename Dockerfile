FROM centos:centos6

RUN rpm -Uvh http://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm
RUN yum install -y which tar cowsay rubygems && yum clean all
RUN curl -L get.rvm.io | bash -s stable
RUN gem install --no-ri --no-rdoc bundle

ADD app /app
RUN cd /app && bundle update

ADD run.sh /run.sh

CMD ["/run.sh"]
