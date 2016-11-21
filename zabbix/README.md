Zabbix (zabbix_agentd)
====

Zabbix agent をインストールします。

## vars


`zabbix_hostname`

- Zabbix server で認識するホスト名。

`zabbix_server`

- Zabbix server のホスト名またはIPアドレス。


## サンプル

Ansible

```
vars:
  zabbix_hostname: "my-website.example.com"
  zabbix_server: "zabbix-server.example.com"
roles:
  - zabbix

```

## 注意

エージェント側のポート `10050` の解放を忘れないこと。AWSならネットワークセキュリティのメニューからカスタムTCPルールで`10050`を通す設定をする。
