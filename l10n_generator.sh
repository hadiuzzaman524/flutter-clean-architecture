#!/bin/bash

# ==============================================================================
# L10n ARB File Helper
#
# Description:
#   This script automates adding new localization strings to a Flutter l10n
#   ARB file (e.g., app_en.arb). It prompts for a string, generates a
#   camelCase key, checks if the key already exists, and appends the new
#   key-value pair and its description to the file.
#
# Usage:
#   1. Save this script as `add_l10n.sh` in the root of your Flutter project.
#   2. Make it executable: `chmod +x add_l10n.sh`
#   3. Run it: `./add_l10n.sh`
#   4. Follow the prompts. Press Ctrl+C to exit.
#
# ==============================================================================

# --- Configuration ---
# The path to your primary ARB file.
ARB_FILE="lib/l10n/arb/app_en.arb"

# --- Functions ---

# Function to display a colored message.
# Arguments:
#   $1: color (red, green, yellow)
#   $2: message string
print_message() {
    # Using standard ANSI escape codes for colors.
    case "$1" in
        "green") echo -e "\033[0;32m$2\033[0m" ;;
        "red")   echo -e "\033[0;31m$2\033[0m" ;;
        "yellow")echo -e "\033[0;33m$2\033[0m" ;;
        *)       echo "$2" ;;
    esac
}

# Function to generate a camelCase key from an input string.
# Example: "Multi - City" -> "multiCity"
# Arguments:
#   $1: The input string.
generate_key() {
    # Use awk to split the string by any sequence of spaces or punctuation.
    # This robustly handles cases like "Multi - City", "One Way?", etc.
    echo "$1" | awk -F'[[:space:][:punct:]]+' '{
        # Start with the first word, all lowercase.
        output = tolower($1);
        # Iterate through the rest of the words.
        for (i = 2; i <= NF; i++) {
            # Check for empty fields that might result from trailing punctuation.
            if ($i != "") {
                # Capitalize the first letter of the word.
                first_char = toupper(substr($i, 1, 1));
                # Get the rest of the word.
                rest_of_word = substr($i, 2);
                # Append to the output string.
                output = output first_char rest_of_word;
            }
        }
        print output;
    }'
}

# Function to handle script interruption (Ctrl+C) for a graceful exit.
cleanup() {
    print_message "yellow" "\nExiting script. Goodbye!"
    exit 0
}

# --- Main Script ---

# Trap Ctrl+C signal and call the cleanup function.
trap cleanup INT

# Check if the ARB file exists before starting.
if [ ! -f "$ARB_FILE" ]; then
    print_message "red" "Error: Localization file not found at '$ARB_FILE'"
    print_message "red" "Please make sure you are in the root of your Flutter project and the file exists."
    exit 1
fi

print_message "green" "Starting L10n ARB utility..."
print_message "yellow" "Target file: $ARB_FILE"
print_message "yellow" "Press Ctrl+C to exit at any time."

# Main loop to continuously ask for new strings.
while true; do
    # 1. Ask for input string.
    echo # Add a newline for better readability between entries.
    read -p "Enter the string to add: " input_string

    # If the input is empty, prompt again.
    if [ -z "$input_string" ]; then
        print_message "yellow" "Input cannot be empty. Please try again."
        continue
    fi

    # 2. Generate a camelCase key from the input.
    key=$(generate_key "$input_string")
    print_message "yellow" "Generated key: $key"

    # 3. Check if the key already exists in the file.
    # We grep for `"key":` to ensure we match the whole key and not a substring.
    if grep -q "\"$key\":" "$ARB_FILE"; then
        print_message "red" "Error: Key '$key' already exists in '$ARB_FILE'. Please try a different string."
        continue
    fi

    # 4. Add the new l10n element to the file.
    
    # Escape double quotes in the input string to prevent breaking the ARB/JSON format.
    escaped_input_string="${input_string//\"/\\\"}"

    # Determine if a comma is needed. If the file has existing entries (indicated by a ':'),
    # we need to add a comma before our new entry to keep the JSON valid.
    if grep -q ':' "$ARB_FILE"; then
        # File has existing entries, so prepend a comma.
        entry_to_add=",\n  \"$key\": \"$escaped_input_string\",\n  \"@$key\": {\n    \"description\": \"$escaped_input_string\"\n  }"
    else
        # File is empty (just {}), so no leading comma is needed.
        entry_to_add="\n  \"$key\": \"$escaped_input_string\",\n  \"@$key\": {\n    \"description\": \"$escaped_input_string\"\n  }"
    fi

    # Use `sed` to insert the new entry just before the final closing brace '}' of the file.
    # This is a safe way to append to a JSON-like file without manual parsing.
    # Note: macOS `sed` requires an extension for the -i flag (e.g., -i ''). Linux sed does not.
    # We check the OS type to ensure compatibility.
    if [[ "$OSTYPE" == "darwin"* ]]; then
        # macOS
        sed -i '' -e '$i\'"$entry_to_add"'' "$ARB_FILE"
    else
        # Linux and other UNIX-like systems
        sed -i '$i\'"$entry_to_add"'' "$ARB_FILE"
    fi

    # 5. Show success or error message.
    if [ $? -eq 0 ]; then
        print_message "green" "Success! Added '$key' to '$ARB_FILE'."
    else
        print_message "red" "Error: Failed to write to '$ARB_FILE'."
    fi
done