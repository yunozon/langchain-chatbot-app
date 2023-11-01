# ベースイメージとしてPython 3.10を使用
FROM python:3.10-slim-bullseye

# 環境変数でLISTEN_PORTを設定（HOSTは設定しない）
ENV LISTEN_PORT 8501

# 8080ポートを外部に公開
EXPOSE 8501

# 必要なPythonパッケージをインストール
# 事前にrequirements.txtをプロジェクトディレクトリに用意しておく
COPY ./requirements.txt /app/requirements.txt
RUN pip install --no-cache-dir --upgrade -r /app/requirements.txt

# 作業ディレクトリを設定
WORKDIR /app

# アプリケーションのコードと設定ファイルをコピー
COPY ./demo_app /app/demo_app
COPY ./.streamlit /app/.streamlit

# Streamlitアプリケーションを起動
CMD ["streamlit", "run", "demo_app/main.py", "--server.port", "8501"]
