#!/bin/bash
echo "=== Laporan File Sistem ===" > report.txt
echo "Jumlah file per folder:" >> report.txt
ls -R | wc -l >> report.txt

echo "" >> report.txt
echo "Ukuran total tiap folder:" >> report.txt
du -sh * >> report.txt

echo "" >> report.txt
echo "Total baris dalam semua file teks:" >> report.txt
find documents -type f -name "*.txt" | xargs wc -l >> report.txt
