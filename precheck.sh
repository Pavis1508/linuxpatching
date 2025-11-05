#!/bin/bash
echo "Running pre-checks..."
uptime
df -h /
yum check-update > /tmp/check_updates.txt
echo "Pre-check complete."
