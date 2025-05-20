# Check if the script is running as Administrator
if (-NOT ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
	# If not running as Administrator, try to relaunch the script with elevated privileges
	Write-Warning "This script needs to be run as Administrator. Attempting to elevate..."
	try {
		$scriptPath = $MyInvocation.MyCommand.Path
		Start-Process PowerShell -Verb RunAs -ArgumentList "-NoProfile -ExecutionPolicy Bypass -File `"$scriptPath`"" -ErrorAction Stop
	}
	catch {
		Write-Error "Failed to elevate privileges. Please run this script as an Administrator manually."
		Write-Error "Error details: $($_.Exception.Message)"
		# Pause to allow the user to see the error before the window closes if run directly
		if ($Host.Name -eq "ConsoleHost") {
			Read-Host "Press Enter to exit"
		}
		exit 1 # Exit with an error code
	}
	exit 0 # Exit the current non-elevated script
}

# If we reach here, the script is running as Administrator
Write-Host "Running with Administrator privileges."

# Define the common registry path
$registryPath = "HKLM:\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallAllowlist"

# Define an array of hashtables, where each hashtable represents a property to set
# Each hashtable contains the 'Name' and 'Value' for a registry property
$propertiesToSet = @(
	@{ Name = "99"; Value = "cjpalhdlnbpafiamejdnhcphjbkeiagm" },
	@{ Name = "98"; Value = "gfbliohnnapiefjpjlpjnehglfpaknnc" }
	# You can add more properties here if needed, for example:
	# @{ Name = "97"; Value = "anotherExtensionID" }
)

# Loop through each property defined in the $propertiesToSet array
foreach ($property in $propertiesToSet) {
	# Construct the command to create or update the registry property
	# -Path: The registry key path where the property will be created/updated.
	# -Name: The name of the registry value (e.g., "99", "98").
	# -Value: The data for the registry value (the extension ID).
	# -PropertyType: Specifies the data type of the registry value (String in this case).
	# -Force: Overwrites the property if it already exists without prompting.
	# -ErrorAction Stop: If an error occurs (e.g., permission issues), the script will stop.
	try {
		New-ItemProperty -Path $registryPath -Name $property.Name -Value $property.Value -PropertyType String -Force -ErrorAction Stop
		Write-Host "Successfully set registry value '$($property.Name)' at path '$registryPath'."
	}
	catch {
		# Catch and display any errors that occur during the New-ItemProperty command
		Write-Error "Failed to set registry value '$($property.Name)'. Error: $($_.Exception.Message)"
	}
}

Write-Host "All specified registry properties have been processed."

# Pause if running in console, so the user can see the output
if ($Host.Name -eq "ConsoleHost" -and -not $PSScriptRoot) {
 # Check if not called from another script
	Write-Host "Script finished. Press Enter to exit."
	Read-Host
}
