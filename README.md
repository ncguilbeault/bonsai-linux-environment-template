# bonsai-linux-environment-template

This repo is an updated version of the Bonsai.EnvironmentTemplate package which will allow automatic creation of bonsai environments in a linux OS. It adds an activation and deactivation script which places a convenient alias to bonsai in the command prompt when activated and is modelled after the python venv manager.


### Installation

Requirements:

- dotnet-sdk
- powershell on linux
- mono

Clone the repo:

`git clone https://github.com/ncguilbeault/bonsai-linux-environment-template.git`

Change directory to template folder:

`cd /path/to/bonsai-linux-environment-template`

Install dotnet template:

`dotnet new install Bonsai.LinuxEnvironmentTemplate`

To setup a bonsai linux environment in a specific repo, use:

`dotnet new bonsaienv -o .bonsai`

When prompted to run the `Setup.ps1` script, enter yes. This will create a localized bonsai environment in a hidden subfolder called `.bonsai`.

You can then activate this bonsai environment, similar to how you would activate a python environment by running:

`source .bonsai/activate`

You should see that the bonsai environment has been created. The following aliases are then added to the list of terminal commands:

- `bonsai` -> run bonsai in mono. You can pass standard arguments to the bonsai exe as well.
- `bonsai-clean` -> run bonsai in mono with a default theme. This is purely for convenience, since mono will try to use the Linux system theme to display the application. This can lead to strange visuals and makes bonsai overall more difficult to use.
- `deactivate` -> deactivates the bonsai environment and returns system variables to previous state.

One of the nice benefits of this is that it can be strung together in succession with python virtual environments, but note that the python venv must be activated **first** before activating the bonsai environment, otherwise it will not work. Deactivating envronments will follow the reverse order in which the environments were activated.
