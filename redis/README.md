# Redis

## Vars

- `redis_bind`: ListenするIPアドレス

## Vagrant

Port forwarding

```
config.vm.network "forwarded_port", guest: 6379, host: 9736
```