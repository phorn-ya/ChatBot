YA BEAUTY SHOP - TELEGRAM BOT
=============================

RUN IT (Windows)
  1. Install Python from python.org (tick "Add Python to PATH").
  2. Double-click  run.bat
  3. First time only: paste your bot token and your Telegram ID when asked.
  4. When you see "Bot is running", test it from a SECOND Telegram account.
  Keep the window open. Closing it stops the bot.

RUN IT (Mac / Linux)
  bash run.sh

WHERE TO GET THE 2 VALUES
  Bot token : BotFather -> /mybots -> your bot -> API Token
  Your ID   : message @userinfobot (use the account that receives orders)
  Also open your bot with that account and tap Start.
  Keep the token private. Never share .env or post it.

ENABLE AI REPLIES
  1. Create an OpenAI API key in your OpenAI API account. API usage may incur charges.
  2. Open the .env file in this folder with Notepad and add:
       OPENAI_API_KEY=your_api_key
  3. Save .env and restart the bot.
  AI answers shop questions using products.json and the FAQ. The customer's free-form
  question is sent to OpenAI; checkout details and order history are not sent. Ask
  customers not to include sensitive personal information in AI questions. Customers
  tap "Ask a question" to start and can tap the seller button when they need a person.
  Keep the API key private; never paste it into chat.

BUTTON MENU
  The bot uses Telegram inline buttons for language, browsing products, quantity,
  order confirmation, FAQs, and seller contact. Customers type only their question
  after tapping "Ask a question". At checkout, customers send their name, phone,
  and full delivery address together in one message, using the prompted format.
  Used product and checkout buttons are removed as the customer moves through the flow,
  keeping old choices from cluttering the conversation.

ABA PAYMENT
  After an order is confirmed, the bot sends the ABA KHQR image (aba_qr.png) with
  the order total. Ask customers to pay the exact USD total and verify the recipient
  name is YA PHORN before confirming. They send a payment screenshot back to the bot.
  Keep aba_qr.png in the same folder as bot.py.

EDIT YOUR SHOP
  products.json : products, prices, descriptions (English + Khmer).
                  Photos: put the image file in this folder and write
                  its file name in "photo", e.g. "serum.jpg".
  bot.py (top)  : PAYMENT_INFO, DELIVERY times, FAQ text.
  Restart the bot (Ctrl+C, then run again) after any change.

FILES
  bot.py            the bot
  products.json     your products
  aba_qr.png        ABA KHQR image sent with payment instructions
  requirements.txt  libraries (installed automatically)
  run.bat / run.sh  one-click start
  orders.json       created automatically; all orders are saved here
  .env              created automatically; your token and ID (private)
                   add OPENAI_API_KEY here to enable AI replies

RESET SETUP
  Delete the .env file, then run again to enter new values.
