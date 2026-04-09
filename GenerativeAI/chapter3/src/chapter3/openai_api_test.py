import os
from openai import OpenAI
from dotenv import load_dotenv

# .envを読み込む
load_dotenv()

# OpenAIクライアントの初期化
client = OpenAI(api_key=os.getenv("OPENAI_API_KEY"))


try:
    # テスト用プロンプト
    response = client.chat.completions.create(
        model="gpt-5-nano",
        messages=[]
    )

    print("API接続成功")
    print(f"Response: {response.choices[0].message.content}")

except Exception as e:
    print(f"API接続エラー: {str(e)}")




