## Neovim RC
This is my new RC (w).

### Known Issues
- **No module named `pylsp.plugins.rope_rename`**\
To fix this, create an empty file at the following location:\
`~/.local/share/nvim/mason/packages/python-lsp-server/venv/lib/python3.12/site-packages/pylsp/plugins/rope_rename.py`\
*Note*: The python3.12 part may vary depending on your installed Python version (e.g., python3.11)
