-- Move to window using the <ctrl> hjkl keys
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Go to left window", remap = true })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Go to lower window", remap = true })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Go to upper window", noremap = true })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Go to right window", remap = true })

-- Neotree
vim.keymap.set("n", "<leader>e",
	function() require("neo-tree.command").execute({ toggle = true }) end,
	{ desc = "Toggle NeoTree", noremap = true })

-- Buffers
vim.keymap.set('n', '<leader>bn', '<cmd>bnext<cr>', { desc = '[N]ext [B]uffer' })
vim.keymap.set('n', '<leader>bp', '<cmd>bprevious<cr>', { desc = '[P]revious [B]uffer' })

-- Git
vim.keymap.set('n', '<leader>gb', '<cmd>Git blame<cr>', { desc = '[G]it [B]lame' })

-- Remove mapping of arrow keys while learning to use hjkl
vim.keymap.set('n', '<Up>', '<Nop>')
vim.keymap.set('n', '<Down>', '<Nop>')
vim.keymap.set('n', '<Left>', '<Nop>')
vim.keymap.set('n', '<Right>', '<Nop>')

return {}
