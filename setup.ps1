winget install --id Microsoft.Powershell
# Call update-path.ps1 in this folder
. $PSScriptRoot\update-path.ps1

git config --global --add safe.directory E:/build/terminalbuild2024demo/
git config --global --add safe.directory E:/build/terminalbuild2024demo/terminal/settings/terminal
git config --global --add safe.directory E:/build/sudo

# Delete .\mike\terminal-1.21.1161.0\settings\terminal if it exists, and create a new one
Remove-Item -Recurse -Force $PSScriptRoot\terminal\settings\terminal
New-Item -ItemType Directory -Path $PSScriptRoot\terminal\settings\terminal
Remove-Item -Recurse -Force $PSScriptRoot\terminal\settings\terminal-docs
New-Item -ItemType Directory -Path $PSScriptRoot\terminal\settings\terminal-docs

# Clone the Terminal repo into .\mike\terminal-1.21.1161.0\settings\terminal
git clone https://github.com/microsoft/terminal.git $PSScriptRoot\terminal\settings\terminal
git clone https://github.com/microsoftdocs/terminal.git $PSScriptRoot\terminal\settings\terminal-docs
