# NierVim

NierVim adalah konfigurasi Neovim mandiri yang terinspirasi oleh antarmuka
NieR: Automata. Konfigurasi ini memadukan palet sepia, dashboard berbasis
Unicode Braille, workflow pengembangan modern, dan struktur Lua yang mudah
dipelihara.

Seluruh options, keymaps, colorscheme, statusline, tabline, integrasi LSP, dan
spesifikasi plugin dikelola langsung dari repository ini. Plugin dipasang dan
dikunci menggunakan [`lazy.nvim`](https://github.com/folke/lazy.nvim).

## Fitur utama

- Colorscheme lokal `nier` dengan mode light dan dark.
- Dashboard kustom dengan artwork Unicode Braille.
- Completion cepat melalui `blink.cmp`.
- LSP, diagnostics, code actions, rename, dan format-on-save.
- Tree-sitter highlighting untuk bahasa yang didukung.
- Fuzzy finder, recent files, notifications, dan integrasi Lazygit.
- File explorer, Git signs, terminal, session management, dan symbols outline.
- Statusline dan tabline ringan berbasis API native Neovim.
- Plugin loading modular dengan lockfile yang dapat direproduksi.

## Persyaratan

| Komponen | Keterangan |
| --- | --- |
| Neovim | Versi 0.12 atau lebih baru |
| Git dan curl | Bootstrap serta instalasi plugin |
| Compiler C | Kompilasi parser Tree-sitter |
| `tree-sitter-cli` | Versi 0.26.1 atau lebih baru |
| Nerd Font | Ikon UI dan artwork Braille yang konsisten |
| `ripgrep` | Pencarian teks melalui picker |
| `fd` | Pencarian file yang lebih cepat; opsional |
| `lazygit` | Antarmuka Git; opsional |

Gunakan font monospace yang memiliki glyph Braille dan Nerd Font lengkap.
`JetBrainsMono Nerd Font Mono` direkomendasikan untuk hasil dashboard yang
konsisten.

## Instalasi

### 1. Backup konfigurasi yang ada

Jalankan perintah berikut hanya untuk direktori yang memang tersedia:

```sh
mv ~/.config/nvim ~/.config/nvim.backup
mv ~/.local/share/nvim ~/.local/share/nvim.backup
mv ~/.local/state/nvim ~/.local/state/nvim.backup
mv ~/.cache/nvim ~/.cache/nvim.backup
```

### 2. Clone NierVim

```sh
git clone https://github.com/lainx86/NierVim.git ~/.config/nvim
```

### 3. Jalankan Neovim

```sh
nvim
```

Pada startup pertama, `lazy.nvim` akan memasang plugin. Mason dan Tree-sitter
kemudian memasang tool serta parser yang diperlukan. Proses ini membutuhkan
koneksi internet dan dapat memerlukan beberapa menit.

## Mode warna

Mode light digunakan secara default. Ganti mode selama sesi dengan command
berikut:

```vim
:NierMode dark
:NierMode light
:NierMode toggle
```

Gunakan environment variable untuk memulai Neovim langsung dalam mode dark:

```sh
NIERVIM_THEME=dark nvim
```

Dark mode menggunakan warna teks light mode sebagai background, sedangkan
foreground dan syntax utamanya memakai warna krem dari background light mode.
Mode juga dapat diganti kapan saja melalui `<leader>ut`.

## Keymap

Leader utama adalah `Space`, sedangkan local leader adalah `,`.

### Navigasi dan buffer

| Keymap | Aksi |
| --- | --- |
| `]b` / `[b` | Buffer berikutnya / sebelumnya |
| `<leader>bd` | Tutup buffer dengan konfirmasi perubahan |
| `<leader>bD` | Tutup buffer secara paksa |
| `<leader>e` | Buka atau tutup file explorer |
| `<C-h/j/k/l>` | Berpindah antar-window |
| `<C-Arrow>` | Mengubah ukuran window |
| `<A-j>` / `<A-k>` | Memindahkan baris atau selection |

### Pencarian

| Keymap | Aksi |
| --- | --- |
| `<leader>ff` | Cari file |
| `<leader>fg` | Cari teks |
| `<leader>fb` | Cari buffer |
| `<leader>fr` | Buka recent files |

### LSP dan Git

Keymap LSP tersedia ketika language server terpasang pada buffer.

| Keymap | Aksi |
| --- | --- |
| `gd` / `gD` | Definition / declaration |
| `gr` / `gI` | References / implementation |
| `K` | Hover documentation |
| `<leader>ca` | Code action |
| `<leader>cr` | Rename symbol |
| `<leader>cf` | Format buffer |
| `<leader>cd` | Tampilkan diagnostics pada baris aktif |
| `]h` / `[h` | Git hunk berikutnya / sebelumnya |
| `<leader>gp` | Preview Git hunk |
| `<leader>gr` | Reset Git hunk |
| `<leader>gb` | Toggle current-line blame |
| `<leader>gg` | Buka Lazygit |

### Tools dan UI

| Keymap | Aksi |
| --- | --- |
| `<C-s>` | Simpan file |
| <kbd>Ctrl</kbd> + <kbd>Backtick</kbd> | Toggle terminal |
| `<leader>tf` | Buka floating terminal |
| `<leader>ss` / `<leader>sl` | Simpan / muat session |
| `<leader>o` | Toggle symbols outline |
| `<leader>ut` | Toggle light/dark mode |
| `<leader>l` | Buka lazy.nvim |
| `<leader>m` | Buka Mason |
| `<leader>q` | Keluar dari Neovim |

## Komponen

| Area | Implementasi |
| --- | --- |
| Plugin manager | `lazy.nvim` |
| Dashboard, picker, dan notifier | `snacks.nvim` |
| Completion | `blink.cmp` dan `friendly-snippets` |
| LSP dan tool management | Native LSP, `nvim-lspconfig`, dan Mason |
| Formatting | Native LSP formatting dan `none-ls.nvim` |
| Syntax parsing | `nvim-treesitter` |
| File explorer | `neo-tree.nvim` |
| Git integration | `gitsigns.nvim` dan Lazygit |
| Keymap discovery | `which-key.nvim` |
| Terminal | `toggleterm.nvim` |
| Sessions | `resession.nvim` |
| Symbols outline | `aerial.nvim` |

## Struktur repository

```text
NierVim/
├── colors/
│   └── nier.lua             # Colorscheme light dan dark
├── lua/
│   ├── config/
│   │   ├── autocmds.lua     # Autocommands
│   │   ├── keymaps.lua      # Keymaps global
│   │   ├── options.lua      # Options Neovim
│   │   ├── theme.lua        # Pemilihan mode warna
│   │   └── ui.lua           # Statusline dan tabline
│   ├── plugins/             # Spesifikasi dan konfigurasi plugin
│   ├── utils/               # Helper internal
│   └── lazy_setup.lua       # Setup lazy.nvim
├── init.lua                 # Entry point dan bootstrap
└── lazy-lock.json           # Versi plugin yang dikunci
```

## Kustomisasi

- Ubah options di `lua/config/options.lua`.
- Tambahkan keymap global di `lua/config/keymaps.lua`.
- Ubah palet dan highlight di `colors/nier.lua`.
- Tambahkan atau sesuaikan plugin melalui file di `lua/plugins/`.
- Ubah dashboard dan artwork di `lua/plugins/dashboard.lua`.

Setiap file di `lua/plugins/` otomatis diimpor oleh `lazy.nvim`, sehingga
konfigurasi baru dapat ditambahkan tanpa mengubah entry point.

## Update dan pemeliharaan

Gunakan command berikut dari dalam Neovim:

```vim
:Lazy sync
:TSUpdate
:Mason
:checkhealth
```

- `:Lazy sync` memasang, memperbarui, dan membersihkan plugin sesuai lockfile.
- `:TSUpdate` menyelaraskan parser dengan versi Tree-sitter aktif.
- `:Mason` mengelola language server dan formatter.
- `:checkhealth` memeriksa dependency serta integrasi runtime.

Setelah mengubah dependency, sertakan perubahan `lazy-lock.json` agar instalasi
tetap konsisten di perangkat lain.

## Troubleshooting

### Dashboard tidak proporsional

Pastikan terminal memakai font monospace dengan dukungan Unicode Braille.
Hindari fallback font karena setiap font dapat memiliki ukuran dan ketebalan
dot yang berbeda. Artwork telah dipadatkan ke kanvas tetap agar alignment-nya
tidak berubah ketika dirender oleh dashboard.

### Ikon tampil sebagai kotak

Gunakan Nerd Font dan pastikan font tersebut dipilih langsung dalam konfigurasi
terminal, bukan hanya tersedia sebagai fallback.

### LSP atau formatter belum aktif

Buka `:Mason`, pastikan tool sudah terpasang, lalu restart buffer. Untuk Lua,
konfigurasi secara otomatis meminta `lua-language-server` dan `stylua`.

### Parser Tree-sitter bermasalah

Jalankan `:TSUpdate`, restart Neovim, kemudian periksa hasil
`:checkhealth nvim-treesitter`.
