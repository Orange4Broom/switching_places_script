# Switching Places Script

This project provides a script to switch between different Git configurations (work and home) easily.

## Table of Contents

- [Getting Started](#getting-started)
- [Usage](#usage)
- [Custom Command Setup](#custom-command-setup)
- [Examples](#examples)

## Getting Started

### Prerequisites

- Git must be installed on your system.
- Bash shell (Linux, macOS, or Git Bash on Windows).

### Cloning the Repository

To clone the repository, run the following command:

```sh
git clone https://github.com/yourusername/switching_places_script.git
cd switching_places_script
```

## Usage

### Running the Script

To run the script, navigate to the `scripts` directory and execute the `switch.sh` script:

```sh
cd scripts
./switch.sh
```

The script will prompt you to choose between switching to work or home Git configurations and whether to apply the changes globally or locally.

### Setting Up Custom Command

You can set up a custom command to run the script more conveniently. Follow these steps:

1. Open your shell configuration file (e.g., `.bashrc`, `.zshrc`, or `.bash_profile`) in a text editor.
2. Add the following alias to the file:

```sh
alias yk='~/path/to/switching_places_script/scripts/switch.sh'
```

Replace `~/path/to/switching_places_script` with the actual path to the cloned repository.

3. Save the file and reload the shell configuration:

```sh
source ~/.bashrc  # or source ~/.zshrc, source ~/.bash_profile
```

Now you can run the script using the custom command `yk`.

## Examples

### Example 1: Switching to Work Configuration

```sh
$ ./switch.sh
Current Git Configuration:
user.name=CurrentUser
user.email=currentuser@example.com
Vyber jestli chceš přepnout na work (w) nebo home (h)
> w
Do you want to change the global configuration? (y/n)
> y
Přepínám na work
Přepnuto na work
Updated Git Configuration:
user.name=Jakub Trnčák
user.email=trncak@rtsoft.cz
```

### Example 2: Switching to Home Configuration

```sh
$ ./switch.sh
Current Git Configuration:
user.name=CurrentUser
user.email=currentuser@example.com
Vyber jestli chceš přepnout na work (w) nebo home (h)
> h
Do you want to change the global configuration? (y/n)
> n
Přepínám na home
Přepnuto na home
Updated Git Configuration:
user.name=Orange4Broom
user.email=orang4broom@gmail.com
```

### Example 3: Using Custom Command

```sh
$ yk
Current Git Configuration:
user.name=CurrentUser
user.email=currentuser@example.com
Vyber jestli chceš přepnout na work (w) nebo home (h)
> w
Do you want to change the global configuration? (y/n)
> y
Přepínám na work
Přepnuto na work
Updated Git Configuration:
user.name=Jakub Trnčák
user.email=trncak@rtsoft.cz
```

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Acknowledgments

- Thanks to the Git community for providing excellent tools and documentation.
```

### Explanation:
- **Getting Started**: Instructions on prerequisites, cloning the repository, and navigating to the project directory.
- **Usage**: Instructions on how to run the script and set up a custom command.
- **Examples**: Examples of running the script and using the custom command.
- **License**: Placeholder for license information.
- **Acknowledgments**: Placeholder for acknowledgments.
