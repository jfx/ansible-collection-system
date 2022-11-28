# Ansible apt proxy role

A role that configure or unconfigure a proxy for apt on Ubuntu and Debian Operating Systems.

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
    - role: apt_proxy
      vars:
        apt_proxy_url: http://proxy_host:proxy_port/
```

### apt_proxy role variables

| Variables           | Description                                                | Default  |
| ------------------- | ---------------------------------------------------------- | -------- |
| `apt_proxy_url`     | URL of the proxy, format: `http://proxy_host:proxy_port/`. | Required |
| `apt_proxy_enabled` | Enable or disable the proxy configuration for apt.         | `true`   |

## Authors

* **FX Soubirou** - *Initial work* - [GitLab repositories](https://gitlab.com/op_so)

## License

This program is free software: you can redistribute it and/or modify it under the terms of the MIT License (MIT). See the [LICENSE](https://opensource.org/licenses/MIT) for details.
