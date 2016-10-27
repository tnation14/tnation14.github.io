# tnation14.github.io
Landing page for http://www.taydoesdevops.com

### Requirements
- Vagrant 1.8.4
- VirtualBox 5.0.26+
- Ansible 2.1.2.0+

### Getting started:

**_TLDR:_**
```bash
  $ ./scripts/setup
```

Use `scripts/setup` to start and provision a virtual machine. During provisioning, `python`, `ansible`, `docker` and `docker-compose` will be installed on the guest machine. Additionally, a docker-compose service will be installed that runs `jekyll serve`. The jekyll server is available at [`http://localhost:4000`](http://localhost:4000) and is started automatically by `scripts/setup`.

The `tnation14.github.io` folder is shared with the virtual machine, so you can develop on your host machine and the changes will automatically propogate to the jekyll server.

You can start jekyll by running

```bash
$ vagrant ssh
$ ./scripts/server
```
and you can log into the jekyll container by running
```bash
$ vagrant ssh
$ ./scripts/console
```
