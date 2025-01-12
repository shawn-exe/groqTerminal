source .env
USER_INPUT="$*"
USER_INPUT=$(echo "$USER_INPUT" | sed 's/"/\\"/g' | sed ':a;N;$!ba;s/\n/\\n/g')

if [ -z "$USER_INPUT" ]; then
    echo "usage: groq Enter your question.."
    exit 1
fi

curl -s "https://api.groq.com/openai/v1/chat/completions" \
-X POST \
-H "Content-Type: application/json" \
-H "Authorization: Bearer $API_KEY" \
-d "{\"messages\": [{\"role\": \"user\", \"content\": \"$USER_INPUT\"}], \"model\": \"llama-3.3-70b-versatile\", \"temperature\": 1, \"max_tokens\": 1024, \"top_p\": 1, \"stream\": true, \"stop\": null}" | python3 resFormatter.py
