# gitdeploy

Git リポジトリから指定ブランチをチェックアウトします。

## サンプル


/var/www/webapp に git@github.com:your-repo/my-project.git/webapp のディレクトリをデプロイする。

```
- hosts: all
  sudo: yes
  vars:
    gitdeploy_dest: /var/www/webapp
    gitdeploy_repo: git@github.com:your-repo/my-project.git
    gitdeploy_ssh_key_src: files/git_deploy_key
    gitdeploy_ssh_key_dest: /var/www/git_deploy_key
    gitdeploy_branch: prod
    gitdeploy_force: true
    gitdeploy_composer_dir: webapp
    gitdeploy_script_dir: webapp/deploy

  roles:
    - role: gitdeploy
```


## Vars

`gitdeploy_repo` - Git リポジトリURI

`gitdeploy_ssh_key_src` - GitリポジトリにアクセスするためのSSH鍵コピー元パス

`gitdeploy_ssh_key_dest` - GitリポジトリにアクセスするためのSSH鍵コピー先パス

`gitdeploy_dest` - rsync でデプロイするディレクトリパス

`gitdeploy_user` - チェックアウトするユーザ (Optional: root)

`gitdeploy_branch` - チェックアウトするブランチ名 (Optional: master)

`gitdeploy_work` - チェックアウト先のディレクトリパス。最後にスラッシュを含めない。	 (Optional: /tmp/gitdeploy)

`gitdeploy_src` - デプロイ元のディレクトリ名。 `gitdeploy_work` 配下のディレクトリ。 (Optional: "")

`gitdeploy_force` - ワーキングディレクトリに変更されたファイルがあっても強制的にチェックアウトする (Optional: False)

`gitdeploy_composer_dir` - composer コマンドを実行するディレクトリパス。`gitdeploy_work` 配下のディレクトリ。 (Optional: "")

`gitdeploy_script_dir` - デプロイスクリプトディレクトリパス。`gitdeploy_work` 配下のディレクトリ。(Optional: deploy)

## デプロイスクリプト

Gitリポジトリにデプロイスクリプトを配置する。ファイルがないとデプロイエラーになる。

- deploy/pre_process.sh - ファイルを同期する前に実行される
- deploy/post_proces.sh - ファイルが同期された後に実行される
- deploy/rsync_exclude.txt - rsyncで同期から除外するファイルのリスト

pre_process.sh のサンプル。キャッシュをクリアして autoload ファイルを生成する。(Laravel 4.2)

```
#!/bin/bash# # デプロイ前に実行されるスクリプト# コマンド引数#   Gitチェックアウトディレクトリgitdeploy_work=$1cd $gitdeploy_work/webapp# Laravel 4.2artisan="php artisan"$artisan cache:clear$artisan dump-autoload
```

post_process.sh のサンプル。マイグレーションを実行する。（Laravel 4.2）


```
#!/bin/bash# # デプロイ後に実行されるスクリプト# コマンド引数#   Gitチェックアウトディレクトリ#   デプロイ先ディレクトリ   gitdeploy_work=$1gitdeploy_dest=$2artisan="php artisan"cd $gitdeploy_dest/webapp$artisan migrate
```

