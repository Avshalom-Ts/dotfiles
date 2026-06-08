# Accepts a folder path as an argument.
# Accepts a starting number.
# Renames all files in the folder to sequential numbers (100.jpg, 101.jpg, 102.jpg, etc.).
# Preserves the original file extensions.
# Example usage:
# .\rename-files.ps1 -FolderPath "E:\Downloads\New-Walls" -StartNumber 109
param(
    [Parameter(Mandatory = $true)]
    [string]$FolderPath,

    [Parameter(Mandatory = $true)]
    [int]$StartNumber
)

if (!(Test-Path $FolderPath)) {
    Write-Error "Folder does not exist: $FolderPath"
    exit 1
}

$counter = $StartNumber

Get-ChildItem -Path $FolderPath -File |
    Sort-Object Name |
    ForEach-Object {
        $newName = "$counter$($_.Extension)"
        Rename-Item -Path $_.FullName -NewName $newName
        Write-Host "$($_.Name) -> $newName"
        $counter++
    }