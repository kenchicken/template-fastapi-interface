---
to: <%= rootDirectory %>/docker-compose.yaml
force: true
---
version: '3'
services:
  app:
    build: .
    volumes:
      - .dockervenv:/src/.venv
      - .:/src
    ports:
      - 8000:8000  # ホストマシンのポート8000を、docker内のポート8000に接続する
    environment:
      - WATCHFILES_FORCE_POLLING=true  # 環境によってホットリロードのために必要
  db:
    image: mysql:8.0
    platform: linux/x86_64  # AppleシリコンのMac（M1/M2など）の場合必要
    environment:
      MYSQL_ALLOW_EMPTY_PASSWORD: 'yes'  # rootアカウントをパスワードなしで作成
      MYSQL_DATABASE: 'demo'  # 初期データベースとしてdemoを設定
      TZ: 'Asia/Tokyo'  # タイムゾーンを日本時間に設定
    volumes:
      - mysql_data:/var/lib/mysql
    command: --default-authentication-plugin=mysql_native_password  # MySQL8.0ではデフォルトが"caching_sha2_password"で、ドライバが非対応のため変更
    ports:
      - 33306:3306  # ホストマシンのポート33306を、docker内のポート3306に接続する
volumes:
  mysql_data:
