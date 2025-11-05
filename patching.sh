#!/bin/bash
echo "Applying system patches..."
sudo yum update -y
if [ $? -eq 0 ]; then
    echo "Patching completed successfully."
else
    echo "Patching failed!"
    exit 1
fi
