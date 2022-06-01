FROM amazonlinux:latest
SHELL ["/bin/bash", "-c"]

WORKDIR /root/bin

RUN yum update -y
RUN yum install -y git ssh tar gzip ca-certificates gcc tar zlib-devel \ 
                   make zip bzip2 bzip2-devel readline-devel sqlite sqlite-devel \ 
                   openssl-devel tk-devel libffi-devel xz-devel patch

COPY bin/ .

RUN ./install_pyenv.sh
RUN ./install_python.sh
RUN ./install_poetry.sh

WORKDIR /root
RUN echo 'export PATH=$PATH:/root/bin' >> .bashrc
ENTRYPOINT [ "build_and_zip.sh" ]