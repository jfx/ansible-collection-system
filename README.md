# Ansible collection System

[![Software License](https://img.shields.io/badge/license-MIT-informational.svg?style=flat)](LICENSE)
[![Pipeline Status](https://gitlab.com/op_so/ansible/system/badges/main/pipeline.svg)](https://gitlab.com/op_so/ansible/system/pipelines)
[![semantic-release: angular](https://img.shields.io/badge/semantic--release-angular-e10079?logo=semantic-release)](https://github.com/semantic-release/semantic-release)

An [Ansible](https://www.ansible.com/) collections that update Ubuntu and Debian Operating Systems.

[![GitLab](https://shields.io/badge/Gitlab-informational?logo=gitlab&style=flat-square)](https://gitlab.com/op_so/ansible/system) The main repository.

[![Github](https://shields.io/badge/Github-informational?logo=github&style=flat-square)](https://github.com/jfx/ansible-collection-system) Deployment repository.

[![Ansible Galaxy](https://shields.io/badge/Ansible_Galaxy-informational?logo=ansible&style=flat-square)](https://galaxy.ansible.com/jfx/system) Ansible Galaxy collection.

This collections includes:

## os_update role

A role that update/upgrade Ubuntu and Debian Operating Systems.

### os_update role variables

- `os_update_upgrade`
  - Default: `dist`
  - Description: Upgrade level, mainly `no`, `safe` or `dist`.

## reboot role

A role that reboot Ubuntu and Debian Operating Systems.

### reboot role variables

- `reboot_timeout`
  - Default: `300`
  - Description: Timeout of reboot in seconds.
- `reboot_force`
  - Default: `false`
  - Description: Force system to reboot.

## install_opt role

A role to download and install a product in /opt directory with the following structure: `/opt/<product_name>/v<version>/<product_name>`.
Two symlinks are also created, if `io_deploy` variable is `true` (default value):

- `/usr/local/bin/<product_name> -> /opt/<product_name>/current/<product_name>`
- `/opt/<product_name>/current/ -> /opt/<product_name>/v<version>/`

### install_opt role variables

- `io_product`
  - Required - example: `prometheus`
  - Description: Name of th product.
- `io_version`
  - Required - example: `2.40.1`
  - Description: Version of the product.
- `io_package_name`
  - Required - example: `prometheus-2.40.1.linux-amd64`
  - Description: Package name to download without extension.
- `io_package_ext`
  - Default: "" - example: `tar.gz`
  - Description: Define the type of compression. "" for no compression.
- `io_download_link`
  - Required - example: `https://github.com/prometheus/prometheus/releases/download/v2.40.1/{{ io_package_name }}.{{ io_package_ext }}`
  - Description: URL to download product.
- `io_deploy`
  - Default: `true`
  - Description: Creation of 2 links to point to the new version.

## Getting Started

### Requirements

In order to use:

- Minimal Ansible version: 2.10

### Installation

- Download the `jfx.system` collection:

```shell
ansible-galaxy collection install jfx.system
```

- Then use the roles from the collection in the playbook:

example:

```yaml
- hosts: all

  collections:
    - jfx.system

  roles:
    - os_update
      vars:
        os_update_upgrade: safe
    - reboot
      vars:
        reboot_timeout: 120
        reboot_force: true
```

## Authors

- **FX Soubirou** - *Initial work* - [GitLab repositories](https://gitlab.com/op_so)

## License

This program is free software: you can redistribute it and/or modify it under the terms of the MIT License (MIT). See the [LICENSE](https://opensource.org/licenses/MIT) for details.
