# run script as admin

$color = "rgb(23,23,23)"
$content = "<style>*{background:$color}</style>"
$byte_array = [System.Text.Encoding]::UTF8.GetBytes($content)
$base64 = [System.Convert]::ToBase64String($byte_array) # PHN0eWxlPip7YmFja2dyb3VuZDpyZ2IoNTEsNTEsNTEpfTwvc3R5bGU+
New-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Edge" -Name "NewTabPageLocation" -Value "data:text/html;charset=utf-8;base64,$base64" -PropertyType String -Force