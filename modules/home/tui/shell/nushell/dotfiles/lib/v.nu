def vgit [arg] {
  env FLATPAK_ENABLE_SDK_EXT=node18 flatpak run $'--cwd=/home/sam/git/($arg)' io.neovim.nvim
}

def v [arg] {
  env FLATPAK_ENABLE_SDK_EXT=node18 flatpak run $'--cwd=/home/sam/($arg)' io.neovim.nvim
}
