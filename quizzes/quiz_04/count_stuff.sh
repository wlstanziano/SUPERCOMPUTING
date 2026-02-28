dir="$1"

if [ ! -d "$dir" ]; then
    echo "Error: '$dir' is not a valid directory"
    exit 1
fi

count=$(find "$dir" -mindepth 1 -maxdepth 1 | wc -l)

echo "Number of files and directories in '$dir': $count"

chmod +x count_items.sh
