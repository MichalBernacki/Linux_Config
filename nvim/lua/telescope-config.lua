local builtin = require('telescope.builtin')
local actions = require('telescope.actions')

local function select_one_or_multi(prompt_bufnr)
    local picker = require('telescope.actions.state').get_current_picker(prompt_bufnr)
    local multi = picker:get_multi_selection()
    if not vim.tbl_isempty(multi) then
        actions.close(prompt_bufnr)
        for _, j in pairs(multi) do
            if j.path ~= nil then
                vim.cmd(string.format('%s %s', 'edit', j.path))
            end
        end
    else
        actions.select_default(prompt_bufnr)
    end
end

require('telescope').setup({
    defaults = {
        vimgrep_arguments = {
            'rg',
            '--color=never',
            '--no-heading',
            '--with-filename',
            '--line-number',
            '--column',
            '--smart-case',
            '--hidden',
            '--glob=!.git/',
        },
        mappings = {
            i = {
                ['<CR>']  = select_one_or_multi,
                ['<C-j>'] = actions.cycle_history_next,
                ['<C-k>'] = actions.cycle_history_prev,
                ['<C-w>'] = actions.send_selected_to_qflist + actions.open_qflist,
                ['<C-s>'] = actions.preview_scrolling_up,
                ['<C-a>'] = actions.preview_scrolling_down,
            },
        },
    },
})

vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Find buffers' })
vim.keymap.set('n', '<leader>gc', builtin.git_commits, { desc = 'Git commits' })
vim.keymap.set('n', '<leader>gb', builtin.git_branches, { desc = 'Git branches' })
vim.keymap.set('n', '<leader>/', function()
    builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown({
        winblend = 10,
        previewer = false,
    }))
end, { desc = 'Fuzzy search in buffer' })
