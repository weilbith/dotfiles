FROM archlinux:20200605

RUN pacman -Syu --noconfirm
RUN pacman -S --noconfirm sudo base-devel git
RUN useradd --create-home circleci
RUN echo 'circleci ALL=(ALL) NOPASSWD:ALL' > /etc/sudoers

USER circleci
ENV USER=circleci
WORKDIR /home/circleci
