return {
  'luukvbaal/nnn.nvim',
  config = function()
    require('nnn').setup({
      explorer = {
        width = 50,
      },
      replace_netrw = "picker",
      windownav = {
        left = "<C-h>",
        right = "<C-l>",
      },
    })
    vim.keymap.set('n', '<leader>f', '<cmd>NnnExplorer<CR>', { desc = 'Open nnn Explorer' })
  end,
}
