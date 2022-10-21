# Ansible OS update role

[![Software License](https://img.shields.io/badge/license-MIT-informational.svg?style=flat)](LICENSE)
[![Pipeline Status](https://gitlab.com/op_so/ansible/os-update/badges/main/pipeline.svg)](https://gitlab.com/op_so/ansible/os-update/pipelines)
[![semantic-release: angular](https://img.shields.io/badge/semantic--release-angular-e10079?logo=semantic-release)](https://github.com/semantic-release/semantic-release)

An [Ansible](https://www.ansible.com/) role that update/upgrade Ubuntu and Debian Operating Systems.

[![Gitlab](https://shields.io/badge/Gitlab-informational?logo=gitlab&style=flat-square)](https://gitlab.com/op_so/ansible/os-update) The main repository

[![Github](https://shields.io/badge/Github-informational?logo=github&style=flat-square)](https://github.com/jfx/ansible-role-os-update) [Ansible Galaxy](https://galaxy.ansible.com/jfx/os_update) deployment repository

## Getting Started

### Requirements

In order to use:

* Minimal Ansible version: 2.10

### Installation

* Download the `os_update` role:

```shell
ansible-galaxy install jfx.os_update
```

* Insert the role in the Ansible `playbook`:

example:

```yaml
- hosts: all
  roles:
    - jfx.os_update
```

## Authors

* **FX Soubirou** - *Initial work* - [Gitlab repositories](https://gitlab.com/op_so)

## License

This program is free software: you can redistribute it and/or modify it under the terms of the MIT License (MIT). See the [LICENSE](https://opensource.org/licenses/MIT) for details.
