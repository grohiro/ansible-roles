# MySQL

MYSQL のインスタンス作成ロール。MySQLサーバのセットアップは `mysql` ロール参照。

## Vars

- `mysqldb_dbname` - 作成するデータベース名 (Optional: "")
- `mysqldb_users` - 複数のユーザを追加する

**Deprecated**

- `mysqldb_user` - ユーザ名 **Deprecated**
- `mysqldb_user_host` - 接続ユーザのホスト名 (Optional: 127.0.0.1) **Deprecated**
- `mysqldb_password` - パスワード **Deprecated**

### Backup

- `mysqldb_backup` - バックアップするなら true
- `mysqldb_backup_dir` - バックアップファイル出力先

## サンプル

```
vars:
roles:
  - role: mysqldb
    mysqldb_dbname: webapp
    mysqldb_users:
      - user: webapp
        host: 10.%
        password: webapp
      - user: webapp
        host: localhost
        password: webapp
      - user: webapp
        host: "%"
        password: webapp
roles:
  - role: mysqldb
    mysqldb_dbname: webapp_test
    mysqldb_users:
      - user: webapp_test
        host: webapp_test
        password: webapp_test
```
Vagrant上のMySQLサンプル。

```
- role: mysql
  mysql_bind_address: 0.0.0.0
- role: mysqldb
  mysqldb_dbname: webapp
  mysqldb_users:
    - user: webapp
      password: webapp
      host: 10.%
    - user: webapp
      password: webapp
      host: localhost
    - user: webapp
      password: webapp
      host: "%"
```

### Vagrantでの注意点

Vagrant のポートフォワードで MySQL に接続しているときは `bind-address` に `127.0.0.1` を指定すると接続できない。Vagrant 内のネットワーク経由で接続されるのでプライベートIPアドレス, または `0.0.0.0` を設定すること。

