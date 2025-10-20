#!/data/data/com.termux/files/usr/bin/bash

echo "Memulai instalasi dotfiles..."

# ==================================
# BAGIAN 1: INSTALASI PAKET
# ==================================
echo "Menjalankan pkg update..."
pkg update -y

echo "Menginstal paket dari packages.txt..."

# Memeriksa apakah file packages.txt ada
if [ ! -f ~/dotfiles/packages.txt ]; then
    echo "Peringatan: File packages.txt tidak ditemukan. Melewati instalasi paket."
else
    # Membaca file packages.txt baris per baris dan menginstal
    while read -r package; do
      # Hanya instal jika paket belum terinstal
      if ! pkg -s "$package" | grep -q "installed"; then
        echo "Menginstal $package..."
        pkg install -y "$package"
      else
        echo "$package sudah terinstal."
      fi
    done < ~/dotfiles/packages.txt
    echo "Instalasi paket selesai."
fi


# ==================================
# BAGIAN 2: MEMBUAT SYMLINKS
# ==================================
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
