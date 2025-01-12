#!/bin/bash
source .env

curl -s "https://api.groq.com/openai/v1/chat/completions" \
-X POST \
-H "Content-Type: application/json" \
-H "Authorization: Bearer $API_KEY" \
-d "{\"messages\": [{\"role\": \"user\", \"content\": \"Hello, how are you?\"}], \"model\": \"llama-3.3-70b-versatile\", \"temperature\": 1, \"max_tokens\": 1024, \"top_p\": 1, \"stream\": true, \"stop\": null}" | python3 resFormatter.py

