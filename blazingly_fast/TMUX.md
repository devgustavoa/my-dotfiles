# Blazingly Fast Tmux Shortcuts

**Prefix Key:** `Ctrl + a` (Press and release before running most commands below)

## Global & Sessions

- `tmux new -s [name]` creates a new session with the given name (run from standard terminal).
- `tmux a -t [name]` attaches to an existing session (run from standard terminal).
- `tmux ls` lists all running tmux sessions (run from standard terminal).
- `Prefix + d` detaches from the current session (leaves it running in the background).
- `Prefix + $` renames the current session.
- `Prefix + r` reloads the `~/.tmux.conf` configuration instantly.
- `Prefix + Ctrl + l` clears the current panel.

## Windows (Tabs)

- `Prefix + c` creates a new window.
- `Prefix + ,` renames the current window.
- `Prefix + n` moves to the next window.
- `Prefix + p` moves to the previous window.
- `Prefix + 1...9` jumps to a specific window by number (Windows are indexed starting from 1).
- `Prefix + w` opens an interactive, navigable list of all windows and sessions.
- `Prefix + &` kills the current window.

## Panes (Splits)

- `Prefix + |` splits the window vertically (left/right).
- `Prefix + -` splits the window horizontally (top/bottom).
- `Prefix + h` moves to the left pane.
- `Prefix + j` moves to the bottom pane.
- `Prefix + k` moves to the top pane.
- `Prefix + l` moves to the right pane.
- `Prefix + Ctrl + h` resizes the current pane 10 cells to the left.
- `Prefix + Ctrl + j` resizes the current pane 10 cells down.
- `Prefix + Ctrl + k` resizes the current pane 10 cells up.
- `Prefix + Ctrl + l` resizes the current pane 10 cells to the right.
- `Prefix + x` kills the current pane.
- `Prefix + z` toggles pane zoom (makes the active pane fullscreen, press again to revert).
- `Prefix + q` briefly displays pane numbers.

## Copy Mode (Vim-style Editing)

- `Prefix + [` enters copy mode.
- `v` begins highlighting text (visual selection).
- `y` copies (yanks) the selected text.
- `Prefix + ]` pastes the copied text into a pane.
- `q` exits copy mode.
- _Note: Mouse support is enabled for scrolling and pane selection. Highlighting with the mouse will copy, but will not automatically drop you out of copy mode._
