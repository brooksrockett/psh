# Define alias parameters for user convenience
param(
  [int] $TailLines = 10,             # (alias: -t) Number of recent history lines to display (default: 10, max: $maxHistoryLines)
  [switch] $ShowTimestamps = $false,  # (alias: -s) Include timestamps with each line (default: off)
  [string] $DateFormat = "HH:mm",      # (alias: -d) Custom date/time format for timestamps (default: HH:mm)
  [switch] $Help = $false             # (alias: -h) Display this help message
)

# Get the path to the history file
$historyPath = (Get-PSReadlineOption).HistorySavePath

# Set the maximum allowed number of history lines
$maxHistoryLines = 1000

# Process the help request
if ($Help) {
  Write-Host ("
  View the last N lines of your PowerShell history.

  SYNOPSIS
      PSH.ps1 [-t <number>] [-s] [-d <format>] [-h]

  PARAMETERS
      -t <number>, -TailLines <number>  (Optional) Number of lines to display (default: $TailLines, max: $maxHistoryLines).
      -s, -ShowTimestamps               (Optional) Show timestamps for each line (default: off).
      -d <format>, -DateFormat <format> (Optional) Custom date/time format for timestamps (default: HH:mm).
      -h, -Help                         (Optional) Display this help message.

  EXAMPLES
      View the last 20 lines:
          .\PSH.ps1 -t 20

      View the last 50 lines with timestamps:
          .\PSH.ps1 -t 50 -s

      View the last 10 lines with a custom format (hours:minutes:seconds):
          .\PSH.ps1 -t 10 -s -d 'HH:mm:ss'
  ")
  exit 0
}

# Validate and determine the number of lines to display
if ($TailLines -lt 1 -or $TailLines -gt $maxHistoryLines) {
  Write-Error "Number of lines must be between 1 and $maxHistoryLines."
  exit 1
}

# Check if the history file exists
if (Test-Path $historyPath) {
  # Get and format the desired history lines
  Get-Content $historyPath | Select-Object -Last $TailLines | ForEach-Object {
    if ($ShowTimestamps) {
      Write-Host ("{0:$DateFormat} $_" -f (Get-Date))
    } else {
      Write-Host $_
    }
  }
} else {
  Write-Error "History file not found at path: $historyPath"
}
