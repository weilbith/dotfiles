from __future__ import absolute_import, division, print_function

import os
from typing import List

from ansible.plugins.lookup import LookupBase


def get_files_in_directory(path: str) -> List[str]:
    if os.path.exists(path):
        return [entry.path for entry in os.scandir(path) if entry.is_file()]

    else:
        return []


class LookupModule(LookupBase):
    def run(self, terms, variables=None, **kwargs) -> List[str]:
        result = []

        for directory_name in terms:
            for search_path in variables.get("ansible_search_path", []):
                directory_path = os.path.join(search_path, "files", directory_name)
                result.extend(get_files_in_directory(directory_path))

        return result
