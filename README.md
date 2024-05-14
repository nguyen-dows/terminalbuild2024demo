---
title: Level up your Windows Terminal
description: Notes from the "Level up your Windows Terminal" talk at Microsoft Build 2024
author: zadjii-msft
ms.author: chrnguyen
ms.date: 5/14/2024
ms.topic: how-to
---

# Level up your Windows Terminal

## Profiles

For more info on configuring your profiles, see
[Profiles](https://learn.microsoft.com/en-us/windows/terminal/customize-settings/profile-general)
on Microsoft Learn.

## New tab menu

This settings file customizes the new tab dropdown menu to include folders for
the Terminal repos, all the WSLs, and Visual Studio. In the WSL folder, it
includes all the Canonical [fragment
profiles](https://learn.microsoft.com/en-us/windows/terminal/json-fragment-extensions)
as a separate dropdown nested within the WSL folder.

```jsonc
    "newTabMenu":
    [
        {
            "type": "remainingProfiles"
        },
        {
            "allowEmpty": false,
            "entries":
            [
                { "profile": "{94ccc889-2f98-5c0c-9d14-912b02ecc59f}", "type": "profile" },
                { "profile": "{e492b1ac-cbf7-5299-b261-8ed4e330d74a}", "type": "profile" }
            ],
            "icon": "%WT_SETTINGS_DIR%\\terminal\\res\\terminal.ico",
            "inline": "never",
            "name": "Terminal",
            "type": "folder"
        },
        {
            "allowEmpty": false,
            "entries":
            [
                { "source": "Windows.Terminal.Wsl", "type": "matchProfiles" },
                {
                    "allowEmpty": false,
                    "entries":
                    [
                        { "source": "CanonicalGroupLimited.Ubuntu18.04onWindows_79rhkp1fndgsc", "type": "matchProfiles" },
                        { "source": "CanonicalGroupLimited.Ubuntu20.04onWindows_79rhkp1fndgsc", "type": "matchProfiles" },
                        { "source": "CanonicalGroupLimited.Ubuntu22.04onWindows_79rhkp1fndgsc", "type": "matchProfiles" },
                        { "source": "CanonicalGroupLimited.Ubuntu_79rhkp1fndgsc", "type": "matchProfiles" }
                    ],
                    "icon": null,
                    "inline": "never",
                    "name": "Canonical",
                    "type": "folder"
                }
            ],
            "icon": "ms-appx:///ProfileIcons/{9acb9455-ca41-5af7-950f-6bca1bc9722f}.png",
            "inline": "never",
            "name": "WSLs",
            "type": "folder"
        },
        {
            "allowEmpty": false,
            "entries":
            [
                { "source": "Windows.Terminal.VisualStudio", "type": "matchProfiles" },
                { "profile": "{da29b8a9-e007-5b35-a0d3-d7a869ae486e}", "type": "profile" }
            ],
            "icon": null,
            "inline": "never",
            "name": "VS",
            "type": "folder"
        }
    ],
```

See [New tab dropdown](https://learn.microsoft.com/en-us/windows/terminal/customize-settings/appearance#new-tab-dropdown)

## Themes

```jsonc
    "theme": "Purple Titlebar",
    "themes":
    [
        {
            "name": "Purple Titlebar",
            "tab":
            {
                "background": "terminalBackground",
                "iconStyle": "default",
                "showCloseButton": "always",
                "unfocusedBackground": "#00000000"
            },
            "tabRow":
            {
                "background": "#5D50AE80",
                "unfocusedBackground": "#202020FF"
            },
            "window":
            {
                "applicationTheme": "dark",
                "experimental.rainbowFrame": true,
                "frame": null,
                "unfocusedFrame": null,
                "useMica": true
            }
        }
    ],
```

For more info on configuring your themes, see [Themes](https://learn.microsoft.com/en-us/windows/terminal/customize-settings/themes)

## Shell customization

### CMD

To replicate the prompt used in this demo, you can set your `PROMPT` variable to the following value:

```cmd
$e]133;D$e\$e]133;A$e\$e]9;9;$P$e\$e[107;30m[$T]$e[97;46m$P$e[36;49m$e[0m$_$e[0m$e[94m%username%$e[0m@$e[32m%computername%$e[0m$G$e]133;B$e\
```

This will also enable [Shell
Integration](https://learn.microsoft.com/en-us/windows/terminal/tutorials/shell-integration).
Alternatively, you can use the `cdd.cmd` script in this repo to change the
prompt to also include the git branch. Just add that to your PATH somewhere and
use that instead of `cd`.

### PowerShell

The easiest way to customize your PowerShell prompt is to use oh-my-posh. You can learn more here: [oh-my-posh](https://ohmyposh.dev/)

## Multiple actions & broadcasting to panes

Our example for creating multiple panes with different profiles all at once looked like the following:

```jsonc
        {
            "command":
            {
                "action": "multipleActions",
                "actions":
                [
                    {
                        "action": "newTab",
                        "colorScheme": "One Half Dark",
                        "profile": "Web Project"
                    },
                    {
                        "action": "splitPane",
                        "colorScheme": "Solarized Light",
                        "profile": "frontend",
                        "split": "right"
                    },
                    {
                        "action": "splitPane",
                        "colorScheme": "Campbell PowerShell",
                        "profile": "backend",
                        "split": "down",
                        "tabTitle": "Work"
                    }
                ]
            },
            "icon": "\ud83d\udcbb",
            "keys": "ctrl+3",
            "name": "Create My Workspace"
        },
```

In our examples, we've got three different profiles:
* `Web Project`
* `frontend`
* `backend`

and this will create a new tab with the `Web Project` profile, then split the
pane to the right with the `frontend` profile, and then split the pane down with
the `backend` profile.

Once we had those profiles open, we used the built-in `toggleBroadcastInput`
action to broadcast to all the panes at once.

For more info, see
* [`multipleActions`](https://learn.microsoft.com/en-us/windows/terminal/customize-settings/actions#run-multiple-actions)
* [`newTab`](https://learn.microsoft.com/en-us/windows/terminal/customize-settings/actions#new-tab)
* [`splitPane`](https://learn.microsoft.com/en-us/windows/terminal/customize-settings/actions#split-pane)
* [`toggleBroadcastInput`](https://learn.microsoft.com/en-us/windows/terminal/customize-settings/actions#broadcast-input)

## Right-click menu

To enable the right-click context menu, add the following to your settings:

```jsonc
    "experimental.rightClickContextMenu": true,
```

You can add that to individual profiles or to the defaults like so:

```jsonc
    "profiles":
    {
        "defaults":
        {
            "experimental.rightClickContextMenu": true
            // other settings here
        },
        "list": [
            // profiles here
        ]
```

For more info, see [Right-click context
menu](https://learn.microsoft.com/en-us/windows/terminal/customize-settings/profile-advanced#right-click-context-menu-preview)

## Sudo for Windows

See [Sudo for Windows](https://learn.microsoft.com/en-us/windows/sudo/) for more info on how to use `sudo` in Windows 11.

## Shell integration

Follow the guide at [Shell
Integration](https://learn.microsoft.com/en-us/windows/terminal/tutorials/shell-integration)
for how to enable shell integration for CMD, PowerShell, bash and other shells.

The following actions enable scrolling to prompts on <kbd>Ctrl+Up</kbd> and <kbd>Ctrl+Down</kbd>:

```json
        { "command": { "action": "scrollToMark", "direction": "next" }, "keys": "ctrl+down" },
        { "command": { "action": "scrollToMark", "direction": "previous" }, "keys": "ctrl+up" },
```


## Suggestions

In this demo, we used two different keybindings to show suggestions. The first
will only show suggestions from the history, powered by shell integration. The
second will also show snippets (`sendInput` actions).

```jsonc
        {
            "command": { "action": "showSuggestions", "source": "commandHistory", "useCommandline": true },
            "keys": "ctrl+shift+h"
        },
        {
            "command": { "action": "showSuggestions", "source": "all", "useCommandline": true },
            "keys": "ctrl+shift+y"
        },
```

For more info see [`showSuggestions`](https://learn.microsoft.com/en-us/windows/terminal/customize-settings/actions#suggestions)

For an example of creating snippets, you can see our saved `tar` commands here:

```json
        {
            "commands":
            [
                {
                    "command":
                    {
                        "action": "sendInput",
                        "input": "tar -xvzf {source.tar.gz}"
                    },
                    "name": "eXtract Ze File"
                },
                {
                    "command":
                    {
                        "action": "sendInput",
                        "input": "tar -xvzf {source.tar.gz} -C {destination_path}"
                    },
                    "name": "eXtract Ze File into path..."
                },
                {
                    "command":
                    {
                        "action": "sendInput",
                        "input": "tar -cvzf {destination.tar.gz} {source}"
                    },
                    "name": "Compress Ze File"
                }
            ],
            "name": "tar..."
        }
```

These will be nested under the `tar...` suggestion in the menu.
