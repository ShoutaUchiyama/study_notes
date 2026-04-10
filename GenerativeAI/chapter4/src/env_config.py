import os
from dotenv import load_dotenv

# .envファイルを読み込み
load_dotenv()

# APIキーが正しく読み込まれているか確認
api_key = os.getenv("OPENAI_API_KEY")
if api_key:
    print("OpenAI APIキーが正しく設定されています")
else:
    print("OpenAI APIキーが設定されていません")