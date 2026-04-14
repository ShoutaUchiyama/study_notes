import os
from dotenv import load_dotenv
from langchain_openai import ChatOpenAI
from langchain_core.prompts import ChatPromptTemplate, MessagesPlaceholder
from langchain_core.runnables.history import RunnableWithMessageHistory
from langchain_community.chat_message_histories import ChatMessageHistory

load_dotenv()

llm = ChatOpenAI(
    model="gpt-5-nano",  # 必要なら gpt-5.4-nano に変更
    api_key=os.getenv("OPENAI_API_KEY")
)

prompt = ChatPromptTemplate.from_messages([
    ("system", "あなたは親切なアシスタントです。回答は200文字以内で簡潔にしてください。"),
    MessagesPlaceholder(variable_name="history"),
    ("human", "{input}")
])

chain = prompt | llm

store = {}

def get_session_history(session_id: str) -> ChatMessageHistory:
    if session_id not in store:
        store[session_id] = ChatMessageHistory()
    return store[session_id]

chain_with_history = RunnableWithMessageHistory(
    chain,
    get_session_history,
    input_messages_key="input",
    history_messages_key="history",
)

config = {"configurable": {"session_id": "abc123"}}

print("【1回目の会話】")
input_text1 = "こんにちは！私は田中といいます。普段はエンジニアとして働いています。趣味はキャンプです。"
response1 = chain_with_history.invoke(
    {"input": input_text1},
    config=config
)
print(f"ユーザー: {input_text1}")
print(f"アシスタント: {response1.content}")

print("\n【2回目の会話】")
input_text2 = "週末の過ごし方のアドバイスをください。"
response2 = chain_with_history.invoke(
    {"input": input_text2},
    config=config
)
print(f"ユーザー: {input_text2}")
print(f"アシスタント: {response2.content}")

print("\n【3回目の会話】")
input_text3 = "おすすめの本を教えてください。"
response3 = chain_with_history.invoke(
    {"input": input_text3},
    config=config
)
print(f"ユーザー: {input_text3}")
print(f"アシスタント: {response3.content}")