perform_bakcup() {
	for DIR in $SOURCE_DIRS; do
		DEST="$BACKUP_DIR/$(basename $DIR)-$TIMESTAMP"
		rsync -av --delete --compress "$DIR" "$DEST" >> "$LOG_FILE" 2>&1
		if [ $? -eq 0 ]; then
			echo "Backup of $DIR completed successfully" >> "$LOG_FILE"
		else 
			echo "Backup of $DIR failed" >> "LOG_FILE"
		fi
	done
}
