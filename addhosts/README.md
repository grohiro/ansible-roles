# addhosts
Add hosts to /etc/hosts.

## Vars

`addhosts_list` - An array of hosts.

## Usage

```
- role: addhosts
  addhosts_list:
    - host: "127.0.0.1  localhost"
      state: present
    - host: "127.0.0.1  www.dev-machine.com"
      state: present
  
```
