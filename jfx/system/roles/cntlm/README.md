# Ansible reboot role

A role that installs cntlm on Ubuntu and Debian Operating Systems.

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
    - role: cntlm
      vars:
        cntlm_username: my_username
        cntlm_domain: corporate_domain
        cntlm_pass_ntlmv2: WRONGHASH6E9C...
        cntlm_proxies:
          - my_corporate_proxy:8080
        ...
```

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
| `cntlm_gateway`     | Gateway mode `'yes'` or `'no'` (with single quote).       | `'no'`                                  |
| `cntlm_allow`       | List of ACL allow rule.                                   | `{}`                                    |
| `cntlm_deny`        | List of ACL deny rule.                                    | `{}`                                    |
| `cntlm_status`      | Status of cntlm mainly `started|stopped`.                 | `started`                               |

(*) To get the NTLMv2 hash use the command: `cntlm -H -u <username> -d <domain> <proxy_host:port>`

## Authors

* **FX Soubirou** - *Initial work* - [GitLab repositories](https://gitlab.com/op_so)

## License

This program is free software: you can redistribute it and/or modify it under the terms of the MIT License (MIT). See the [LICENSE](https://opensource.org/licenses/MIT) for details.
