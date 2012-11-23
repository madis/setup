Enable syntax highligting
:syntax enable
:set syntax=apache
:set hidden

New stuff learned
1. insert a blank line below and go into insert mode -- o
2. copy(yank) a line and paste it one line below -- yyp
  * same thing with line above -- yyP
3. change a word by going into insert mode -- cw
  * to change multiple words -- c3w
4. Moving to next word(letter)
  * if next word begins with N that is 6 letters from current position -- 6l
  * if its next occurence -- fN
5. Move right one character and switch to Insert mode -- li
6. Move to next word and insert text -- wi
7. Write file when you are not the owner(e.g. changing a system file from your own name) -- :w !sudo tee %
  * translates to cat aFile.conf | sudo tee aFile.conf
8. search -- /thingToSearch
9. replace next character with 9 -- r9
10. find next match n
  * find backwards N
11. highlight search matches -- :set hlsearch
12. highlight searches as you type -- :set incsearch 
13. search current buffer for all occurrences of x, replace with y, ask for confirmation at each step-- :%s/x/y/gc
  * last g denotes to search the whole file instead of stopping at first match
  * c confirms automatically, otherwise vim will ask before replacing
14. go to line 100 -- 100G
  * go to top of file -- gg
  * go to end of file -- G
16. change vim working directory to /kala -- :cd /kala
17. select text from cursor, by line, next 2 lines  -- vjj
18. select by line no matter where the cursor is -- Vjj
19. remove 2 words and do that same on next line -- d2w
  * on next line -- .
20. insert the output of ls -la command -- !!ls -la
