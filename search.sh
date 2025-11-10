#!/bin/bash
# search.sh — Script Fungsi Pencarian
# by: (nama kamu)
# Deskripsi: Mencari file berdasarkan nama, ukuran, dan konten

echo "=== FUNGSI PENCARIAN FILE ==="
echo "1. Cari berdasarkan Nama"
echo "2. Cari berdasarkan Ukuran"
echo "3. Cari berdasarkan Konten"
read -p "Pilih (1/2/3): " pilih

case $pilih in
  1)
    read -p "Masukkan nama file: " nama
    echo "Hasil pencarian untuk nama '$nama':"
    find . -type f -iname "*$nama*" -exec ls -lh {} \;
    ;;
  2)
    echo "Contoh ukuran: +1M (lebih besar 1MB), -500k (lebih kecil 500KB), 100k-2M (antara)"
    read -p "Masukkan ukuran: " ukuran
    if [[ "$ukuran" =~ ^([0-9]+[kMG])\-([0-9]+[kMG])$ ]]; then
      low="${BASH_REMATCH[1]}"
      high="${BASH_REMATCH[2]}"
      find . -type f -size +"$low" -size -"$high" -exec du -h {} \;
    else
      find . -type f -size "$ukuran" -exec du -h {} \;
    fi
    ;;
  3)
    read -p "Masukkan kata yang ingin dicari dalam file: " kata
    echo "Hasil pencarian konten '$kata':"
    grep -RIn "$kata" .
    ;;
  *)
    echo "Pilihan tidak valid."
    ;;
esac
