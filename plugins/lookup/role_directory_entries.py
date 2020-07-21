from __future__ import absolute_import, division, print_function

import os
from typing import List

from ansible.plugins.lookup import LookupBase


class LookupModule(LookupBase):
    def run(self, terms, variables=None, **kwargs) -> List[str]:
        result = []

        for directory_name in terms:
            for search_path in variables.get("ansible_search_path", []):
                directory_path = os.path.join(search_path, "files", directory_name)

                if os.path.exists(directory_path):
                    result.extend([entry.path for entry in os.scandir(directory_path)])

        return result
