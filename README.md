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

In your repository, create a folder named `.devcontainer`. This folder will hold configuration files for your Codespace, enabling you to automatically install essential or useful tools every time you start a session.

Here's a sample configuration for `.devcontainer/devcontainer.json`, installing the tools [`valgrind`](https://github.com/ivosh/valgrind) and [`norminette`](https://github.com/42School/norminette):

```json
{
	"name": "Codespace - 42 Setup",
	"image": "mcr.microsoft.com/vscode/devcontainers/base:ubuntu-22.04",
	"postCreateCommand": "sudo apt-get update && sudo apt-get install -y valgrind && sudo apt-get install -y python3-pip && python3 -m pip install --upgrade pip setuptools norminette",
	"customizations": {
		"vscode": {
			"extensions": ["ms-python.python"]
		},
		"settings": {
			"python.pythonPath": "/usr/bin/python3"
		}
	}
}

```

## 3. Set Up Aliases for Custom Shortcuts
For custom commands and shortcuts, set up a dedicated repository for dotfiles in your GitHub account (naming it `dotfiles` is default, but you can use any name).
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

## 4. Synch Your Local VS Code Settings and Extensions

You can sync all the extensions and settings you use locally in VS Code with your Codespace.

To get your local VS Code extensions and settings with your Codespace:

- Log into your local VS Code with your GitHub account.
- Enable "**Settings Sync**" in VS Code.
- (Optional) Ensure that your extensions and settings are synced across both your local VS Code and Codespace by logging into GitHub in both environments.

This will sync your extensions and settings across your local environment and any Codespace you create, ensuring a consistent development experience.

## 5. Finalize the Setup
When creating a new Codespace that includes a `.devcontainer`, please wait until all post-create commands have finished executing.   
After the Codespace is ready, run the following command in the terminal to reload your aliases and environment settings:
```bash
source ~/.bashrc
```


