# psh
a powershell script to recover your powershell history

I recently needed to recover the history of a Powershell window after accidentally closing it. While the `Get-History` cmdlet exists, it presents the entire history in a raw format, only for the current window. This script aims to improve the user experience by offering a more manageable and informative way to navigate past commands.

This PowerShell script (PSH.ps1) provides a convenient way to view and search through your recent PowerShell history. It goes beyond the basic `Get-History` cmdlet by offering features like:

-   Tailored View: Focus on a specific number of recent commands for easier browsing.
-   Optional Timestamps: Include timestamps for each command with customizable format.
-   Robust Error Handling: Provides informative messages for missing history files or invalid input.
-   Built-in Help: Get detailed usage instructions and examples with the `-Help` parameter.


### Usage

#### Saving the Script:

1.  Save the following script content as `PSH.ps1` in your desired location.
2.  Open a PowerShell window and navigate to the directory containing `PSH.ps1`.

#### Running the Script:


```
.\PSH.ps1 [Parameters]
```

#### Parameters:

-   `-t <number>, -TailLines <number>` (Optional): Number of recent lines to display (default: 10, max: 1000).
-   `-s, -ShowTimestamps` (Optional): Include timestamps for each line (default: off).
-   `-d <format>, -DateFormat <format>` (Optional): Custom date/time format for timestamps (default: HH:mm).
-   `-h, -Help` (Optional): Display help message with usage instructions.

#### Examples:

-   View the last 20 lines:
```
.\PSH.ps1 20
```

-   View the last 50 lines with timestamps:
```
.\PSH.ps1 50 -s
```

-   View the last 10 lines with a custom format (hours:minutes:seconds):
```
.\PSH.ps1 10 -s -d 'HH:mm:ss'
```
