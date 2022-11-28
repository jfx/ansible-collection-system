# Ansible collection System

[![Software License](https://img.shields.io/badge/license-MIT-informational.svg?style=flat)](LICENSE)
[![Pipeline Status](https://gitlab.com/op_so/ansible/system/badges/main/pipeline.svg)](https://gitlab.com/op_so/ansible/system/pipelines)
[![semantic-release: angular](https://img.shields.io/badge/semantic--release-angular-e10079?logo=semantic-release)](https://github.com/semantic-release/semantic-release)

An [Ansible](https://www.ansible.com/) collection that update Ubuntu and Debian Operating Systems.

[![GitLab](https://shields.io/badge/Gitlab-informational?logo=gitlab&style=flat-square)](https://gitlab.com/op_so/ansible/system) The main repository.

[![Github](https://shields.io/badge/Github-informational?logo=github&style=flat-square)](https://github.com/jfx/ansible-collection-system) Deployment repository.

[![Ansible Galaxy](https://shields.io/badge/Ansible_Galaxy-informational?logo=ansible&style=flat-square)](https://galaxy.ansible.com/jfx/system) Ansible Galaxy collection.

This collections includes:

| Roles       | Description                                                                                  |
| ----------- | -------------------------------------------------------------------------------------------- |
| `apt_proxy` | A role that configure or unconfigure a proxy for apt on Ubuntu and Debian Operating Systems. |
| `cntlm`     | A role that install and configure cntlm on Ubuntu and Debian Operating Systems.              |
| `info`      | A role that diplays system informations from facts.                                          |
| `os_update` | A role that updates/upgrades Ubuntu and Debian Operating Systems.                            |
| `reboot`    | A role that reboots Ubuntu and Debian Operating Systems.                                     |
| `ufw`       | A role that configures UFW Firewall Ubuntu and Debian Operating Systems.                     |

## apt_proxy role

A role that configure or unconfigure a proxy for apt on Ubuntu and Debian Operating Systems.

### apt_proxy role variables

| Variables           | Description                                                | Default  |
| ------------------- | ---------------------------------------------------------- | -------- |
| `apt_proxy_url`     | URL of the proxy, format: `http://proxy_host:proxy_port/`. | Required |
| `apt_proxy_enabled` | Enable or disable the proxy configuration for apt.         | `true`   |

## cntlm role

A role that install and configure cntlm on Ubuntu and Debian Operating Systems.

### cntlm role variables

| Variables           | Description                                               | Default                                 |
| ------------------- | --------------------------------------------------------- | --------------------------------------- |
| `cntlm_arch`        | Binary architecture of cntlm `amd64|arm64`;               | `amd64`                                 |
| `cntlm_at_boot`     | Start cntlm at boot `true|false`.                         | `false`                                 |
| `cntlm_username`    | Proxy username.                                           | Required                                |
| `cntlm_domain`      | Proxy account domain/workgroup name.                      | Required                                |
| `cntlm_pass_ntlmv2` | Hashes of the proxy account password.(*)                  | Required                                |
| `cntlm_proxies`     | List of proxies `<proxy_host:port>`.                      | Required                                |
| `cntlm_no_proxy`    | No proxy networks.                                        | `localhost, 127.0.0.*, 10.*, 192.168.*` |
| `cntlm_listen`      | Local port number for the cntlm `[<addr>:]<port_number>`. | `3128`                                  |
| `cntlm_gateway`     | Gateway mode `yes`, `no`.                                 | `no`                                    |
| `cntlm_allow`       | List of ACL allow rule.                                   | `{}`                                    |
| `cntlm_deny`        | List of ACL deny rule.                                    | `{}`                                    |
| `cntlm_status`      | Status of cntlm mainly `started|stopped`.                 | `started`                               |

(*) To get the NTLMv2 hash use the command: `cntlm -H -u <username> -d <domain> <proxy_host:port>`

## info role

A role that diplays system informations from facts.

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

## os_update role

A role that updates/upgrades Ubuntu and Debian Operating Systems.

### os_update role variables

| Variables           | Description                                   | Default |
| ------------------- | --------------------------------------------- | ------- |
| `os_update_upgrade` | Upgrade level, mainly `no`, `safe` or `dist`. | `dist`  |

## reboot role

A role that reboots Ubuntu and Debian Operating Systems.

### reboot role variables

| Variables        | Description                   | Default |
| ---------------- | ----------------------------- | ------- |
| `reboot_timeout` | Timeout of reboot in seconds. | `300`   |
| `reboot_force`   | Force system to reboot.       | `false` |

## ufw role

A role that configures UFW Firewall Ubuntu and Debian Operating Systems.

### ufw role variables

| Variables             | Description                                                                  | Default |
| --------------------- | ---------------------------------------------------------------------------- | ------- |
| `ufw_policy_incoming` | Incoming policy.                                                             | `deny`  |
| `ufw_policy_outgoing` | Outgoing policy.                                                             | `allow` |
| `ufw_logging`         | Log in syslog. Possible value: `on`, `off`, `low`, `medium`, `high`, `full`. | `on`    |

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
    - role: cntlm
      vars:
        cntlm_username: my_username
        cntlm_domain: corporate_domain
        cntlm_pass_ntlmv2: WRONGHASH6E9C...
        cntlm_proxies:
          - my_corporate_proxy:8080
        ...
    - role: apt_proxy
      vars:
        apt_proxy_url: http://proxy_host:proxy_port/
    - role: os_update
      vars:
        os_update_upgrade: safe
    - role: reboot
      vars:
        reboot_timeout: 120
        reboot_force: true
    - role: ufw
      vars:
        ufw_rules:
          - rule: allow
            protocol: tcp
            to_port: 22
            comment: 'Incoming connection on ssh port'
          - rule: allow
            ...
    - role: info
      vars:
        info_hostname: false
        info_date: false
        info_ufw: false
```

## Authors

- **FX Soubirou** - *Initial work* - [GitLab repositories](https://gitlab.com/op_so)

## License

This program is free software: you can redistribute it and/or modify it under the terms of the MIT License (MIT). See the [LICENSE](https://opensource.org/licenses/MIT) for details.
