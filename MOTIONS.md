# Blazingly Fast Vim Motions

## Global

- `:h[elp] keyword` opens help for keyword.
- `:sav[eas] file` saves file as.
- `:clo[se]` closes current pane.
- `:ter[minal]` opens a terminal window.
- `K` opens man page for word under the cursor.

## Working with Multiple Files

- `H` and `L` to move between buffers (right-left).
- `:e[dit] file` edits a file in a new buffer.
- `:bn[ext]` goes to the next buffer, `:bp[revious]` goes to the previous buffer.
- `:bd[elete]` deletes a buffer (close a file).
- `:b[uffer]#` goes to a buffer by index #, `:b[uffer] file` goes to a buffer by file.
- `:ls` or `:buffers` lists all open buffers.
- `:sp[lit] file` opens a file in a new buffer and splits window horizontally.
- `:vs[plit] file` opens a file in a new buffer and vertically splits window.
- `:vert[ical] ba[ll]` edits all buffers as vertical windows.
- `:tab ba[ll]` edits all buffers as tabs.
- `Ctrl + ws` splits window, `Ctrl + wv` splits window vertically.
- `Ctrl + ww` switches windows, `Ctrl + wq` quits a window.
- `Ctrl + wx` exchanges current window with next one.
- `Ctrl + w=` makes all windows equal height & width.
- `Ctrl + wh` moves cursor to the left window (vertical split), `Ctrl + wl` moves to the right window.
- `Ctrl + wj` moves cursor to the window below (horizontal split), `Ctrl + wk` moves to the window above.
- `Ctrl + wH` makes current window full height at far left, `Ctrl + wL` makes it full height at far right.
- `Ctrl + wJ` makes current window full width at the very bottom, `Ctrl + wK` makes it full width at the very top.

## Cursor Movement

- `h`, `j`, `k`, `l` move cursor left, down, up, right.
- `gj`, `gk` move cursor down/up (multi-line text).
- `H`, `M`, `L` move to top, middle, bottom of screen.
- `w` goes forward to the start of the next word, `W` does the same and includes punctuation. `e` goes forward to the end of the next word, `E` does the same and includes punctuation.
- `b` goes back to the start of previous word, `B` does the same and includes punctuation. `ge` goes back to the start of previous word, `gE` does the same and includes punctuation.
- `%` goes to the matching character. Supported pairs (default): '()', '{}', and '[]'.
- `0` goes to the start of the current line, `^` jumps to the first non-blank character, `$` goes to the end of the current line, `g_` jumps to the last non-blank character.
- `gg` goes to the first line of the file, `G` goes to the last line of the file. `5gg` or `5G` goes to line 5.
- `gd` moves to local declaration, `gD` moves to global declaration.
- `fx` goes to the next occurrence of character x, `Fx` goes to the previous one. `tx` goes before the next occurrence of character x, `Tx` goes after the previous one. Use `;` to repeat previous f, t, F or T movement, and `,` to repeat it backwards.
- `{` goes to the next paragraph (or function/block). `}` goes to the previous one.
- `zz`, `zt`, `zb` center cursor on screen, position on top, or position on bottom.
- `Ctrl + e` moves the screen down one line without moving the cursor, `Ctrl + y` moves it up.
- `Ctrl + d` moves the cursor and screen down half a page, `Ctrl + u` moves them up half a page.
- `Ctrl + b` moves screen up one page, `Ctrl + f` moves screen down one page.

## Insert Mode

- `i` inserts before the cursor, `I` inserts at the beginning of the line.
- `a` inserts (appends) after the cursor, `A` inserts (appends) at the end of the line.
- `o` appends (opens) a new line below the current line, `O` appends above.
- `ea` inserts (appends) at the end of the word.
- `Ctrl + h` deletes the character before the cursor.
- `Ctrl + w` deletes word before the cursor.
- `Ctrl + j` adds a line break at the cursor position.
- `Ctrl + t` indents (moves right) line one shiftwidth.
- `Ctrl + d` de-indents (moves left) line one shiftwidth.
- `Ctrl + n` inserts (auto-completes) next match before the cursor.
- `Ctrl + p` inserts (auto-completes) previous match before the cursor.
- `Ctrl + rx` inserts the contents of register x.
- `Ctrl + ox` temporarily enters normal mode to issue one command x.
- `Esc` or `Ctrl + c` exits insert mode.

## Editing

- `r` replaces a single character, `R` replaces more than one character until `ESC` is pressed.
- `J` joins the line below to the current one with one space between them, `gJ` does it without leaving a space.
- `gwip` reflows the paragraph.
- `g~` switches case up to motion, `gu` changes to lowercase up to motion, `gU` changes to uppercase up to motion.
- `cc` replaces the entire line, `C` (or `c$`) does it to the end of the line, `ciw` to replace the entire word, `cw` or `ce` replaces to the end of the word.
- `s` deletes a character and substitutes text (same as `cl`), `S` deletes line and substitutes text.
- `xp` transposes (deletes and pastes forward) two letters.
- `u` undoes last change, `U` restores (undoes) last changed line, `Ctrl + r` redoes it, and `.` repeats the last command.

## Visual Mode & Commands

