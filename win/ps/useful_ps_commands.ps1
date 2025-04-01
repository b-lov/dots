# download torrent into Downloads with no seeding
aria2c --dir="$env:USERPROFILE\Downloads" --seed-time=0 "magnet:?xt=urn:btih:HASH"

# create symbolic link (run as admin)
New-Item -ItemType SymbolicLink -Path "C:\Users\YourUsername\Desktop\MyLink.txt" -Target "C:\OriginalFolder\OriginalFile.txt"