#!/bin/bash

# --- Configuration ---
# List directories you want to backup here, separated by space
SOURCE_DIRS="/etc/ssh /var/log"
# Directory where backups will be stored on the remote server
BACKUP_DIR="/opt/backup"
# Log file location
LOG_FILE="/var/log/patching_backup.log"
# Current timestamp for unique backup folder names
TIMESTAMP=$(date +"%Y%m%d-%H%M%S")

# Ensure backup target directory exists
if [ ! -d "$BACKUP_DIR" ]; then
    mkdir -p "$BACKUP_DIR"
fi

# Ensure log file exists (or at least the directory for it)
touch "$LOG_FILE"

perform_backup() {
    echo "--- Starting Backup Run: $TIMESTAMP ---" >> "$LOG_FILE"
    for DIR in $SOURCE_DIRS; do
        if [ -d "$DIR" ]; then
             # Define destination for this specific directory
             DEST="$BACKUP_DIR/$(basename "$DIR")-$TIMESTAMP"

             # Run rsync
             # Note: using "$DIR/" (trailing slash) copies CONTENTS of DIR into DEST
             rsync -av --delete --compress "$DIR/" "$DEST/" >> "$LOG_FILE" 2>&1

             if [ $? -eq 0 ]; then
                     echo "[SUCCESS] Backup of $DIR completed to $DEST" >> "$LOG_FILE"
             else
                     # Fixed typo: "LOG_FILE" changed to "$LOG_FILE"
                     echo "[FAILED] Backup of $DIR failed" >> "$LOG_FILE"
             fi
        else
             echo "[WARNING] Source directory $DIR does not exist. Skipping." >> "$LOG_FILE"
        fi
    done
    echo "--- Finished Backup Run ---" >> "$LOG_FILE"
}

# Execute the function
perform_backup
