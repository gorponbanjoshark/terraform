FROM fedora:latest

COPY dockerfiles/google-cloud-sdk.repo /etc/yum.repos.d/google-cloud-sdk.repo

RUN /usr/bin/dnf install yum-utils dnf-plugins-core git vim-enhanced docker -y
RUN /usr/bin/yum-config-manager --add-repo https://rpm.releases.hashicorp.com/fedora/hashicorp.repo
RUN /usr/bin/dnf install terraform google-cloud-sdk -y

RUN mkdir -p ~/.vim/pack/jvirtanen/start
RUN cd ~/.vim/pack/jvirtanen/start && git clone https://github.com/jvirtanen/vim-hcl.git

RUN /usr/bin/dnf copr enable atim/starship -y
RUN /usr/bin/dnf install starship -y
RUN echo '. /root/.bash_extra' >> /root/.bashrc

COPY dockerfiles/.bash_extra /root/.bash_extra


# docker build -t local/terraform .
#docker run -i -t -v ~/workspace:/ws:z -v ~/aws:/aws:z -v /var/run/docker.sock:/var/run/docker.sock:z local/terraform bash