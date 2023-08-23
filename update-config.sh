
#!/bin/bash

# Define the directory to backup to
BACKUP_DIR="$HOME/.config-backup"

# Create the backup directory if it does not exist
mkdir -p "$BACKUP_DIR"

# Define the names of the configuration files to backup
I3_CONFIG="config"
POLYBAR_CONFIG="config"

# Define the names of the configuration directories to backup
I3_DIR="$HOME/.config/i3"
POLYBAR_DIR="$HOME/.config/polybar"

# Get the current date and time
DATE=$(date +%Y-%m-%d_%H-%M-%S)

# Create a new backup directory with the current date and time
NEW_BACKUP_DIR="$BACKUP_DIR/$DATE"
mkdir "$NEW_BACKUP_DIR"

# Backup the i3 config file
cp "$I3_DIR/$I3_CONFIG" "$NEW_BACKUP_DIR"

# Backup the polybar config file
cp "$POLYBAR_DIR/$POLYBAR_CONFIG" "$NEW_BACKUP_DIR"

# Display a message indicating where the backup is located
echo "Configuration files backed up to: $NEW_BACKUP_DIR"

# Prompt the user to enter the path to the new config files and the type of config (i3 or polybar)
read -p "Enter the path to the new configuration files: " NEW_CONFIG_DIR
read -p "Enter the type of configuration (i3 or polybar): " CONFIG_TYPE

# Copy the new config file
if [ "$CONFIG_TYPE" == "i3" ]; then
  cp "$NEW_CONFIG_DIR/$I3_CONFIG" "$I3_DIR"
  echo "New i3 configuration file copied to: $I3_DIR"
elif [ "$CONFIG_TYPE" == "polybar" ]; then
  cp "$NEW_CONFIG_DIR/$POLYBAR_CONFIG" "$POLYBAR_DIR"
  echo "New polybar configuration file copied to: $POLYBAR_DIR"
else
  echo "Invalid configuration type. Please specify either 'i3' or 'polybar'."
fi
