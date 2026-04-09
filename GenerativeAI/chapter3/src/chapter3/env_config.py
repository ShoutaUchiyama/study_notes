import os
from dotenv import load_dotenv

# .envファイルを読み込む
load_dotenv()

# APIキーが正しく読み込まれているか確認
def get_api_key():
    api_key = os.getenv("OPENAI_API_KEY")
    if api_key:
        print("OpenAI APIキーが正しく設定されている。")
    else:
        print("OpenAI APIキーが見つかりません")

get_api_key()
