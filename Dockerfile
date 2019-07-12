FROM archlinux/base

ENV USER="test"
ENV HOME="/home/$USER"
ENV DOTDROP_DIR="$HOME/dotfiles"
ENV DOTDROP_CONFIG="$DOTDROP_DIR/config/config.yaml"
ENV DOTDROP_PROFILE="kautz"
ENV PYTHON_VIRTUAL_ENV="$HOME/venv"

# Install minimal base dependencies.
RUN yes '\n' | pacman -Syu --noconfirm --needed base-devel sudo python-pip git glibc

# Install DotDrop as sumodule because of dependency issues between pip and pacman.
RUN python3 -m venv $PYTHON_VIRTUAL_ENV && \
  source $PYTHON_VIRTUAL_ENV/bin/activate && \
  pip install dotdrop

# Create non-root test user with own home directory.
RUN groupadd sudo
RUN useradd --groups sudo --home-dir "$HOME" --shell /bin/bash "$USER"
RUN echo "$USER ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers
RUN chown -R "$USER:$USER" "$HOME"

USER $USER
WORKDIR $HOME
COPY --chown=test . $DOTDROP_DIR

# Unfortunatley making the required evironment available via bashrc do not work.
CMD ["bash", "-c", "set -a && source ~/dotfiles/config/env && source ~/venv/bin/activate && dotdrop install"]

# vim: nospell
