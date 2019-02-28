from __future__ import absolute_import, division, print_function

# You can import any python module as needed.

# You always need to import ranger.api.commands here to get the Command class:
from ranger.api.commands import Command


#  class up(Command):
#      def execute(self):
#          if self.arg(1):
#              scpcmd = ["scp", "-r"]
#              scpcmd.extend([f.realpath for f in self.fm.thistab.get_selection()])
#              scpcmd.append(self.arg(1))
#              self.fm.execute_command(scpcmd)
#              self.fm.notify("Uploaded!")
#
#      def tab(self):
#          import os.path
#
#          try:
#              import paramiko
#
#          except ImportError:
#              return "kacek"
#
#          try:
#              with open(os.path.expanduser("~/.ssh/config")) as file:
#                  paraconf = paramiko.SSHConfig()
#                  paraconf.parse(file)
#
#          except IOError:
#              """Can not open ssh configuration file!"""
#              return "mist"
#
#          hosts = paraconf.get_hostnames()
#          hosts.discard("*")
#          return (self.start(1) + host + ":" for host in hosts)


class FzfSelect(Command):
    """
    :fzf_select
    Find a file using fzf.
    """

    def execute(self):
        import subprocess
        import os.path

        # Directories
        if self.quantifier:
            command = "find -L . \( -path '*/\.*' -o -fstype 'dev' -o -fstype 'proc' \) -prune \
            -o -type d -print 2> /dev/null | sed 1d | cut -b3- | fzf +m"

        # Files & Directories
        else:
            command = "find -L . \( -path '*/\.*' -o -fstype 'dev' -o -fstype 'proc' \) -prune \
            -o -print 2> /dev/null | sed 1d | cut -b3- | fzf +m"

        fzf = self.fm.execute_command(
            command, universal_newlines=True, stdout=subprocess.PIPE
        )

        stdout, stderr = fzf.communicate()

        if fzf.returncode == 0:
            fzf_file = os.path.abspath(stdout.rstrip("\n"))

            if os.path.isdir(fzf_file):
                self.fm.cd(fzf_file)

            else:
                self.fm.select_file(fzf_file)


class ToggleFlat(Command):
    """
    :toggle_flat
    (Un)Flattens the directory view.
    """

    def execute(self):
        if self.fm.thisdir.flat == 0:
            self.fm.thisdir.unload()
            self.fm.thisdir.flat = -1
            self.fm.thisdir.load_content()

        else:
            self.fm.thisdir.unload()
            self.fm.thisdir.flat = 0
            self.fm.thisdir.load_content()
