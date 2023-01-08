FROM fedora:latest

RUN /usr/bin/yum install yum-utils dnf-plugins-core git vim-enhanced docker -y
RUN /usr/bin/yum-config-manager --add-repo https://rpm.releases.hashicorp.com/fedora/hashicorp.repo
RUN /usr/bin/dnf install terraform -y

RUN mkdir -p ~/.vim/pack/jvirtanen/start
RUN cd ~/.vim/pack/jvirtanen/start && git clone https://github.com/jvirtanen/vim-hcl.git


COPY dockerfiles/.bash_extra /root/.bash_extra

RUN /usr/bin/dnf copr enable atim/starship -y
RUN /usr/bin/dnf install starship -y
RUN echo '. /root/.bash_extra' >> /root/.bashrc


# docker build -t local/terraform .
#docker run -i -t -v ~/workspace:/ws:z -v ~/aws:/aws:z -v /var/run/docker.sock:/var/run/docker.sock:z local/terraform bash