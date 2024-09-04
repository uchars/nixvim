vim.filetype.add({
  extension = {
    h = "c",
  },
})

if vim.fn.exists(":UndoTreeHide") ~= 0 then
  vim.keymap.set("n", "<leader>u", "<cmd>UndotreeToggle<CR>")
end
