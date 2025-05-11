# telebot

TELEBOT

A Telegram bot displaying Kyiv time

Features

Show current time in Kyiv
Cross-platform support (Linux, Darwin, Windows)
Multi-architecture support (amd64, arm64)
Docker containerization support

Prerequisites

Docker (optional, for containerization)
Telegram Bot Token (set as TELE_TOKEN environment variable)
Required Go packages:

    github.com/spf13/cobra
    github.com/stianeikeland/go-rpio
    gopkg.in/telebot.v4

Usage

Start the bot:
./telebot start

Development
The project uses Cobra for CLI command management

Project Structure


cmd/ - Contains the main command implementations
        telebot.go - Main bot implementation and traffic light control
        root.go - Root command configuration
        version.go - Version command implementation
