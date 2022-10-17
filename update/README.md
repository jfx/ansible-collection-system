Role Name
=========

An Ansible role that update/upgrade Ubuntu and Debian Operating Systems.

Requirements
------------

Minimal Ansible version: 2.10

Role Variables
--------------

None.

Dependencies
------------

None.

Example Playbook
----------------

```yaml
- hosts: all
  roles:
    - jfx.update
```

License
-------

This program is free software: you can redistribute it and/or modify it under the terms of the MIT License (MIT). See the [LICENSE](https://opensource.org/licenses/MIT) for details.

Author Information
------------------

 **FX Soubirou** - *Initial work* - [Gitlab repositories](https://gitlab.com/op_so).

* [Gitlab](https://gitlab.com/op_so/ansible/os-update): Main repository
* [Dockerhub](https://hub.docker.com/r/jfxs/ansible-os-update)
