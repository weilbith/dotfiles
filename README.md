[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![CircleCI](https://circleci.com/gh/weilbith/dotfiles/tree/ansible-circleci.svg?style=shield)](https://circleci.com/gh/weilbith/dotfiles/tree/ansible/circleci)
[![Ansible](https://img.shields.io/badge/ansible-2.9.9-red.svg)](https://shields.io/)
[![Vagrant](https://img.shields.io/badge/vagrant-2.2.9-blue.svg)](https://shields.io/)
[![Docker](https://img.shields.io/badge/docker-19.03.11-lightblue.svg)](https://shields.io/)

# Warhorse

The warhorse is my hero for my daily professional and private work. It is an
awkward pet name for my computer. The setup of my PC is something really
personal to me. It includes a lot of research, hard work and passion over many
years. It is affected by ongoing changes in configuration, new tools, tool
exchanges as well as conceptual reorientations. Therefore it is my desire to fix
it in a replicable setup. Having it, I can make any computer become my
workhorse. And it even allows me to synchronize within a herd. In fact it is
a more powerful dotfile repository.
This all may sound crazy to you. And it probably is. I can't deny. This is in
first place just for me. In second to share with others. My only hope could be
that this inspires you. If you are only interested into the configuration for
some certain tools, checkout their files in the according roles directories.

## Pre-requisites

The warhorse is expected to run on a machine with
[ArchLinux](https://wiki.archlinux.org/) as operation system. Other OS are not
supported and expected to fail. Besides that there are not requirements to
handle manually. Just use the provided [installation](#installation) targets to
get ready. Please be aware that the setup is meant to run on the targeting
machine. This is a requirement to make the configuration file linking working.

## Installation

This step is necessary for [provision](#provision) and [testing](#testing). It
makes sure that all dependencies are available and well configured.

Run `make install` to initialize the full setup. Checkout the section
_Installation Targets_ on `make help` for more focused sub-targets like only
testing.

Please be aware that these targets actually install packages on your operation
system which are not limited to this projects repository. Anyways you can still
cancel when get asked to provide your password for executing commands with root
permissions.

## Provision

This is the actual heart of this project. It provides your **local** machine to
become the workhorse. Thereby it makes sure that everything is fully installed,
completely configured and synchronized. There are even more targets to sync data
from the mail server and similar sources. The whole setup is idempotent. Means
it always makes sure that the system is aligned with the configuration here. So
it can be used for initialization, but also to update. Running the provisioning
multiple times without any changes leaves your system unaffected.

Run `make provide-all` to do a full setup. If you want to provide only
a sub-group of the setup, use the `make provide-group GROUP=<name-here>` target.
Checkout `make provide-list` to get a list of available group names.

## Testing

There are different targets to test the setup. They intend to test the validity
of the workhorse setup, not the configuration of the tools that get provisioned.
Watch-out for the `Testing Targets` section when you call `make help`.
