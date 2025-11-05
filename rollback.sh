#!/bin/bash
echo "Starting rollback process..."
if [ -f /var/log/yum.log ]; then
    last_update=$(grep "Updated:" /var/log/yum.log | tail -n 1)
    echo "Rolling back last update: $last_update"
    sudo yum history undo last -y
    echo "Rollback completed."
else
    echo "No rollback data found!"
fi
