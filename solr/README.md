# Apache Solr

## Vars
```solr_extractdir``` - Solr のパッケージを展開するディレクトリ.
  '/usr/local' に設定されているときは solr-4.5.1.zip は '/usr/local/solr-4.5.1' に展開されます。

```solr_version``` - Solr バージョン

```solr_installdir``` - 展開したディレクトリのリンクパス. [/usr/local/solr]
``` ln -s {{solr_extractdir}}/solr-{{solr_version}} {{solr_installdir}}

