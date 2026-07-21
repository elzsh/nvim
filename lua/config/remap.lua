local map = vim.keymap.set

-- Files
map("n", "<leader>pv", vim.cmd.Ex, { desc = "Open project view" })
map("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true, desc = "Make file executable" })
map("n", "<leader><leader>", "<cmd>source %<CR>", { desc = "Source current file" })

-- Move selected lines
map("v", "<S-Up>", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })
map("v", "<S-Down>", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })

-- Keep navigation centered
map("n", "J", "mzJ`z", { desc = "Join line below" })
map("n", "<C-d>", "<C-d>zz", { desc = "Page down and center" })
map("n", "<C-u>", "<C-u>zz", { desc = "Page up and center" })
map("n", "n", "nzzzv", { desc = "Next search result and center" })
map("n", "N", "Nzzzv", { desc = "Previous search result and center" })

-- Clipboard
map("x", "<leader>p", [["_dP]], { desc = "Paste without yanking" })
map({ "n", "v" }, "<leader>y", [["+y]], { desc = "Yank to system clipboard" })
map("n", "<leader>Y", [["+Y]], { desc = "Yank line to system clipboard" })
map({ "n", "v" }, "<leader>d", [["_d]], { desc = "Delete without yanking" })

-- Miscellaneous
map("i", "<C-c>", "<Esc>", { desc = "Use Ctrl+C as Escape" })
map("n", "Q", "<nop>", { desc = "Disable Ex mode" })

-- Quickfix and location lists
map("n", "<C-Up>", "<cmd>cprev<CR>zz", { desc = "Previous quickfix item" })
map("n", "<C-Down>", "<cmd>cnext<CR>zz", { desc = "Next quickfix item" })
map("n", "<leader>j", "<cmd>lprev<CR>zz", { desc = "Previous location item" })
map("n", "<leader>k", "<cmd>lnext<CR>zz", { desc = "Next location item" })

-- Replace the word under the cursor across the file
map(
	"n",
	"<leader>s",
	[[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
	{ desc = "Replace word under cursor" }
)
