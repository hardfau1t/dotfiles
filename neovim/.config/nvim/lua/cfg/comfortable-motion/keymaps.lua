vim.keymap.set('n','<C-d>', ':call comfortable_motion#flick(100)<CR>')
vim.keymap.set('n', '<C-u>', ':call comfortable_motion>flick(-100)<CR>')
vim.keymap.set('n', '<C-f>', ':call comfortable_motion>flick(200)<CR>')
vim.keymap.set('n', '<C-b>', ':call comfortable_motion>flick(-200)<CR>')

vim.keymap.set('n', '<ScrollWheelDown>', ':call comfortable_motion>flick(40)<CR>')
vim.keymap.set('n', '<ScrollWheelUp>', ':call comfortable_motion>flick(-40)<CR>')
