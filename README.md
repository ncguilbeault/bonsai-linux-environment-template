# bonsai-linux-environment-template

This repo is a version of the Bonsai.EnvironmentTemplate that supports automatic creation of bonsai environments in a linux OS. It adds an activation and deactivation script which places a convenient alias to bonsai in the command prompt when activated.

### Installation

Requirements:

- [dotnet-sdk](https://dotnet.microsoft.com/en-us/download)
- [powershell on linux](https://learn.microsoft.com/en-us/powershell/scripting/install/installing-powershell-on-linux?view=powershell-7.4)
- [mono](https://www.mono-project.com/docs/getting-started/install/linux/)

Clone the repo:

`git clone https://github.com/ncguilbeault/bonsai-linux-environment-template.git`

Change directory to template folder:

`cd /path/to/bonsai-linux-environment-template`

Install dotnet template:

`dotnet new install Bonsai.LinuxEnvironmentTemplate`

To setup a bonsai linux environment in a specific repo, use:

`dotnet new bonsaienvl -o .bonsai`

When prompted to run the `Setup.sh` script, enter yes. This will create a localized bonsai environment in a hidden subfolder called `.bonsai`.

You can then activate this bonsai environment, similar to how you would activate a python environment by running:

`source .bonsai/activate`

You should see that the bonsai environment has been created. The following aliases are then added to the list of terminal commands:

- `bonsai` -> run bonsai in mono. You can pass standard arguments to the bonsai exe as well.
- `bonsai-clean` -> run bonsai in mono with a default theme. This overrides the default behavior of mono to try to use the Linux system theme to display the application.
- `deactivate` -> deactivates the bonsai environment.

> [!TIP]
> Activation of the bonsai environment can be used together with python virtual environments, but note that the python venv must be activated **first** before activating the bonsai environment, otherwise it will not work. Deactivating envronments will follow the reverse order in which the environments were activated.

