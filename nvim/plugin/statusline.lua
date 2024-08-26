local branch = vim.fn.FugitiveHead() ~= "" and "[%{FugitiveHead()}]" or "[N/A]"
vim.opt.statusline = branch .. " %f%m%= %{&fileencoding?&fileencoding:&encoding}[%{&fileformat}]%y %3p%% %4l:%3c"
