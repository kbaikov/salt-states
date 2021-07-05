#!/usr/bin/env python3

import subprocess
from pathlib import Path

MINION_CONFD = Path("/etc/salt/minion.d")
PILLAR_PATH = Path("/srv/pillar")
SALT_FILE_ROOT = Path("/srv/salt")


masterless_contents = """file_client: local
file_roots:
  base:
    - /srv/salt

"""


def main():
    subprocess.run("apt install --yes -q salt-minion".split())
    subprocess.run("systemctl stop salt-minion".split())
    subprocess.run("systemctl disable salt-minion".split())

    Path(MINION_CONFD / "masterless.conf").write_text(masterless_contents)

    PILLAR_PATH.mkdir(exist_ok=True)
    SALT_FILE_ROOT.mkdir(exist_ok=True)

    subprocess.run(f"git clone https://github.com/kbaikov/salt-states.git {SALT_FILE_ROOT}".split())

    # sync execution modules and states
    subprocess.run("salt-call saltutil.sync_all".split())

    subprocess.run("salt-call state.apply".split())


if __name__ == "__main__":
    exit(main)
