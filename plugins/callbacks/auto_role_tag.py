"""Inspired by:

https://gist.github.com/rkrzr/f5387167fa7b4869e2dca8b713879562.
"""

from __future__ import print_function

from ansible.plugins.callback import CallbackBase


class CallbackModule(CallbackBase):
    def v2_playbook_on_start(self, playbook):
        """Automatically give roles a tag based on their name.

        Allows to run a single role with `ansible-playbook
        --tags=role_name`.
        """

        plays = playbook.get_plays()
        roles = [role for play in plays for role in play.get_roles()]

        for role in roles:
            role_name = role._role_name
            role.tags.append(role_name)
