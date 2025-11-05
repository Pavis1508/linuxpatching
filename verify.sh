#!/bin/bash
echo "Verifying patch installation..."
sudo yum check-update
if [ $? -eq 100 ]; then
    echo "No pending updates – verification passed."
    exit 0
else
    echo "Verification failed – updates still available."
    exit 1
fi
