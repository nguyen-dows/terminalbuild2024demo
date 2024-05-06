# A powershell script that emits output that _looks_ like the typescript compiler running in watch mode

# This script will output a message every second, simulating the typescript compiler running in watch mode
# It will continue to output messages until the user presses CTRL+C

# first, the timestamp, in the colors that the typescript compiler uses
function Write-Timestamp {
    # Write-Host ("[" + (Get-Date -Format "HH:mm:ss") + "]") -NoNewline

    # but, with attributes
    Write-Host ("[") -NoNewline
    Write-Host (Get-Date -Format "HH:mm:ss") -NoNewline -ForegroundColor DarkGray
    Write-Host ("] ") -NoNewline
}
Write-Timestamp
Write-Host "Starting compilation in watch mode..."
#print a single compiler warning message to the user


#wait for 500 milliseconds
Start-Sleep -Milliseconds 1000
Write-Timestamp
Write-Host "Found 0 errors. Watching for file changes."

# Now wait for the user to press CTRL+C
while ($true) {
    Start-Sleep -Seconds 1
}
