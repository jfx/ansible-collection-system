# Ansible reboot role

A role that reboot Ubuntu and Debian Operating Systems.

[![Ansible Galaxy](https://shields.io/badge/Ansible_Galaxy-informational?logo=ansible&style=flat-square)](https://galaxy.ansible.com/jfx/system) Ansible Galaxy collection.

## Getting Started

### Requirements

In order to use:

* Minimal Ansible version: 2.10

### Installation

* Download the `jfx.system` collection:

```shell
ansible-galaxy collection install jfx.system
```

* Then use the roles from the collection in the playbook:

example:

```yaml
- hosts: all

  collections:
    - jfx.system

  roles:
    - reboot
      vars:
        reboot_timeout: 120
        reboot_force: true
```

### reboot role variables

* `reboot_timeout`
  * Default: `300`
  * Description: Timeout of reboot in seconds.
* `reboot_force`
  * Default: `false`
  * Description: Force system to reboot.

## Authors

* **FX Soubirou** - *Initial work* - [GitLab repositories](https://gitlab.com/op_so)

## License

This program is free software: you can redistribute it and/or modify it under the terms of the MIT License (MIT). See the [LICENSE](https://opensource.org/licenses/MIT) for details.
