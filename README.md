# gitweb.nvim
Produces github url based on the file in the current buffer

## Installation
lazy.nvim
```
return {
  "akonkol/gitweb.nvim",
  opts = {}
}
```

## Usage
```
<Leader>u - prints github url and copies it to the system clipboard
<Leader>b - opens github url in browser
```

Inspired by 2 very useful plugins:
- [vim-github-url](https://github.com/pgr0ss/vim-github-url)
- [vim-fugitive](https://github.com/tpope/vim-fugitive)
