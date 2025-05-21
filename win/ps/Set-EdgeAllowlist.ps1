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

$registryPath = "HKLM:\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallAllowlist"

$propertiesToSet = @(
	@{ Name = "99"; Value = "cjpalhdlnbpafiamejdnhcphjbkeiagm" },
	@{ Name = "98"; Value = "gfbliohnnapiefjpjlpjnehglfpaknnc" }
)

foreach ($property in $propertiesToSet) {
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
