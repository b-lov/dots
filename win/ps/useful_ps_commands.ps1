# download torrent into Downloads with no seeding
aria2c --dir="$env:USERPROFILE\Downloads" --seed-time=0 "magnet:?xt=urn:btih:HASH"

# create symbolic link (run as admin)
New-Item -ItemType SymbolicLink -Path "C:\Users\YourUsername\Desktop\MyLink.txt" -Target "C:\OriginalFolder\OriginalFile.txt"

# add ublock and surfingkeys to edge extensions allowlist
New-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallAllowlist" -Name "99" -Value "cjpalhdlnbpafiamejdnhcphjbkeiagm" -PropertyType String -Force
New-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallAllowlist" -Name "98" -Value "gfbliohnnapiefjpjlpjnehglfpaknnc" -PropertyType String -Force
