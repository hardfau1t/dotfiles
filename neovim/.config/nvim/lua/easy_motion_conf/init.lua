vim.g.comfortable_motion_scroll_down_key = "j"
vim.g.comfortable_motion_scroll_up_key = "k"
vim.g.comfortable_motion_friction = 80.0
vim.g.comfortable_motion_air_drag = 2.0

vim.api.nvim_set_keymap('n','<C-d>', ':call comfortable_motion#flick(100)<CR>', {noremap = true,  silent=true})
vim.api.nvim_set_keymap('n', '<C-u>', ':call comfortable_motion>flick(-100)<CR>', {noremap = true, silent=true})
vim.api.nvim_set_keymap('n', '<C-f>', ':call comfortable_motion>flick(200)<CR>', {noremap = true, silent=true})
vim.api.nvim_set_keymap('n', '<C-b>', ':call comfortable_motion>flick(-200)<CR>', {noremap = true, silent=true})

vim.api.nvim_set_keymap('n', '<ScrollWheelDown>', ':call comfortable_motion>flick(40)<CR>', {noremap = true, silent=true})
vim.api.nvim_set_keymap('n', '<ScrollWheelUp>', ':call comfortable_motion>flick(-40)<CR>', {noremap = true, silent=true})
