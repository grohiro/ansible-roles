# mysql57_community

Install MySQL 5.7 Community Edition from the MySQL yum repository.

[MySQL Yum repository](https://dev.mysql.com/downloads/repo/yum/)

**Notice**

- The `password_plugin` is uninstalled.
- The root password is set to be empty.

## Var

- `mysql57_community_log_dir` - Path of MySQL log directory [/var/log/mysql]
- `mysql57_community_bind_address` - IP address to bind MySQL [127.0.0.1]

## サンプル

```
roles:
  - role: mysql57_community
    mysql57_community_bind_address: 0.0.0.0
    
```

Vagrant上のMySQLサンプル。

```
vars:
  mysql57_community_bind_address: 0.0.0.0
roles:
  - role: mysql57_community
```

### Vagrantでの注意点

Vagrant のポートフォワードで MySQL に接続しているときは `bind-address` に `127.0.0.1` を指定すると接続できない。Vagrant 内のネットワーク経由で接続されるのでプライベートIPアドレス, または `0.0.0.0` を設定すること。

