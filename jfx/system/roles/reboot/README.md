# Ansible reboot role

A role that reboots Ubuntu and Debian Operating Systems.

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

* Then use the role from the collection in the playbook:

example:

```yaml
- hosts: all

  collections:
    - jfx.system

  roles:
    - role: reboot
      vars:
        reboot_timeout: 120
        reboot_force: true
```

### reboot role variables

| Variables        | Description                   | Default |
| ---------------- | ----------------------------- | ------- |
| `reboot_timeout` | Timeout of reboot in seconds. | `300`   |
| `reboot_force`   | Force system to reboot.       | `false` |

## Authors

* **FX Soubirou** - *Initial work* - [GitLab repositories](https://gitlab.com/op_so)

## License

This program is free software: you can redistribute it and/or modify it under the terms of the MIT License (MIT). See the [LICENSE](https://opensource.org/licenses/MIT) for details.
