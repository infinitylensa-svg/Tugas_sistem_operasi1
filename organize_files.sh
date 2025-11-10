find . -type f -name "*.txt" -exec mv {} documents/ \;
find . -type f -name "*.jpg" -exec mv {} images/ \;
find . -type f -name "*.zip" -exec mv {} archives/ \;
find . -type f -name "*.log" -exec mv {} logs/ \;
