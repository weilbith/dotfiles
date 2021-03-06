[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![CircleCI](https://circleci.com/gh/weilbith/dotfiles/tree/master.svg?style=shield)](https://circleci.com/gh/weilbith/dotfiles/tree/master)
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
I can make any computer become my Workhorse. And it even allows me to
synchronize within a herd. In fact it is a more powerful [dotfile
repository](https://github.com/search?q=dotfiles).

This all may sound crazy to you. And it probably is. I can't deny. This is in
first place just for me. In second to share with others. My only hope could be
that this inspires you. If you are only interested into the configuration for
some certain tools, checkout their files in the according role directories.

## Usage

### Pre-requisites

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

Finally you will eventually need a file called `.vault.pwd` in the projects root
directory. It is necessary to decrypt secrets stored for the Ansible setup (e.g.
configuration files with an OAuth token).

### Installation

This step is necessary for [provision](#provision) and [testing](#testing). It
makes sure that all dependencies are available and well configured.

Run `make install` to initialize the full setup. Checkout the section
_Installation Targets_ on `make help` for more focused sub-targets like only
testing.

Please be aware that these targets actually install packages onto your operation
system. They are not limited to this projects repository. Anyways you can still
cancel when you get asked to provide your password for executing commands with
root permissions.

### Provision

This is the actual heart of this project. It provides your **local** machine to
become the Workhorse. Thereby it makes sure that everything is fully installed,
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

### Testing

There are different targets to test the setup. They intend to test the validity
of the Workhorse setup, not the dotfiles that get provisioned. Watch-out for the
`Testing Targets` section when you call `make help`. They require to install
some dependencies first via `make install-testing`. Such include the git hooks,
the virtual machine testing with Vagrant and the local CircleCI version.

#### Linting & Formatting with Pre-commit

When you installed the full setup you will have got established the Pre-commit
hooks for git already. Besides some basic checks there are a bunch of linting
hooks for the Ansible, Vagrant, Docker and CircleCI configuration included. You
can run them manually with `make test-lint`. If you don't install the hooks the
continuous integration tests will do it finally.

Formatting is checked as well, but there is no target to actually fix formatting
issues. It is recommended to install such tools manually to your development
environment.

#### Virtual Machine with Vagrant

To test the setup in practice without applying it to the active system,
a virtual machine is used. This machine is managed with Vagrant, described with
in the `Vagrantfile`. During the provision step, the setup of the Workhorse gets
applied to the test machine. Since Ansible works idempotent the provision can be
run over and over again to apply changes to the same machine continuously. In
between the machine gets suspended. The `make test-vagrant-provide` target
provides a convenient approach to do all of this at once. The target does also
allow to define the `BOOK` and `ROLE` variables to select a specific playbook or
role accordingly. This allows to speed up the tests and focus them to the
current development. These variables get simply forwarded to the according
provision targets.

Per default the `test-vagrant-provide` target will also automatically suspend the
virtual machine at the end. This is a compromise to be relatively fast in
resuming the machine and suspending it. If you want to free the RAM, use
`vagrant halt`. The next time running a test will take significantly longer to
get the machine up and running.
If you plan to run the tests multiple times in a row (e.g. adding a new role and
focus on it with the `ROLE` variable), it make sense to define the `FAST`
variable (any truthy value). This will prevent the virtual machine from becoming
suspended. Thereby the next run will be faster and also connecting to the
machine via SSH works out of the box.

To verify or debug the provided setup, you can SSH into the virtual machine. The
data of the setup get synchronized automatically thanks to Vagrant. Remind that
the `test-vagrant-provide` target will suspend the machine per default as long
as the `FAST` mode is not set. Therefore it is necessary to first resume the
machine with `vagrant resume && vagrant ssh`.

If there is the need to verify a setup visually like (e.g. test the X11 role),
the command `make test-vagrant-gui` can be used to restart the virtual machine
with a graphical interface. The default login is user-name and password
`vagrant`.

Furthermore can specific roles ask to get test data copied into the virtual
machine. The data can then be used to test the application practically. This can
be for example a PDF document or some images. The role itself specifies which
type of data it needs. The test data gets copied to the home directory of the
test user, attempting to follow the directory structure of the actual system.
To remove the copied data again, run the `make test-vagrant-remove-test-data`
target.

Unfortunately can't Ansible handle breaking changes. While it is idempotent it
does not automatically clean up old runs according to a diff with a more recent
version. So if there are breaking changes necessary, it is advised to recreate
a new virtual machine, running the provision from zero.

#### Continuous Integration with CircleCI

Finally the continuous integration tests make sure that the setup is actually
working. This is meant as a last check in case the git hooks and the virtual
machine tests have not been maintained locally.

The CircleCI workflow creates a dummy password file for ansible-vault. The setup
has been customized to not throw decryption errors when they occur within
a CircleCI job.

---

## Concepts & Design

### Base Role

Each role should inheriting the `base_role`. It provides most-likely all features
a role needs in a generic manner. While most roles just work out of the box,
some need more specification and fine tuning via variables. Everything that is not
achievable with the base role because it is special for this specific role must
be done in additional task definitions.

Example:

```yaml
- import_role:
    name: base_role
  vars:
    additional_packages:
      - pcsclite # Smartcard middleware library
      - ccid # Smartcard interface driver
    link_configuration_children: true
    systemd_units_user:
      - gpg-agent.service
      - gpg-agent-ssh.socket
    systemd_units_system:
      - pcscd.service
```

The Following lists all task-modules of the base role, what they do and the
configuration variables. A whole module or some tasks of it get ignored if there
is nothing defined for the current role. The console output will always
reference the original role name instead of `base_role` where the tasks are
actually defined.
The order of the modules is fixed, because they partially can have dependencies
to each other (like first a package must be installed).

#### Install Packages

Makes sure that certain packages are installed on the system. Uses an AUR helper
(`pikaur` per default) to also resolve user repositories. Requires to handle
local `PKGBUILD` files as well.

| Variable              |    Type    |     Default      | Description                                                   |
| :-------------------- | :--------: | :--------------: | :------------------------------------------------------------ |
| `base_package`        |  `string`  | name of the role | Fundamental package of the role, set as empty string to omit. |
| `additional_packages` | `string[]` |       `[]`       | List of more package names to install if necessary.           |
| `pkgbuild_urls`       | `string[]` |       `[]`       | List of URLs that resolve to `PKGBUILD` files to install.     |

#### Make Directories

Makes sure that certain directories exist at the system. This is for example
useful if a tool can't create its own configured cache directory (`"{{ xdg_config_home }}/tool"`).

| Variable          |    Type    | Default | Description                                           |
| :---------------- | :--------: | :-----: | :---------------------------------------------------- |
| `new_directories` | `string[]` |  `[]`   | List of absolute paths to create if not existing yet. |

#### Link Configuration

Creates a symbolic link of the configuration directory or files from the local
repository to the required location. Kinda the core of each dotfile management
repository. Though this module behaves quite complex. The directory must be
strictly named and being part of the role its files (i.e.
`<role_name>/files/configuration`). The module will search for such directory
and skip if it does not exist. The rest should be possible to derive from the
variable descriptions.

| Variable                           |   Type    |            Default             | Description                                                                                                 |
| :--------------------------------- | :-------: | :----------------------------: | :---------------------------------------------------------------------------------------------------------- |
| `configuration_destination`        | `string`  | `$XDG_CONFIG_HOME/<role-name>` | Path for symbolic link target or directory to create for linked children.                                   |
| `configuration_mode`               | `number`  |             `0700`             | File system mode for link target or new directory.                                                          |
| `link_configuration_children`      | `boolean` |            `false`             | Do not link directory, but create destination path and link all children from source.                       |
| `link_configuration_as_root`       | `boolean` |            `false`             | Make use of root privileges to link configuration (e.g. under `/etc/`).                                     |
| `force_to_overwrite_configuration` | `boolean` |            `false`             | Use the force flag when linking or creating the destination in case there is already something per default. |

#### Enable SystemD Units

Links and enables units (services, timers, sockets, ...) for SystemD. Handles
units for user and system scope. Units are always enabled, but never started.
Furthermore it detects custom unit files at `<role_name>/files/systemd/`. If
there is a custom service **and** timer with the same name, the service gets
only linked, while the timer gets enabled. Non-custom units must be installed
via the required packages from the module above.

For the CircleCI test environment these tasks do not get executed, since they
basically do not work.

| Variable                     |        Type        | Default | Description                                                                |
| :--------------------------- | :----------------: | :-----: | :------------------------------------------------------------------------- |
| `systemd_units_user`         |     `string[]`     |  `[]`   | List of unit names to enable for user scope.                               |
| `systemd_units_system`       |     `string[]`     |  `[]`   | List of unit names to enable for system scope (requires root permissions). |
| `systemd_units_custom_scope` | `user` or `system` | `user`  | Scope to apply for detected custom unit files.                             |

#### Copy Test Data

This is only relevant for the Vagrant test environment to allow further testing
of the applied roles. Such data can be images, documents or anything else. Roles
can defined which kind of data they need to get provided within the test
environment. The source data is stored within the base role itself, not by the
role using it (i.e. `base_role/files/<data_kind>`). Files get placed under the
home directory, following the directory structure from the source. This always
tries to imitate the future directory structure as used by me and thereby how
the applications expect it (if they have such kind of configuration).

If necessary, all test data can be removed from the current Vagrant box with the
`make test-vagrant-remove-test-data` command target.

| Variable            |    Type    | Default | Description                                                                                     |
| :------------------ | :--------: | :-----: | :---------------------------------------------------------------------------------------------- |
| `provide_test_data` | `string[]` |  `[]`   | List of folder names from the source directory to copy recursively (e.g. `[audio, documents]`). |

#### Link Shared Directory

This is a looped task and runs for the below listed items. It implements the
[shared directory feature](#shared-directories) for each role if they have such.
Therefore it checks if the role has any of these directories
`<role_name>/files/<shared_directory>/*`. If so, it links all its children to
the system directory shared between all roles. If this is the first role using this
shared directory, it will create they system directory. Checkout the above
linked section for more details of this concept.

Shared directories (roles must have directory with name of last path segment):

- `$XDG_CONFIG_HOME/environment.d`
- `$XDG_CONFIG_HOME/profile.d`
- `$XDG_CONFIG_HOME/plugin.d`
- `$XDG_DATA_HOME/applications`
- `$XDG_CONFIG_HOME/hotkey.d`
- `$XDG_CONFIG_HOME/cheat.d`
- `$XDG_CONFIG_HOME/notifications.d`

### Shared Directories

The concept of shared directories is nothing newly invented here. Rather it is
an effective approach that gets used and extended. The point is that all roles
should remain as independent of each other as possible. This is also the reason
why there is no usage of `meta` files. If there is one role provided, no other
role gets ever installed automatically as well (note that the `base_role` is
kind of an exception). Such an approach could result into an uncontrolled chain
of dependencies that is not wished (at least not within this repository).
Furthermore it would be hard to decide which are hard requirements and what are
just nice to have extenstions. Even more important should no role include any
configuration or reference to another application that is out of this roles
scope. For example a tool that is used for global hotkeys should not include all
the commands that actually get installed by other roles. It should only provide
the feature that you can define hotkeys.

The approach is that each role can provide files that get collected into
a single directory. From there they get consumed by a handler who is responsible
for them. This means as long as the role providing the handler of a shared
directory is not installed, these shared files will not take effect. This
concept makes sure that roles remain independent on a configuration file
level. If a role should be removed, it must not be worried that at any place
their is something left of this role and its applications. No environment
variable, not shell script, no hotkey, nothing. This follows the
open-closed-principle. Handlers are open to get easily extended, while their
own configuration is closed (does not change), as long as this basic
functionality must not been touched. This also leads to a beautiful clean
version control history. Each change in any configuration is always only
related to the according role.

This eventually becomes more obvious when taking about already widely
established shared directories. Note that while many of those have a system global
version as well, we only care about their user version here. An example is
the `$XDG_DATA_HOME/applications` directory. Every application can place its
`.desktop` files there. A tool like `rofi` can then list these files with a nice
UI presentation (including icon etc.) and let the user search/filter them and
finally start the selected application. Another example is the
`$XDG_CONFIG_HOME/environment.d` directory. Each file defines a list of
variables. They get sourced by SystemD and enhance the user scope environment.
This environment is then sourced by a Shell (no default behavior).
Shared directories on system level are for the network manager, package manger,
UDev and many more.

Usually (but not always) these directories have a naming scheme of `<name>.d`.
This comes from the fact there is often a file with `<name>.<extension>` next to
the directory that is responsible to source all files in the directory. Any
newly added shared directory in this repository sticks to this convention to
make them more obvious to see.
Files in these directories often have a leading number in their file name
(`01-<name>.<extension>`). This is used to get a strict loading order of all
files. This is for example relevant when the variables of one file reference
other variables that must be defined before (e.g. XDG-base-directories).
Watch-out for the existing files to determine their scheme order.

It is not uncommon that shared directory handler roles inject their own files
themselves. Handlers are meant to be exchangeable without (much) work to the
roles providing shared files. But this is not always the case/achievable (e.g.
specific syntax used).

Here comes a list of all supported shared directories (via the according [base
role module](#link-shared-directory)).

#### Environment

Target directory is `$XDG_CONFIG_HOME/environment.d`. This is a native feature
by SystemD that constructs a list of environment variables. The advantage is
that these variables are also available within all user services. The build
environment gets also sourced by the Shell (`.zshenv` in this case). The order
matters to make inherited variables get resolved correctly. Each role that needs
to define an environment variable should define it via this shared directory.
Only if the variables value contains more complex text (unfortunately are spaces
part of it), this should be moved to a profile.

#### Profiles

Target directory is `$XDG_CONFIG_HOME/profile.d`. This is kind of an adopted
native feature by some Shells (probably it gets abused here). This is basically
a collection of scripts that should get sourced by the Shell. Their purpose is
to initialize tools, define alias and functions, add plugins etc. Their order of
loading might be relevant if one profile depends on that another has been
sourced before. The handler of this shared directory is the `zsh` role (i.e. in
`.zshrc`)

#### Plugins

Target directory is `$XDG_CONFIG_HOME/profile.d`. This is a new shared directory
used by the plugin manager for Zsh plugins (`zinit` at the current state). Each
role can add plugins (e.g. to provide completion support for an application)
that then get automatically detected and managed by the plugin manager who is
the handler of this shared directory. The handler gets sourced itself as
a profile of the shell. The order of plugins might matter.

#### Applications

Target directory is `$XDG_DATA_HOME/applications`. This is a native feature of
Unix operation systems. The files inside usually share the `.desktop` extension.
The handler can be multiple. Here they are made accessible with `rofi`. Note
that some packages might provide their own desktop files, also those take place
at the global `/usr/share/applications` directory. The files do not have any
order.

#### Hotkeys

Target directory is `$XDG_CONFIG_HOME/hotkey.d`. This is a new shard directory
used by the hotkey manager. Roles can define their hotkeys that allow to trigger
actions globally within a desktop environment (e.g. volume, lock screen, ..).
The handler here is `sxhkd`. Their order does not matter.

#### Cheats

Target directory is `$XDG_CONFIG_HOME/cheat.d`. This is a new shared directory
used to collect cheat sheets for individual tools. The handler is `cheat`. Files
in this directory take precedence over the in parallel installed community
sheets. There is no order of the files. `cheat` does also support the usage of
sub-directories as long as their names still equals the command name.

#### Notifications

Target directory is `$XDG_CONFIG_HOME/notifications.d`. This is a new shared
directory to customize notifications. It allows to filter send notifications and
manipulate them (e.g. change color or icon). The handler is `dunst`. Their order
does not matter.

#### Polybar Segments

> TODO
> Not yet implemented, but there is a need to for it. Some technical issues for
> an exact implementation are not resolved yet.

### SystemD

> TODO
> SystemD units as first class citizen with all their high power.
> Explain custom artificial dependencies for desktop related services to Xorg.
