# NierVim

NierVim adalah konfigurasi Neovim personal dengan tampilan yang terinspirasi
antarmuka lockscreen NieR: Automata. Paletnya menggunakan latar krem, warna
aksen gelap, serta syntax highlighting berkontras tinggi.

Konfigurasi ini ditenagai oleh
[AstroNvim v6](https://github.com/AstroNvim/AstroNvim). Nama package, module,
dan API AstroNvim tetap dipertahankan karena merupakan dependency internal
NierVim.

## Fitur

- Dashboard kustom dengan identitas NierVim
- Tema terang bergaya NieR dengan syntax berkontras tinggi
- Dukungan LSP, Treesitter, formatting, dan diagnostics
- Lazy loading melalui lazy.nvim
- Konfigurasi modular di dalam direktori `lua/`

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
- `lua/lazy_setup.lua`: dependency dan konfigurasi lazy.nvim
- `lua/plugins/`: konfigurasi plugin, dashboard, dan tema
- `lua/community.lua`: AstroCommunity imports
- `lua/polish.lua`: konfigurasi akhir opsional

## Fondasi

NierVim adalah konfigurasi pengguna, bukan fork engine AstroNvim. Dependency
AstroNvim tetap diperbarui melalui lazy.nvim dan tercatat di `lazy-lock.json`.
