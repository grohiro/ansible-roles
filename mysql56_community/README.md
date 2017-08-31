# mysql56_community

Install MySQL 5.6 Community Edition from the MySQL yum repository.

[MySQL Yum repository](https://dev.mysql.com/downloads/repo/yum/)

## Var

- `mysql56_community_log_dir` - Path of MySQL log directory [/var/log/mysql]
- `mysql56_community_bind_address` - IP address to bind MySQL [127.0.0.1]

## サンプル

```
roles:
  - role: mysql56_community
    mysql56_community_bind_address: 0.0.0.0
    
```

Vagrant上のMySQLサンプル。

```
vars:
  mysql56_community_bind_address: 0.0.0.0
roles:
  - role: mysql
```

### Vagrantでの注意点

Vagrant のポートフォワードで MySQL に接続しているときは `bind-address` に `127.0.0.1` を指定すると接続できない。Vagrant 内のネットワーク経由で接続されるのでプライベートIPアドレス, または `0.0.0.0` を設定すること。

