# Setting Up GitHub Codespaces for Remote Development

GitHub Codespaces provides a flexible, powerful development environment that you can access from anywhere, even on low-end hardware.
Codespaces uses a "Visual Studio Code"-based interface and runs on an Ubuntu environment.   

Here’s a step-by-step guide to setting up Codespaces.

## 1. Get GitHub Pro Through 42

While you can use Codespaces without a Pro account, having one provides more compute time and extended resources.
If you're affiliated with 42, you can get GitHub Pro for free, which includes access to Codespaces with these enhanced resources.    

Follow [this link](https://github-portal.42.fr/login) to get GitHub Pro.

## 2. Configure the Development Environment

### Add a `.devcontainer` Folder

In your repository, create a folder named `.devcontainer`. This folder will hold configuration files for your Codespace, enabling you to automatically install essential tools every time you start a session.

Here's a sample configuration for `.devcontainer/devcontainer.json`, installing the tools [`valgrind`](https://github.com/ivosh/valgrind) and [`norminette`](https://github.com/42School/norminette):

```json
{
	"name": "Codespace - 42 Setup",  # Display name for your Codespace environment
	"image": "mcr.microsoft.com/vscode/devcontainers/python:3",  # Base image for the environment, using a pre-configured Python 3 (to use 'pip')
	"postCreateCommand": "sudo apt-get update && sudo apt-get install -y bc valgrind && sudo python3 -m pip install --upgrade pip setuptools && sudo python3 -m pip install norminette", # Install 'valgrind' and 'norminette' upon Codespace creation
	"extensions": [
		"ms-python.python"  # Install VS Code extension for Python (debugging, etc.)
	],
	"settings": {
		"python.pythonPath": "/usr/local/bin/python3"  # Sets 'Python 3' for all Python-related operations (e.g. 'pip' calls)
	}
}
```

## 3. Set Up Aliases for Custom Shortcuts
For custom commands and shortcuts, set up a dedicated repository for dotfiles in your GitHub account (naming it `dotfiles` is default, but you can use any name. This very repository is a one!).
In this repository, add a  `.bash_aliases` file for any command aliases you use frequently.   

Here’s an example:    

```bash
# Alias definitions

alias vg='valgrind --leak-check=full --show-leak-kinds=all --trace-children=yes --track-fds=yes'
alias vgt='valgrind --tool=helgrind'
alias vgg='vg --suppressions=./.assets/readline.supp'
```

Once you've created this file, go to  "**Settings → Codespaces → Automatically Install Dotfiles**" on GitHub and select the repository containing `.bash_aliases`.
This will load your customizations each time you start a new Codespace.

## 4. Finalize the Setup
After you create a Codespace, run the following command in the terminal to reload your aliases and environment settings:  
```bash
source ~/.bashrc
```

## 5. Synch Your Local VS Settings and Extensions

You can have all the extensions and settings you use locally in VS Code also available in your Codespace.

To get all the VS Code extensions and settings you have locally in your Codespace:

- Log into your local VS Code with your GitHub account.
- Enable "**Settings Sync**" in VS Code.
- (Optional: You can ensure that your extensions and settings are synced across both your local VS Code and Codespace by logging into GitHub in both environments.)

This will sync your extensions and settings across your local environment and any Codespace you create, giving you a consistent development experience.


