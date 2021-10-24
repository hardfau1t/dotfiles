local opts = {
    crate_graph = {
        backend = "wayland"
    }

}

require('rust-tools').setup(opts)
