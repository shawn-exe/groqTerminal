# *groqTerminal </>* 

A lightweight command-line interface enabling seamless AI conversations directly from your terminal, built using *llama-3.3-70b-versatile*.  

Works only in *linux* or any *bash* compatible environment

## Features
- **Interactive Mode**: Start a continuous chat session with the AI using `groq -c`
- **Single Query Mode**: Quick one-off questions using `groq "your question"`
- **Clean Output**: Formatted responses with real-time streaming
- **Global Access**: Run from any directory in your system

---

## Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/yourusername/groqTerminal.git
   ```

2. Set up your environment:
   ```bash
   mkdir -p ~/bin
   cp call_groq.sh ~/bin/groq
   cp resFormatter.py ~/bin/
   chmod +x ~/bin/groq
   ```

3. Create your `.env` file:
   ```bash
   echo "API_KEY=your_api_key_here" > ~/.env
   ```

4. Add the `groq` command to your PATH (add this line to `~/.bashrc` or `~/.zshrc`):
   ```bash
   export PATH="$HOME/bin:$PATH"
   ```
   Then reload your shell:
   ```bash
   source ~/.bashrc
   ```

---

## Usage

### Interactive Mode
Start a continuous chat session with the AI:
```bash
groq -c
```
Example:
```
<< What is Python?
```

### Single Query Mode
Run a quick one-off question:
```bash
groq Write a function to calculate Fibonacci numbers
```
---

## Requirements

- Python 3.x
- `curl`
- Bash shell
- groq API key

---

## Credits

Built with groq's powerful LLM API

Made with ❤️ by Shawn Salis
