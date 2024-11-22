#!/bin/bash

# Get the directory of the script
PROJECT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Store the server process ID
SERVER_PID=""

# Function to start the server
start_server() {
    echo "Starting Luvit server..."
    luvit server.lua &
    SERVER_PID=$!
    echo "Server started with PID: $SERVER_PID"
}

# Function to stop the server
stop_server() {
    if [ ! -z "$SERVER_PID" ]; then
        echo "Stopping server with PID: $SERVER_PID"
        kill $SERVER_PID
        wait $SERVER_PID 2>/dev/null
        SERVER_PID=""
    fi
}

# Initial server start
start_server

# Watch for changes in the entire project directory
echo "Watching for changes in: $PROJECT_DIR"
while true; do
    # Use inotifywait to watch all files and directories
    # Triggers on modify, move, create, and delete events
    changed_file=$(inotifywait -r -e modify,moved_to,create,delete \
        --format "%w%f" \
        "$PROJECT_DIR")

    echo "Detected change in: $changed_file"

    # Restart the server
    echo "Restarting server due to file change..."
    stop_server
    start_server

    # Small delay to prevent multiple restarts
    sleep 1
done
