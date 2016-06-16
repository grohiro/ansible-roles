# secure_sshd

sshd をセキュアな設定にする。

## Vars

- `secure_sshd_allow_users`
  - sshd 接続を許可するユーザを制限する。
  - 設定を削除する場合はこの変数を未定義にしてください。

## Usage

```
- role: secure_sshd
  secure_sshd_allow_users: developer
```

## sshd_config

/etc/ssh/sshd_config

```
PubkeyAuthentication yes
PermitRootLogin no
PasswordAuthentication no
AllowUsers {{ secure_sshd_allow_users }}
```