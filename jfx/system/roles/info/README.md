# Ansible OS update role

A role that diplays system informations from facts.

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
    - role: info
      vars:
        info_hostname: false
        info_date: false
        info_ufw: false
```

### info role variables

| Variables       | Description                                               | Default |
| --------------- | --------------------------------------------------------- | ------- |
| `info_hostname` | Display hostname, `true` or `false`                       | `true`  |
| `info_os`       | Display os information, `true` or `false`                 | `true`  |
| `info_hardware` | Display hardware information, `true` or `false`           | `true`  |
| `info_date`     | Display date/time information, `true` or `false`          | `true`  |
| `info_network`  | Display network information, `true` or `false`            | `true`  |
| `info_mounts`   | Display mounts file system information, `true` or `false` | `true`  |
| `info_ufw`      | Display UFW configuration information, `true` or `false`  | `true`  |

## Authors

* **FX Soubirou** - *Initial work* - [GitLab repositories](https://gitlab.com/op_so)

## License

This program is free software: you can redistribute it and/or modify it under the terms of the MIT License (MIT). See the [LICENSE](https://opensource.org/licenses/MIT) for details.
