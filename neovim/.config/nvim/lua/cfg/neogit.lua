local opts = {
    -- Disables signs for sections/items/hunks
    disable_signs = false,
    -- "ascii"   is the graph the git CLI generates
    -- "unicode" is the graph like https://github.com/rbong/vim-flog
    graph_style = "unicode",
    -- Persist the values of switches/options within and across sessions
    remember_settings = true,
    -- Scope persisted settings on a per-project basis
    use_per_project_settings = true,
    -- Table of settings to never persist. Uses format "Filetype--cli-value"
    ignored_settings = {
        "NeogitPushPopup--force-with-lease",
        "NeogitPushPopup--force",
        "NeogitPullPopup--rebase",
        "NeogitCommitPopup--allow-empty",
        "NeogitRevertPopup--no-edit",
    },
    -- Set to false if you want to be responsible for creating _ALL_ keymappings
    use_default_keymaps = false,
    -- Change the default way of opening neogit
    kind = "tab",
    -- Disable line numbers and relative line numbers
    disable_line_numbers = true,
    -- The time after which an output console is shown for slow running commands
    console_timeout = 2000,
    -- Automatically show console if a command takes more than console_timeout milliseconds
    auto_show_console = true,
    status = {
        show_head_commit_hash = true,
        recent_commit_count = 10,
    },
    commit_editor = {
        kind = "auto",
    },
    commit_select_view = {
        kind = "tab",
    },
    commit_view = {
        kind = "vsplit",
        verify_commit = os.execute("which gpg") == 0, -- Can be set to true or false, otherwise we try to find the binary
    },
    log_view = {
        kind = "tab",
    },
    rebase_editor = {
        kind = "auto",
    },
    reflog_view = {
        kind = "tab",
    },
    merge_editor = {
        kind = "auto",
    },
    tag_editor = {
        kind = "auto",
    },
    preview_buffer = {
        kind = "split",
    },
    popup = {
        kind = "split",
    },
    signs = {
        -- { CLOSED, OPENED }
        hunk = { "", "" },
        item = { ">", "v" },
        section = { ">", "v" },
    },
    sections = {
        -- Reverting/Cherry Picking
        sequencer = {
            folded = false,
            hidden = false,
        },
        untracked = {
            folded = false,
            hidden = false,
        },
        unstaged = {
            folded = false,
            hidden = false,
        },
        staged = {
            folded = false,
            hidden = false,
        },
        stashes = {
            folded = true,
            hidden = false,
        },
        unpulled_upstream = {
            folded = true,
            hidden = false,
        },
        unmerged_upstream = {
            folded = false,
            hidden = false,
        },
        unpulled_pushRemote = {
            folded = true,
            hidden = false,
        },
        unmerged_pushRemote = {
            folded = false,
            hidden = false,
        },
        recent = {
            folded = true,
            hidden = false,
        },
        rebase = {
            folded = true,
            hidden = false,
        },
    },
    mappings = {
        commit_editor = {
            ["q"] = "Close",
            ["<c-c><c-c>"] = "Submit",
            ["<c-c><c-k>"] = "Abort",
        },
        commit_editor_I = {
            ["<c-c><c-c>"] = "Submit",
            ["<c-c><c-k>"] = "Abort",
        },
        rebase_editor = {
            ["p"] = "Pick",
            ["r"] = "Reword",
            ["e"] = "Edit",
            ["s"] = "Squash",
            ["f"] = "Fixup",
            ["x"] = "Execute",
            ["d"] = "Drop",
            ["b"] = "Break",
            ["q"] = "Close",
            ["<cr>"] = "OpenCommit",
            ["gk"] = "MoveUp",
            ["gj"] = "MoveDown",
            ["<c-c><c-c>"] = "Submit",
            ["<c-c><c-k>"] = "Abort",
            ["[c"] = "OpenOrScrollUp",
            ["]c"] = "OpenOrScrollDown",
        },
        rebase_editor_I = {
            ["<c-c><c-c>"] = "Submit",
            ["<c-c><c-k>"] = "Abort",
        },
        finder = {
            ["<cr>"] = "Select",
            ["<c-c>"] = "Close",
            ["<esc>"] = "Close",
            ["<c-n>"] = "Next",
            ["<c-p>"] = "Previous",
            ["<down>"] = "Next",
            ["<up>"] = "Previous",
            ["<tab>"] = "MultiselectToggleNext",
            ["<s-tab>"] = "MultiselectTogglePrevious",
            ["<c-j>"] = "NOP",
        },
        -- Setting any of these to `false` will disable the mapping.
        popup = {
            ["?"] = "HelpPopup",
            ["A"] = "CherryPickPopup",
            ["D"] = "DiffPopup",
            ["M"] = "RemotePopup",
            ["P"] = "PushPopup",
            ["X"] = "ResetPopup",
            ["Z"] = "StashPopup",
            ["b"] = "BranchPopup",
            ["B"] = "BisectPopup",
            ["c"] = "CommitPopup",
            ["f"] = "FetchPopup",
            ["l"] = "LogPopup",
            ["m"] = "MergePopup",
            ["p"] = "PullPopup",
            ["r"] = "RebasePopup",
            ["v"] = "RevertPopup",
            ["w"] = "WorktreePopup",
        },
        status = {
            ["q"] = "Close",
            ["I"] = "InitRepo",
            ["1"] = "Depth1",
            ["2"] = "Depth2",
            ["3"] = "Depth3",
            ["4"] = "Depth4",
            ["<tab>"] = "Toggle",
            ["x"] = "Discard",
            ["s"] = "Stage",
            ["S"] = "StageUnstaged",
            ["<c-s>"] = "StageAll",
            ["u"] = "Unstage",
            ["U"] = "UnstageStaged",
            ["$"] = "CommandHistory",
            ["#"] = "Console",
            ["Y"] = "YankSelected",
            ["<c-r>"] = "RefreshBuffer",
            ["<enter>"] = "GoToFile",
            ["<c-v>"] = "VSplitOpen",
            ["<c-x>"] = "SplitOpen",
            ["<c-t>"] = "TabOpen",
            ["{"] = "GoToPreviousHunkHeader",
            ["}"] = "GoToNextHunkHeader",
            ["[c"] = "OpenOrScrollUp",
            ["]c"] = "OpenOrScrollDown",
        },
    },
}

do
    local status, neogit = pcall(require, "neogit")
    if status then
        neogit.setup(opts)
        vim.keymap.set("n", "<leader>g", ":Neogit<CR>", { desc = "neogit pop" })
    else
        vim.notify("Neogit is not installed", vim.log.levels.WARN)
    end
end
