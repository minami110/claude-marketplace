# gdscript-lsp

GDScript language server integration for Claude Code.

## Overview

This plugin enables Claude Code to connect to Godot Engine's built-in GDScript LSP (Language Server Protocol) server, providing code intelligence features such as:

- Go to definition
- Find references
- Hover documentation
- Symbol search
- Code completion support

## Prerequisites

### 1. Godot Editor Running

The Godot Editor must be running with your project open. The LSP server runs inside Godot Editor on port **6005** by default.

### 2. Enable LSP in Godot

Ensure the Language Server is enabled in Godot:
- Open Godot Editor
- Go to **Editor > Editor Settings > Network > Language Server**
- Verify that LSP is enabled and listening on port 6005

### 3. Enable LSP Tools in Claude Code

Claude Code requires the `ENABLE_LSP_TOOL=true` environment variable to use LSP features.

#### Set environment variable before launching Claude

```bash
ENABLE_LSP_TOOL=true npx @anthropic-ai/claude-code@2.0.67
```

## How It Works

When you start a Claude session, this plugin:

1. Checks if Godot LSP server is running on port 6005
2. Displays a status message indicating whether the server is available
3. Configures Claude Code to route `.gd` file requests to the Godot LSP server

## LSP Configuration

The plugin uses the following configuration (defined in `.lsp.json`):

- **Transport**: Socket connection
- **Host**: 127.0.0.1 (localhost)
- **Port**: 6005
- **Command**: `nc localhost 6005` (netcat)
- **File extension**: `.gd` → `gdscript` language

## Troubleshooting

### "Godot LSP server not detected on port 6005"

If you see this warning:

1. Ensure Godot Editor is running
2. Open a Godot project (LSP only runs when a project is open)
3. Check LSP settings in Godot Editor: **Editor > Editor Settings > Network > Language Server**
4. Verify the port is set to 6005

### LSP features not working

1. Verify `ENABLE_LSP_TOOL=1` is set (check with `echo $ENABLE_LSP_TOOL`)
2. Restart Claude Code after setting the environment variable
3. Check that the `.gd` file you're working with is part of an open Godot project

## License

MIT
