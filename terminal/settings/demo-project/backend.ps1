# A powershell script that emits output that _looks_ like a Flask server running:
Write-Host "* Serving Flask app 'hello'"
Write-Host "* Debug mode: on"
Write-Host "* Running on http://127.0.0.1:5000 (Press CTRL+C to quit)"
Write-Host "* Restarting with stat"
Write-Host "* Debugger is active!"


# Now wait for the user to press CTRL+C
while ($true) {
    Start-Sleep -Seconds 1
}
