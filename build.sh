#!/bin/bash

set -ouex pipefail

### Install packages

# Packages can be installed from any enabled yum repo on the image.
# RPMfusion repos are available by default in ublue main images
# List of rpmfusion packages can be found here:
# https://mirrors.rpmfusion.org/mirrorlist?path=free/fedora/updates/39/x86_64/repoview/index.html&protocol=https&redirect=1

# this installs a package from fedora repos
dnf install -y tmux neovim btop xonsh python3-pygments python3-prompt-toolkit python3-setproctitle

# Use a COPR Example:
#
# dnf5 -y copr enable ublue-os/staging
# dnf5 -y install package
# Disable COPRs so they don't end up enabled on the final image:
# dnf5 -y copr disable ublue-os/staging
dnf5 -y install 'dnf5-command(copr)'

dnf5 -y copr enable atim/starship
dnf5 -y copr enable lihaohong/chezmoi
dnf5 -y install starship chezmoi

#### Example for enabling a System Unit File

systemctl enable podman.socket rpm-ostreed-automatic.timer set-shell.service
