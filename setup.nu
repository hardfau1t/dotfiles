#!/usr/bin/env nu
use std


let mappings = [[src, dest];
	[./homemanager-modules/configs/nvim/after, ~/.config/nvim/after],
	[./homemanager-modules/configs/nvim/ftplugin, ~/.config/nvim/ftplugin],
	[./homemanager-modules/configs/nvim/init.lua, ~/.config/nvim/init.lua],
	[./homemanager-modules/configs/nvim/lazy-lock.json, ~/.config/nvim/lazy-lock.json],
	[./homemanager-modules/configs/nvim/lua, ~/.config/nvim/lua],
	[./homemanager-modules/configs/nvim/rocks.toml, ~/.config/nvim/rocks.toml],
]

def setup [] {
	for map in $mappings {
		let src_path = $map.src | path expand
		let dest_path = $map.dest | path expand
		let parent_dir = $dest_path | path dirname 
		if not ( $parent_dir| path exists ) {
			std log error $"destination directory doesn't exists"
			if (input --numchar 1 "Create directory: Y/n" | str downcase) in ['y', ''] {
				mkdir $parent_dir
			} else {
				std log warning $"No such file or directory: ($parent_dir), skipping linking"
				continue
			}
		}
		std log info $"(ansi green)($src_path )(ansi reset) -> (ansi yellow)($dest_path)(ansi reset)"
		try {
			ln -sT $src_path $dest_path
		} catch {|e|
			std log error $"Couldn't link to ($dest_path): ($e)"
		}
	}

}

def cleanup [] {
	for map in $mappings {
		let dest_path = $map.dest | path expand
		if ($dest_path | path exists ) {
			try {
				rm $dest_path
				std log info $"Removed ($dest_path)"
			} catch {|e|
				std log warning $"Couldn't remove ($dest_path): ($e)"
			}
		}
	}
}

# setup or remove configurations from the system
def main [
	--setup(-s), # setup all configurations
	--cleanup(-c), # remove all configs ( removes symlinks)
] : nothing -> nothing {
	if $setup {
		setup
	} else if $cleanup {
		cleanup
	} else {
		std log warning "either select --setup or --cleanup"
	}
}
