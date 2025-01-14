source .env

trap 'echo " "; exit' INT
sendrequest() {
    curl -s "https://api.groq.com/openai/v1/chat/completions" \
    -X POST \
    -H "Content-Type: application/json" \
    -H "Authorization: Bearer $API_KEY" \
    -d "{\"messages\": [{\"role\": \"user\", \"content\": \"$1\"}], \"model\": \"llama-3.3-70b-versatile\", \"temperature\": 1, \"max_tokens\": 1024, \"top_p\": 1, \"stream\": true, \"stop\": null}" | python3 /home/myubuntu/bin/resFormatter.py
}

interactivemode() {
    while true; do
        echo -n "<< "
        read -r USER_INPUT
        USER_INPUT=$(echo "$USER_INPUT" | sed 's/"/\\"/g' | sed ':a;N;$!ba;s/\n/\\n/g')
        sendrequest "$USER_INPUT"
        echo  " "
    done
}

if [ "$1" = "-c" ]; then
    interactivemode
else
    if [ -z "$*" ]; then
        echo "usage: groq Enter your question.."
        echo "groq -c for interactive mode.."
        exit 1
    fi
    USER_INPUT=$(echo "$*" | sed 's/"/\\"/g' | sed ':a;N;$!ba;s/\n/\\n/g')
    sendrequest "$USER_INPUT"
fi
