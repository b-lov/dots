# Define the common registry path
$registryPath = "HKLM:\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallAllowlist"

# Define an array of hashtables, where each hashtable represents a property to set
# Each hashtable contains the 'Name' and 'Value' for a registry property
$propertiesToSet = @(
	@{ Name = "97"; Value = "cjpalhdlnbpafiamejdnhcphjbkeiagm" },
	@{ Name = "96"; Value = "gfbliohnnapiefjpjlpjnehglfpaknnc" }
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