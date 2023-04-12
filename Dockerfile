# Start with CentOS base image
FROM centos:latest

# Install required dependencies
RUN yum update -y && \
    yum install -y wget perl perl-App-cpanminus make gcc g++ java-1.8.0-openjdk-devel && \
    yum clean all

# Install Trinity
RUN wget https://github.com/trinityrnaseq/trinityrnaseq/archive/Trinity-v2.12.0.tar.gz && \
    tar -xzf Trinity-v2.12.0.tar.gz && \
    cd trinityrnaseq-Trinity-v2.12.0 && \
    make && \
    make plugins && \
    make install && \
    cd .. && \
    rm -rf trinityrnaseq-Trinity-v2.12.0 Trinity-v2.12.0.tar.gz

# Set the Trinity software as the entrypoint
ENTRYPOINT ["Trinity"]