- `v` to start visual mode, `V` starts it linewise, and `Ctrl + v` starts visual block mode.
- `o` moves to the other end of marked area. `O` moves to the other corner of a block.
- `aw` marks a word. `ab` marks a block with (), `aB` marks a block with {}, `at` marks a block with <> tags, `ib` marks inner block with (), `iB` marks inner block with {}, `it` marks inner block with <> tags.
- `Esc` or `Ctrl + c` exits visual mode.
- `>` shifts marked text right, `<` shifts it left. `y` yanks, `d` deletes.
- `~` switches case of marked text, `u` changes marked text to lowercase, `U` changes marked text to uppercase.

## Registers

- `:reg[isters]` shows registers content.
- `"xy` yanks into register x, `"xp` pastes contents of register x.
- `"+y` yanks into the system clipboard register, `"+p` pastes from the system clipboard register.

## Marks and Positions

- `:marks` lists marks.
- `ma` sets current position for mark A.
- `` `a `` jumps to position of mark A.
- ``y`a`` yanks text to position of mark A.
- `` `0 `` goes to the position where Vim was previously exited.
- `` `" `` goes to the position when last editing this file.
- `` `. `` goes to the position of the last change in this file.
- ` ` `` goes to the position before the last jump.
- `:ju[mps]` lists jumps.
- `Ctrl + i` goes to newer position in jump list, `Ctrl + o` goes to older position.
- `:changes` lists changes.
- `g,` goes to newer position in change list, `g;` goes to older position.
- `Ctrl + ]` jumps to the tag under cursor.

## Macros

- `qa` records macro a, `q` stops recording macro.
- `@a` runs macro a, `@@` reruns last run macro.

## Cut and Paste

- `yy` yanks a line, `2yy` yanks 2 lines (or `xyy` for x lines). `yw` yanks the characters of the word from cursor position to the start of the next word, `yiw` yanks the word only, and `yaw` yanks the word and the space after of before it. `y$` or `Y` yanks to the end of the line.
- `p` puts the clipboard after the cursor, `P` puts it before. `gp` puts the clipboard after the cursor and leaves the cursor after the new text, and `gP` puts it before and leaves it after the new text.
- `dd` deletes a line, `2dd` deletes 2 lines (or `xdd` for x lines), `dw` deletes the characters of the word from the cursor position to the start of the next word, `diw` deletes the word only, and `daw` deletes the word and the space after of before it.
- `d$` or `D` deletes (cuts) to the end of the line.
- `x` deletes (cuts) character.
- `:3,5d` deletes lines starting from 3 to 5.
- `:.,$d` deletes from current line to end of file, `:.,1d` to beginning, `:10,1d` from 10th to beginning.
- `:g/{pattern}/d` deletes all lines containing pattern, `:g!/{pattern}/d` deletes all lines not containing pattern.

## Indent Text

- `>>` indents (moves right) line one shiftwidth, `<<` de-indents (moves left).
- `>%` indents a block with () or {} (cursor on brace), `<%` de-indents it.
- `>ib` indents inner block with (), `>at` indents a block with <> tags.
- `3==` re-indents 3 lines.
- `=%` re-indents a block with () or {} (cursor on brace), `=iB` re-indents inner block with {}.
- `gg=G` re-indents entire buffer.
- `]p` pastes and adjusts indent to current line.

## Search and Replace

- `/pattern` searches for pattern, `?pattern` searches backward.
- `\vpattern` 'very magic' pattern: non-alphanumeric characters are interpreted as special regex symbols.
- `n` repeats search in same direction, `N` repeats in opposite direction.
- `:%s/old/new/g` replaces all old with new throughout file (`gc` at the end prompts for confirmations).
- `:noh[lsearch]` removes highlighting of search matches.

## Search in Multiple Files

- `:vim[grep] /pattern/ {file}` searches for pattern in multiple files (e.g., `:vim[grep] /foo/ **/*`).
- `:cn[ext]` jumps to the next match, `:cp[revious]` jumps to the previous match.
- `:cope[n]` opens a window containing the list of matches.
- `:ccl[ose]` closes the quickfix window.

## Tabs

- `:tabnew` or `:tabnew {file}` opens a file in a new tab.
- `Ctrl + wT` moves the current split window into its own tab.
- `gt` or `:tabn[ext]` moves to the next tab, `gT` or `:tabp[revious]` moves to the previous tab.
- `#gt` moves to tab number #.
- `:tabm[ove] #` moves current tab to the #th position (indexed from 0).
- `:tabc[lose]` closes the current tab and all its windows, `:tabo[nly]` closes all tabs except for the current one.
- `:tabdo command` runs the command on all tabs.

## Diff

- `zf` manually defines a fold up to motion, `zd` deletes fold under the cursor.
- `za` toggles fold under the cursor, `zo` opens it, `zc` closes it.
- `zr` reduces (opens) all folds by one level, `zm` folds more (closes) all folds by one level.
- `zi` toggles folding functionality.
- `]c` jumps to start of next change, `[c` jumps to start of previous change.
- `do` or `:diffg[et]` obtains (gets) difference (from other buffer).
- `dp` or `:diffpu[t]` puts difference (to other buffer).
- `:diffthis` makes current window part of diff.
- `:dif[fupdate]` updates differences, `:diffo[ff]` switches off diff mode for current window.

## Exiting

- `:w` writes (saves) the file, but doesn't exit.
- `:w !sudo tee %` writes out the current file using sudo.
- `:wq` or `:x` or `ZZ` writes (saves) and quits.
- `:q` quits (fails if there are unsaved changes).
- `:q!` or `ZQ` quits and throws away unsaved changes.
- `:wqa` writes (saves) and quits on all tabs.
