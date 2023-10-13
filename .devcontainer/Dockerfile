FROM centos:7
ARG USERNAME=vscode
ARG USER_UID=1000
ARG USER_GID=$USER_UID

COPY dmc.repo /etc/yum.repos.d/dmc.repo
ADD fts.spec /

RUN groupadd --gid $USER_GID $USERNAME \
    && useradd -s /bin/bash --uid $USER_UID --gid $USER_GID -m $USERNAME
RUN ulimit -n 102400
RUN yum groupinstall -y 'Development Tools'
RUN yum install -y epel-release yum-utils git
RUN yum install -y gfal2-all jsoncpp-devel
RUN yum install -y centos-release-scl \
    && yum install -y devtoolset-8 \
    && scl enable devtoolset-8 -- bash
RUN yum-builddep -y "/fts.spec"
RUN yum clean all \
    && echo 'source /opt/rh/devtoolset-8/enable' >> /etc/profile
