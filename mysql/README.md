# MySQL

MySQL のインストール。

## Vars

`mysql_bind_address` - bind-address (Optional: 127.0.0.1)
`mysql_version` - インストールするMySQLのバージョン (5.6|未指定)

### /etc/my.conf

`mysql_bind_address` - bind-address (Optional: 127.0.0.1)

## サンプル

```
roles:
  - role: mysql
    
```

Vagrant上のMySQLサンプル。

```
vars:
  mysql_bind_address: 0.0.0.0
roles:
  - role: mysql
```

### Vagrantでの注意点

Vagrant のポートフォワードで MySQL に接続しているときは `bind-address` に `127.0.0.1` を指定すると接続できない。Vagrant 内のネットワーク経由で接続されるのでプライベートIPアドレス, または `0.0.0.0` を設定すること。
