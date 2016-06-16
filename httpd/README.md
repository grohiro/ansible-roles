# httpd

Apacheのインストールと設定。ドキュメントルートは定義しないので `conf.d/` 下にバーチャルホストの設定を追加すること。

## Vars

`httpd_listen` - Listen ディレクティブ (Optional: 80)

### SSL

SSL を有効にするには `httpd_ssl_enable: True` をセットする。
証明書は手動でアップロードする。

`httpd_ssl_enable` - /etc/httpd/conf.d/ssl.conf をインストールする

`httpd_ssl_servername` - SSL対応ドメイン

`httpd_ssl_document_root` - SSLドキュメントルート

`httpd_ssl_cert` - サーバ証明書のパス（サーバサイドのパス）

`httpd_ssl_key` - サーバキーファイルのパス（サーバサイドのパス）

`httpd_ssl_chain` - 中間証明書のパス（サーバサイドのパス）

## Modules

`httpd_module_webdav` - WebDAV モジュールを有効にする (boolean)
`httpd_module_proxy` - mod_proxy モジュールを有効にする (boolean)

## 設定ファイルサンプル

playbook.yml

```
tasks:
  - name: VirtualHost
    template: src=templates/site.conf dest=/etc/httpd/conf.d/
    notify:
      - Restart httpd
```

host_vars/prod.yml

```
httpd_ssl_enable: True
httpd_ssl_cert: /etc/httpd/ssl/example.com.crt
httpd_ssl_key: /etc/httpd/ssl/example.com.key.nopass
httpd_ssl_chain: /etc/httpd/ssl/inca.crt
httpd_ssl_servername: example.com
httpd_ssl_document_root: /var/www/html/
```

vhost.conf

```
<VirtualHost *:80>
  ServerName {{ dev_server_name }}
  DocumentRoot /var/www/webapp/site/public

  ErrorLog logs/example.jp-error_log
  CustomLog logs/example.jp-access_log combined

  <Directory /var/www/webapp/site>
    AllowOverride all
    Order allow,deny
    Allow from all
  </Directory>

  SetEnv LARAVEL_ENV {{ laravel_env }}
</VirtualHost>
```

install_ssl.yml

```
---
- hosts: all
  sudo: yes
  vars:
  tasks:
    - name: Install SSL files
      copy: src=files/ssl/{{ item }} dest=/etc/httpd/ssl/ mode=0644
      with_items:
        - example.com.crt
        - example.com.key.nopass
        - inca.crt
```
