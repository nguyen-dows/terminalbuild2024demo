$directoryToAdd = $(Get-Location)

# Get the current user's PATH environment variable
$currentPath = [System.Environment]::GetEnvironmentVariable("PATH", "User")

# Check if the directory is already in the PATH
if ($currentPath -notlike "*$directoryToAdd*") {
    # If not, add it to the PATH
    $newPath = $currentPath + ";" + $directoryToAdd
    [System.Environment]::SetEnvironmentVariable("PATH", $newPath, "User")
    Write-Host "Directory added to PATH: $directoryToAdd"
} else {
    Write-Host "Directory is already in PATH."
}
