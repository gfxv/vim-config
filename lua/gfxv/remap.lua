
vim.g.mapleader = " "
vim.keymap.set("n", "<leader>b", vim.cmd.Ex)
vim.keymap.set("i", "qq", "<Esc>")

vim.keymap.set("x", "<leader>p", "\"_dP")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- go specific thing
vim.keymap.set(
    "n",
    "<leader>ee",
    "oif err != nil {<CR>}<Esc>Oreturn err<Esc>"
)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")



