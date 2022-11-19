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
    - cntlm
      vars:
        cntlm_username: my_username
        cntlm_domain: corporate_domain
        cntlm_pass_ntlmv2: WRONGHASH6E9C...
        cntlm_proxies:
          - my_corporate_proxy:8080
        ...
```

### cntlm role variables

* `cntlm_arch`
  * Default: `amd64`
  * Description: Binary architecture of cntlm amd64|arm64 ...
* `cntlm_at_boot`
  * Default: `false`
  * Description: Start cntlm at boot true|false.
* `cntlm_username`
  * Required
  * Description: Proxy username.
* `cntlm_domain`
  * Required
  * Description: Proxy account domain/workgroup name.
* `cntlm_pass_ntlmv2`
  * Required
  * Description: Hashes of the proxy account password. Get by the command: `cntlm -H -u <username> -d <domain> <proxy_host:port>`
* `cntlm_proxies`
  * Required
  * Description: List of proxies `<proxy_host:port>`.
* `cntlm_no_proxy`
  * Default: `localhost, 127.0.0.*, 10.*, 192.168.*`
  * Description: No proxy networks.
* `cntlm_listen`
  * Default: `3128`
  * Description: Local port number for the cntlm `[<addr>:]<port_number>`.
* `cntlm_gateway`
  * Default: `no`
  * Description: Gateway mode yes|no.
* `cntlm_allow`
  * Default: `false`
  * Description: List of ACL allow rule.
* `cntlm_deny`
  * Default: `300`
  * Description: List of ACL deny rule.
* `cntlm_status`
  * Default: `started`
  * Description: Status of cntlm mainly `started|stopped`.

## Authors

* **FX Soubirou** - *Initial work* - [GitLab repositories](https://gitlab.com/op_so)

## License

This program is free software: you can redistribute it and/or modify it under the terms of the MIT License (MIT). See the [LICENSE](https://opensource.org/licenses/MIT) for details.
