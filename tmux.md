# tmux Basics

This document provides a quick reference for basic `tmux` commands to help you get started with terminal multiplexing.

## Getting Started

### Start a New Session
```
tmux
```
Start with a custom session name:
```
tmux new -s mysession
```

### Detach from a Session
```
Ctrl-b d
```

### List All Sessions
```
tmux ls
```

### Attach to a Session
```
tmux attach -t mysession
```

### Kill a Session
```
tmux kill-session -t mysession
```

---

## Pane Management

- **Split Vertically**: `Ctrl-b %`
- **Split Horizontally**: `Ctrl-b "`
- **Switch Between Panes**: `Ctrl-b` followed by an arrow key
- **Resize Panes**: `Ctrl-b` then hold `Ctrl` + arrow keys
- **Close Pane**: `exit` or `Ctrl-d`

---

## Window Management

- **Create New Window**: `Ctrl-b c`
- **Switch Between Windows**:
  - Next window: `Ctrl-b n`
  - Previous window: `Ctrl-b p`
- **Rename Window**: `Ctrl-b ,`
- **Close Window**: `exit`

---

## Tips

- Use named sessions for easier management when using multiple sessions.
- Customize key bindings and behavior in your `~/.tmux.conf`.

---

## Resources

- Official site: https://github.com/tmux/tmux
- Man page: `man tmux`
