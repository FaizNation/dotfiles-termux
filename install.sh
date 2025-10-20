#!/data/data/com.termux/files/usr/bin/bash

echo "Membuat symlinks untuk Zsh dan Termux..."

# Pastikan direktori .termux ada
mkdir -p ~/.termux

# Hapus file lama jika ada (untuk menghindari error)
rm -f ~/.zshrc
rm -f ~/.termux/termux.properties
rm -f ~/.termux/colors.properties

# Buat symlink baru
echo "Linking .zshrc..."
ln -s ~/dotfiles/.zshrc ~/.zshrc

echo "Linking termux.properties..."
ln -s ~/dotfiles/.termux/termux.properties ~/.termux/termux.properties

echo "Linking colors.properties..."
ln -s ~/dotfiles/.termux/colors.properties ~/.termux/colors.properties

echo "Selesai! Silakan restart Termux."
