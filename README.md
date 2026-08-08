# NierVim

NierVim adalah konfigurasi Neovim personal dengan tampilan yang terinspirasi
antarmuka lockscreen NieR: Automata. Paletnya menggunakan latar krem, warna
aksen gelap, serta syntax highlighting berkontras tinggi.

Konfigurasi ini berdiri sendiri dan menggunakan `lazy.nvim` sebagai plugin
manager. Options, keymaps, LSP, formatting, statusline, tabline, dashboard,
dan colorscheme dikonfigurasi langsung di repository ini.

## Fitur

- Dashboard kustom dengan identitas NierVim
- Colorscheme lokal `nier` dengan mode light dan dark
- LSP dan diagnostics menggunakan API native Neovim
- Completion melalui `blink.cmp`
- Treesitter, formatting otomatis, Git signs, file explorer, dan fuzzy finder
- Lazy loading melalui lazy.nvim
- Konfigurasi modular di dalam direktori `lua/`

## Persyaratan

- Neovim 0.12 atau lebih baru
- Git, curl, compiler C, dan `tree-sitter-cli`
- Nerd Font untuk menampilkan semua ikon
- Opsional: `lazygit` untuk integrasi Git

## Instalasi

Backup konfigurasi Neovim yang sedang digunakan:

```sh
mv ~/.config/nvim ~/.config/nvim.bak
mv ~/.local/share/nvim ~/.local/share/nvim.bak
mv ~/.local/state/nvim ~/.local/state/nvim.bak
mv ~/.cache/nvim ~/.cache/nvim.bak
```

Clone repository NierVim ke direktori konfigurasi:

```sh
git clone <URL_REPOSITORY_NIERVIM> ~/.config/nvim
```

Jalankan Neovim. Plugin akan dipasang otomatis pada startup pertama:

```sh
nvim
```

## Struktur

- `init.lua`: bootstrap dan identitas runtime NierVim
- `colors/nier.lua`: colorscheme lokal NierVim
- `lua/config/`: options, keymaps, autocmds, dan komponen UI native
- `lua/lazy_setup.lua`: dependency dan konfigurasi lazy.nvim
- `lua/plugins/`: spesifikasi dan konfigurasi plugin mandiri
- `lua/utils/`: helper internal NierVim

## Keymap utama

- `<leader>ff`: cari file
- `<leader>fg`: cari teks
- `<leader>e`: buka/tutup file explorer
- `<leader>bd`: tutup buffer
- `<leader>ca`: LSP code action
- `<leader>cf`: format buffer
- `<leader>l`: buka lazy.nvim
- `<leader>m`: buka Mason
- `<leader>ut`: beralih antara mode light dan dark

Leader utama adalah spasi dan local leader adalah koma. Dependency dikunci di
`lazy-lock.json` agar instalasi dapat direproduksi.

## Mode warna

NierVim menggunakan mode light secara default. Mode dapat diganti selama sesi
dengan salah satu cara berikut:

```vim
:NierMode dark
:NierMode light
:NierMode toggle
```

Untuk memulai langsung dalam mode dark:

```sh
NIERVIM_THEME=dark nvim
```

Dark mode membalik warna dasar tema: latarnya memakai warna teks light mode,
sedangkan foreground dan syntax utamanya memakai warna krem dari background
light mode.
