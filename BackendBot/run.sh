#!/usr/bin/env bash
# Mac / Linux launcher:  bash run.sh
cd "$(dirname "$0")"

if [ ! -f .env ]; then
  echo "==== First-time setup ===="
  read -r -p "Paste your bot token from BotFather: " BOT_TOKEN
  read -r -p "Paste your Telegram numeric ID: " ADMIN_ID
  printf 'BOT_TOKEN=%s\nADMIN_ID=%s\n' "$BOT_TOKEN" "$ADMIN_ID" > .env
fi

if [ ! -d .venv ]; then
  echo "Creating Python environment..."
  python3 -m venv .venv || { echo "Could not create Python environment."; exit 1; }
fi

echo "Checking and installing required packages..."
.venv/bin/python -m pip install -r requirements.txt || { echo "Install failed."; exit 1; }

echo "Starting the bot... Press Ctrl+C to stop."
.venv/bin/python bot.py
