# #!/bin/bash

# # Set the necessary variables
# REMOTE_HOST="ec1ebc754f75.a5efec7a.alu-cod.online"
# REMOTE_USER="ec1ebc754f75"
# REMOTE_BACKUP_DIR="/path/to/remote/backup-Negpod_1.sh"
# LOCAL_BACKUP_DIR="/summative/0524-2024m"
# BACKUP_FILE="negpod_1-q1-$(date +%Y-%m-%d).tar.gz"

# # Create the local backup
# echo "Creating local backup..."
# tar -czf "$LOCAL_BACKUP_DIR/$BACKUP_FILE" /path/to/files/to/backup

# # Upload the backup to the remote server
# echo "Uploading backup to remote server..."
# scp "$LOCAL_BACKUP_DIR/$BACKUP_FILE" "$REMOTE_USER@$REMOTE_HOST:$REMOTE_BACKUP_DIR/$BACKUP_FILE"

# # Clean up the local backup
# echo "Cleaning up local backup..."
# rm "$LOCAL_BACKUP_DIR/$BACKUP_FILE"

# echo "Backup complete!"


#!/bin/bash

# Set the necessary variables
REMOTE_HOST="ec1ebc754f75.a5efec7a.alu-cod.online"
REMOTE_USER="ec1ebc754f75"
REMOTE_PASS="ea1d8f222b11d7be18f6"
REMOTE_DIR="/summative/0524-2024m"
LOCAL_DIR="student_files"
BACKUP_FILE="backup-negpod_1.tar.gz"

# Create the backup archive
tar -czf $BACKUP_FILE $LOCAL_DIR

# Transfer the backup to the remote server
sshpass -p "$REMOTE_PASS" scp $BACKUP_FILE $REMOTE_USER@$REMOTE_HOST:$REMOTE_DIR/

echo "Backup complete."


