# rbenv

[ansible-rbenv-role](https://github.com/zzet/ansible-rbenv-role)

## Usage

Install rbenv and Ruby for `ansible_ssh_user`

```yml
- role: ansible-rbenv-role
  rbenv:
    env: user
    version: v1.1.0
    default_ruby: 2.2.7
    rubies:
      - version: 2.2.7
  rbenv_users:
    - "{{ ansible_ssh_user }}"
```
