from __future__ import absolute_import, division, print_function

import os
from typing import List

from ansible.plugins.lookup import LookupBase


class LookupModule(LookupBase):
    def run(self, terms, variables=None, **kwargs) -> List[bool]:
        directory_name = terms[0]

        for search_path in variables.get("ansible_search_path", []):
            full_path = os.path.join(search_path, "files", directory_name)

            if os.path.exists(full_path):
                return [True]

        return [False]
