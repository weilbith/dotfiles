FROM archlinux

RUN pacman -Sy --noconfirm sudo
RUN useradd --create-home circleci
RUN echo 'circleci ALL=(ALL) NOPASSWD:ALL' > /etc/sudoers

USER circleci
WORKDIR /home/circleci
