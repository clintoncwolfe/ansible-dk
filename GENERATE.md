# ansible-dk generate

An ansible-dk cli subcommand for generating skeleton Ansible code layouts

### Usage:
>$ ansible-dk generate repo foo

Would generate a skeleton ansible repo named foo by running a generator playbook
located at /opt/ansible-dk/generators/default/repo.yml

Note: The default generators are still in development and in most cases don't do anything yet.

### Custom Generators
You can supply custom generator playbooks.  This can be done with a cli arg:
>$ ansible-dk generate repo -g /path/to/my/generators foo

This would generate an ansible repo named foo using a playbook at /path/to/my/generators/repo.yml

You can also set this in a config file so you won't have to pass it to the cli every time.
Add something like this to ~/.ansible-dk/config.yml:
```
---
generator: /path/to/my/generators
```

### Variables
By default all generator playbooks are passed a variable of [thing]_name.  Example:  repo_name
You can add custom variables to run with your playbooks in the same format you'd pass them to `ansible-playbooks`:
>$ ansible-dk generate repo foo -e foo=bar -e bar=foo
