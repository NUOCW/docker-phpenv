FROM nuocw/buildpack-deps:centos7
MAINTAINER "TOIDA Yuto" <toida.yuto@b.mbox.nagoya-u.ac.jp>

# add user "nuocw"
RUN useradd nuocw
USER nuocw
ENV HOME="/home/nuocw"
WORKDIR ${HOME}

# install anyenv
RUN git clone https://github.com/riywo/anyenv .anyenv
RUN echo 'export PATH="${HOME}/.anyenv/bin:${PATH}"' >> .bash_profile
RUN echo 'eval "$(anyenv init -)"' >> .bash_profile

# update anyenv
RUN mkdir -p .anyenv/plugins
RUN git clone https://github.com/znz/anyenv-update.git .anyenv/plugins/anyenv-update

USER root
CMD ["/bin/bash", "-c"]
