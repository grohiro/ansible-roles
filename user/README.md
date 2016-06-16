# User
ユーザを作成して環境を初期化する.

作成されるディレクトリ／ファイル

- ~/.ssh
- ~/.ssh/config
- ~/.ssh/authorized_keys

## Vars

`user_username` - ユーザ名

`user_ssh_pubkey` - authorized_keys に登録する公開鍵。

`user_sudo` - sudoers への登録する。

`user_groups` - ユーザにサブグループを追加する。

## Usage

playbook.yml

```
- role: user
  user_username: dev
  user_ssh_pubkey: /home/dev/.ssh/id_rsa.pub
  user_groups: "apache,www,ftp"
  user_sudo: True
```
