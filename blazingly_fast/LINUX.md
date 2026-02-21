# Blazingly Fast Linux/Arch/Hyprland Commands

## Navigation, File Ops & Archiving

- `ls -lahSr` lists all files, human-readable, sorted by size (largest last).
- `cd -` jumps back to your previous directory.
- `mkdir -p /path/to/nested/dir` creates a directory and all its parent directories.
- `rm -rf [dir]` forcefully removes a directory and its contents recursively.
- `cp -a [source] [dest]` copies directories preserving exact permissions, ownership, and timestamps.
- `mv [source] [dest]` moves or renames a file/directory.
- `ln -s [target] [link_name]` creates a symbolic link (shortcut) to a file or directory.
- `tree -L 2` shows directory structure in a tree format, limited to 2 levels deep.
- `find . -type f -name "*.go" -mtime -7` finds Go files modified in the last 7 days.
- `fd [pattern]` (modern `find` alternative) searches extremely fast, respects `.gitignore`.
- `tar -czvf archive.tar.gz [dir]` compresses a directory into a gzip tarball.
- `tar -xzvf archive.tar.gz` extracts a gzip tarball into the current directory.
- `rsync -avzP [source]/ [dest]/` synchronizes directories efficiently, showing progress and allowing resume.

## Viewing Text, Logs & Live Monitoring

- `cat [file]` prints the entire file to standard output.
- `bat [file]` (modern `cat`) prints with syntax highlighting and Git integration.
- `less -S [file]` opens a file for paginated viewing, chopping long lines instead of wrapping (Vim keys to move).
- `tail -n 100 [file]` prints the last 100 lines of a file.
- `tail -F [log_file]` strictly follows a file by name, even if it gets rotated or recreated by a logger.
- `head -n 20 [file]` prints the first 20 lines.
- `watch -n 2 '[command]'` runs a command every 2 seconds and displays the output fullscreen (great for `kubectl get pods` or `docker ps`).
- `dmesg -w` prints and follows kernel ring buffer logs (hardware, drivers, boot issues).

## Text Processing & Sorcery (Piping & Regex)

- `grep -rnE "pattern1|pattern2" /path/` searches recursively for extended regex matches.
- `rg "pattern" -t csharp` (ripgrep) searches only within C# files insanely fast.
- `[command] | awk -F':' '{print $1}'` splits output by colon `:` and prints the first column.
- `[command] | sed 's/old/new/g'` replaces all occurrences of "old" with "new".
- `[command] | tr 'a-z' 'A-Z'` translates all lowercase letters to uppercase.
- `[command] | sort -nr` sorts the output numerically and in reverse.
- `[command] | sort | uniq -c | sort -nr` counts duplicate lines and orders them by frequency.
- `[command] | xargs [other_command]` takes the output of the first command and passes it as arguments to the second (e.g., `find . -name "*.bak" | xargs rm`).
- `[command] | tee [file]` prints output to the terminal AND writes it to a file simultaneously.
- `[command] | wl-copy` (Wayland) or `xclip -sel c` (X11) pipes terminal output directly into your system clipboard.

## System, Processes & Resource Management

- `top` / `htop` / `btop` provides an interactive process viewer.
- `ps aux --sort=-%mem` lists all processes, sorted by highest memory usage first.
- `pgrep -a [name]` lists the PIDs and full command lines of running processes matching a name.
- `kill -15 [PID]` sends a SIGTERM (graceful shutdown) to a process.
- `kill -9 [PID]` sends a SIGKILL (brutal, immediate termination).
- `killall [name]` kills all processes with a specific name.
- `bg` and `fg` moves a suspended process (paused via `Ctrl+z`) to the background or foreground.
- `jobs` lists the active background jobs in the current shell.
- `df -Th` shows disk space usage and the filesystem type (ext4, btrfs, etc.).
- `du -sh * | sort -hr` calculates the size of all items in the current directory and sorts them by largest.
- `free -h` shows available and used RAM in human-readable format.
- `uptime` shows how long the system has been running and the 1, 5, and 15-minute load averages.
- `strace -p [PID]` traces system calls and signals for a running process (ultimate low-level debugging).

## Networking

- `ping [host]` checks basic ICMP connectivity.
- `mtr [host]` combines ping and traceroute into a dynamic, real-time routing diagnostic tool.
- `curl -I [url]` fetches only HTTP headers.
- `curl -v [url]` fetches with verbose output (shows TLS handshake, request headers, etc.).
- `ss -tulpn` shows all listening TCP/UDP ports and the PIDs/processes attached to them.
- `lsof -i :8080` lists exactly what process and user is holding port 8080 open.
- `ip a` shows all IP addresses and network interfaces.
- `ip route` shows the system's routing table (find your default gateway).
- `dig +short [domain] [record_type]` performs a clean DNS lookup (e.g., `dig +short google.com TXT`).
- `nc -zv [host] [port]` (netcat) tests if a specific port is open without sending payload data.
- `sudo tcpdump -i any port 80 or port 443` sniffs raw packet traffic across all interfaces for HTTP/HTTPS.

## Permissions, Users & Ownership

- `chmod +x [script.sh]` makes a script executable.
- `chmod 755 [dir]` gives owner rwx, and group/others r-x.
- `chmod 600 [file]` sets strict permissions (owner read/write only, essential for SSH keys).
- `chown -R [user]:[group] [dir]/` recursively changes the owner and group of a directory.
- `usermod -aG [group] [user]` appends a user to a supplementary group (e.g., adding yourself to the `docker` group).
- `id` shows your current user ID, primary group, and supplementary groups.

## Arch Linux Mastery (pacman & yay)

- `sudo pacman -Syu` syncs and fully updates the system.
- `sudo pacman -S [package]` installs a package.
- `sudo pacman -Rs [package]` removes a package and its unused dependencies.
- `sudo pacman -Scc` aggressively cleans the local package cache to free up disk space.
- `sudo pacman -U [file.pkg.tar.zst]` installs a downloaded package file manually.
- `sudo pacman -Rns $(pacman -Qdtq)` completely cleans out all orphaned packages.
- `pacman -Ql [package]` lists every single file installed by a specific package.
- `yay -Syu` updates standard packages AND AUR packages.

## Systemd (Advanced Service Management)

- `sudo systemctl start/stop/restart [service]` manages service state.
- `sudo systemctl enable --now [service]` enables a service to start on boot AND starts it immediately.
- `sudo systemctl status [service]` checks running state and recent logs.
- `sudo systemctl daemon-reload` reloads systemd to pick up changes to `.service` config files.
- `sudo systemctl list-units --type=service --state=running` lists all actively running services.
- `systemd-analyze blame` prints a list of all running units, ordered by the time they took to initialize on boot.
- `journalctl -u [service] -f` follows live logs for a specific service.
- `journalctl --since "1 hour ago"` views logs from the entire system over the last hour.
- `journalctl -xeu [service]` jumps to the end of a specific service's logs with extra explanatory text (crucial for finding exactly why your Go worker crashed).

## Hyprland Workspace Controls

- `hyprctl clients` lists all running windows/clients and their workspace IDs.
- `hyprctl activewindow` returns details about the currently focused window.
- `hyprctl dispatch workspace [ID]` switches to a specific workspace from the command line.
- `hyprctl dispatch movetoworkspace [ID]` moves the currently focused window to a different workspace.
- `hyprctl dispatch exec [command]` launches an application directly through Hyprland's dispatcher.
- `hyprctl reload` instantly reloads the `hyprland.conf` configuration.
