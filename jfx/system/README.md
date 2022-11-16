# Ansible collection System

[![Software License](https://img.shields.io/badge/license-MIT-informational.svg?style=flat)](LICENSE)
[![Pipeline Status](https://gitlab.com/op_so/ansible/system/badges/main/pipeline.svg)](https://gitlab.com/op_so/ansible/system/pipelines)
[![semantic-release: angular](https://img.shields.io/badge/semantic--release-angular-e10079?logo=semantic-release)](https://github.com/semantic-release/semantic-release)

An [Ansible](https://www.ansible.com/) collection that update Ubuntu and Debian Operating Systems.

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

A role that reboots Ubuntu and Debian Operating Systems.

### reboot role variables

- `reboot_timeout`
  - Default: `300`
  - Description: Timeout of reboot in seconds.
- `reboot_force`
  - Default: `false`
  - Description: Force system to reboot.

## ufw role

A role that configures UFW Firewall Ubuntu and Debian Operating Systems.

### ufw role variables

- `ufw_policy_incoming`
  - Default: `deny`
  - Description: Incoming policy.
- `ufw_policy_outgoing`
  - Default: `allow`
  - Description: Outgoing policy.
- `ufw_logging`
  - Default: `on`
  - Description: Log in syslog. Possible value: on, off, low, medium, high, full

```yaml
ufw_rules:
  - rule: allow  # firewall rule: allow, deny, limit, reject (required)
    direction: in  # in, incoming, out, outgoing, routed (required)
    protocol: tcp  # TCP/IP protocol: any, tcp, udp, ipv6, esp, ah, gre, igmp. Default tcp
    from_ip: 192.168.0.0/16  # source network or IP, default any
    to_ip: 1.2.3.4  # to network or IP, default any
    from_port: 60000:61000  # Source port or source range port
    to_port: '4000'  # Destination port or destination range port
    interface: eth0  # interface for the rule
    route: false  # Apply the rule to routed/forwarded packets, default: false
    log: false  # Log new connections matched to this rule, default: false
    comment: "A comment for this rule"  # Requires UFW version >=0.35.
```

## Getting Started

### Requirements

In order to use:

- Minimal Ansible version: 2.10

### Installation

- Download the `jfx.system` and `community.general` collections:

```shell
ansible-galaxy collection install community.general
ansible-galaxy collection install jfx.system
```

- Then use the roles from the collection in the playbook:

example:

```yaml
- hosts: all

  collections:
    - community.general
    - jfx.system

  roles:
    - os_update
      vars:
        os_update_upgrade: safe
    - reboot
      vars:
        reboot_timeout: 120
        reboot_force: true
    - ufw
      vars:
        ufw_rules:
          - rule: allow
            protocol: tcp
            to_port: 22
            comment: 'Incoming connection on ssh port'
          - rule: allow
            ...
```

## Authors

- **FX Soubirou** - *Initial work* - [GitLab repositories](https://gitlab.com/op_so)

## License

This program is free software: you can redistribute it and/or modify it under the terms of the MIT License (MIT). See the [LICENSE](https://opensource.org/licenses/MIT) for details.
