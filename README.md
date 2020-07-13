[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![CircleCI](https://circleci.com/gh/weilbith/dotfiles/tree/ansible.svg?style=shield)](https://circleci.com/gh/weilbith/dotfiles/tree/ansible)
[![Ansible](https://img.shields.io/badge/ansible-2.9.9-red.svg)](https://shields.io/)
[![Vagrant](https://img.shields.io/badge/vagrant-2.2.9-blue.svg)](https://shields.io/)
[![Docker](https://img.shields.io/badge/docker-19.03.11-lightblue.svg)](https://shields.io/)

<p align="center"><img width=200" src="./logo.png"></p>

# Warhorse

The warhorse is my hero for my daily professional and private work. It is
basically just an awkward host name for my computer. The setup of my computer is
something really personal to me. It includes a lot of research, hard work and
passion over many years. It got extended continuously with new tools, tool
exchanges, setup configuration reworks as well as conceptual reorientations.
Therefore it is my desire to fix this setup in a replicable manner. Having it,
I can make any computer become my workhorse. And it even allows me to
synchronize within a herd. In fact it is a more powerful [dotfile
repository](https://github.com/search?q=dotfiles).

This all may sound crazy to you. And it probably is. I can't deny. This is in
first place just for me. In second to share with others. My only hope could be
that this inspires you. If you are only interested into the configuration for
some certain tools, checkout their files in the according role directories.

## Pre-requisites

The warhorse is expected to run on a machine with
[ArchLinux](https://wiki.archlinux.org/) as operation system. Other OS are not
supported and expected to fail. Besides that there are only two packages needed.
These are `base-devel`, to enable the usage of the `Makefile`, and `git` to
checkout the sources and install the basic package manager. Everything else can
be setup with the provided [installation](#installation) targets.

Please be aware that the setup is meant to run on the targeting machine. This is
a requirement to make it work that the configuration files get linked.
Furthermore must the provision targets be run by the correct user to secure the
file relation and permission. Moreover he will need access `sudo` to get root
permissions for installing system packages and similar.

## Installation

This step is necessary for [provision](#provision) and [testing](#testing). It
makes sure that all dependencies are available and well configured.

Run `make install` to initialize the full setup. Checkout the section
_Installation Targets_ on `make help` for more focused sub-targets like only
testing.

Please be aware that these targets actually install packages onto your operation
system. They are not limited to this projects repository. Anyways you can still
cancel when you get asked to provide your password for executing commands with
root permissions.

## Provision

This is the actual heart of this project. It provides your **local** machine to
become the workhorse. Thereby it makes sure that everything is fully installed,
completely configured and synchronized. There are even more targets to sync data
from the mail server and similar sources. The whole setup is idempotent. Means
it always makes sure that the system is aligned with the configuration here.
Thereby it can be used for initialization, but also to update. Running the
provisioning multiple times without any changes leaves your system unaffected.

Run `make provide` to do a full setup. For more focused provision the different
roles are group into diverse Ansible playbooks. The main book simply includes
all of them. You can select a single book with `provide-book BOOK=<name-here>`.
Checkout `provide-book-list` to get a full list off all available book names.
The same goes for the `provide-role ROLE=<name-here>` target to focus a single
role only.

The dotfiles themselves are symbolically linked in the file system. Thereby you
must not call the provision again to update them. Concurrently it allows to edit
these files at their target location where the tools expect them.

## Testing

There are different targets to test the setup. They intend to test the validity
of the workhorse setup, not the dotfiles that get provisioned. Watch-out for the
`Testing Targets` section when you call `make help`. They require to install
some dependencies first via `make install-testing`. Such include the git hooks,
the virtual machine testing with Vagrant and the local CircleCI version.

### Linting & Formatting with Pre-commit

When you installed the full setup you will have got established the Pre-commit
hooks for git already. Besides some basic checks there are a bunch of linting
hooks for the Ansible, Vagrant, Docker and CircleCI configuration included. You
can run them manually with `make test-lint`. If you don't install the hooks the
continuous integration tests will do it finally.

Formatting is checked as well, but there is no target to actually fix formatting
issues. It is recommended to install such tools manually to your development
environment.

### Virtual Machine with Vagrant

To test the setup in practice without applying it to the active OS, a virtual
machine is used. Such gets described using Vagrant and its `Vagrantfile`. In the
provision step of this machine the setup of the workhorse gets applied. Since
Ansible works idempotent the provision step can be called over and over again to
apply changes continuously to the same machine. In between the machine gets
suspended. The `make test-vagrant` target provides a convenient approach to do
all of this. The target does also allow to define the `BOOK` and `ROLE` variable
to select a specific playbook or role. This allows to speed up the tests and
focus them to the current development. This variables get simply forwarded to
the according provision targets.

Per default the `test-vagrant` target will also automatically suspend the
virtual machine at the end. This is a compromise to be relatively fast in
resuming the machine and suspending it. If you want to free the RAM, use
`vagrant halt`. The next time running a test will take significantly longer to
get the machine up and running.
If you plan to run the tests multiple times in a row (e.g. adding a new role and
focus on it with the `ROLE` variable), it make sense to define the `FAST`
variable. This will prevent the virtual machine from becoming suspended. Thereby
the next run will be faster and also connecting to the machine via SSH works out
of the box.

To verify or debug the setup you can SSH into the virtual machine. The data of
the setup get synchronized automatically thanks to Vagrant. Remind that the
`test-vagrant` target will suspend the machine per default as long as the `FAST`
mode is not set. Therefore it is necessary to first resume the machine with
`vagrant resume && vagrant ssh`.

Unfortunately can't Ansible handle breaking changes. While it is idempotent it
does not automatically clean up old runs according to a diff with a more recent
version. So if there are breaking changes necessary, it is advised to recreate
a new virtual machine, running the provision from zero.

### Continuous Integration with CircleCI

Finally the continuous integration tests make sure that the setup is actually
working. This is meant as a last check in case the git hooks and the virtual
machine tests have not been maintained locally.
