#!/bin/bash

if nc -z localhost 6005 2>/dev/null; then
    echo "✓ Godot LSP server is running on port 6005"
    exit 0
else
    echo "⚠ Godot LSP server not detected on port 6005"
    echo "  Please start Godot Editor with your project open."
    echo "  LSP settings: Editor > Editor Settings > Network > Language Server"
    exit 0
fi
