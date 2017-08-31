# postfix

Install Postfix (SMTP server).

## Vars

- `postfix_myhostname`
- `postfix_mynetworks_style`

### Vagrant
Role for vagrant in a development environment.

```
- role: postfix
  postfix_myhostname: your-domain.example.com
  postfix_mynetworks_style: subnet
```