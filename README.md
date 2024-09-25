# bonsai-linux-environment-template

This repo is a version of the Bonsai.EnvironmentTemplate that supports automatic creation of bonsai environments on Linux. It adds an activation and deactivation script which places a convenient alias to bonsai in the command prompt when activated. The tool has only been tested on Ubuntu 22.04, and may require modifications to work on other operating systems.

### Installation

Requirements:

- [dotnet-sdk](https://dotnet.microsoft.com/en-us/download)
- [mono](https://www.mono-project.com/docs/getting-started/install/linux/)
- [xmllint](https://packages.debian.org/buster/libxml2-utils) for using Bonsai <= 2.8.3.
- [xmlstarlet](https://packages.debian.org/buster/xmlstarlet) for using Bonsai <= 2.8.3.

> [!NOTE]
> The latest versions of Bonsai do not require the [xmllint](https://packages.debian.org/buster/libxml2-utils) and [xmlstarlet](https://packages.debian.org/buster/xmlstarlet) packages, since the issue of OS-dependent paths in the Bonsai.config file was solved in the Bonsai 2.8.4 release. See discussion of the issue [here](https://github.com/bonsai-rx/bonsai/pull/1893).

> [!TIP]
> You can install `xmllint` and `xmlstarlet` on Ubuntu with the following:
> ```cmd
> sudo apt install -y libxml2-utils xmlstarlet
> ```

Clone the repo:

```cmd
git clone https://github.com/ncguilbeault/bonsai-linux-environment-template.git
```

Change directory to template folder:

```cmd
cd /path/to/bonsai-linux-environment-template
```

Install dotnet template:

```cmd
dotnet new install Bonsai.LinuxEnvironmentTemplate
```

To setup a bonsai linux environment in a specific repo, use:

```cmd
dotnet new bonsaienvl
```

When prompted to run the `Setup.sh` script, enter yes. This will create a localized bonsai environment in a hidden subfolder called `.bonsai`.

> [!TIP]
> If you append the `--allow-scripts yes` flag to the command above, this will automatically execute the startup script without requiring additional input

You can then activate this bonsai environment, similar to how you would activate a python environment by running:

```cmd
source .bonsai/activate
```

You should see that the bonsai environment has been created. The following aliases are then added to the list of terminal commands:

- `bonsai` -> run bonsai in mono. You can pass standard arguments to the bonsai exe as well.
- `bonsai-clean` -> run bonsai in mono with a default theme. This overrides the default behavior of mono to try to use the Linux system theme to display the application.
- `deactivate` -> deactivates the bonsai environment.

> [!TIP]
> Activation of the bonsai environment can be used together with python virtual environments, but note that the python venv must be activated **first** before activating the bonsai environment, otherwise it will not work. Deactivating envronments will follow the reverse order in which the environments were activated.

You can specify the version of Bonsai you wish to install using:

```cmd
dotnet new bonsaienvl --version latest // this uses the latest release version, or
dotnet new bonsaienvl --version 2.8.5 // specify the exact version of bonsai to install
```

By default, the tool will not add a `.vscode/launch.settings` file. If added, this file tells vscode how to run the C# debugger with the bonsai executable. You can add this to your repo when creating the template using:

```cmd
dotnet new bonsaienvl --include-vscode-debugger-config true
```
