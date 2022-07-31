local settings = require("mattrighetti.profile")
local o = vim.opt
local g = vim.g
local fn = vim.fn

o.exrc = true
o.guicursor = "n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50" -- block in normal and beam cursor in insert mode
o.relativenumber = settings.relative_number
o.number = settings.number
o.hidden = true
o.tabstop = 4
o.softtabstop = 4
o.undofile = true
o.backup = false -- creates a backup file
o.swapfile = false -- enable/disable swap file creation
o.dir = fn.stdpath("data") .. "/swp" -- swap file directory
o.undodir = fn.stdpath("data") .. "/undodir"
o.shiftwidth=4
o.expandtab = true
o.smartindent = true
o.wrap = false
o.smartcase = true
o.incsearch = true
o.termguicolors = true
o.scrolloff = 10
o.showmode = true
o.completeopt = { "menu", "menuone", "noselect", "noinsert" } -- A comma separated list of options for Insert mode completion
o.fileencoding = "utf-8"
o.filetype = "on" 
o.shortmess = o.shortmess + "c" -- prevent "pattern not found" messages
o.signcolumn = "yes"
o.cmdheight = 2
o.updatetime = 50
o.hlsearch = false
o.wildmode = "full"
o.wildignorecase = true -- When set case is ignored when completing file names and directories
o.wildignore = [[
.git,.hg,.svn
*.aux,*.out,*.toc
*.o,*.obj,*.exe,*.dll,*.manifest,*.rbc,*.class
*.ai,*.bmp,*.gif,*.ico,*.jpg,*.jpeg,*.png,*.psd,*.webp
*.avi,*.divx,*.mp4,*.webm,*.mov,*.m2ts,*.mkv,*.vob,*.mpg,*.mpeg
*.mp3,*.oga,*.ogg,*.wav,*.flac
*.eot,*.otf,*.ttf,*.woff
*.doc,*.pdf,*.cbr,*.cbz
*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz,*.kgb
*.swp,.lock,.DS_Store,._*
*/tmp/*,*.so,*.swp,*.zip,**/node_modules/**,**/target/**,**.terraform/**"
]]

g.netrw_banner = false
g.netrw_liststyle = 3

o.background = "dark" -- or "light" for light mode
