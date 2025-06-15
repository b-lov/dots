alias l='LC_COLLATE=C ls --color=auto --group-directories-first'
alias L='LC_COLLATE=C ls -1 --color=auto --group-directories-first'
alias ll='LC_COLLATE=C ls -A --color=auto --group-directories-first'
alias LL='LC_COLLATE=C ls -Alh --color=auto --group-directories-first'
alias v='nvim'
alias vim='nvim'
alias rm='rm -rfi'
alias rm!='rm -rf'
alias g='git'
alias lg='lazygit'
alias gst='git status'
alias gpl='git pull'
alias ncdu='ncdu --color dark'
alias ra='/Users/lex/emulation/retroarch/RetroArch.app/Contents/MacOS/RetroArch --config /Users/lex/emulation/retroarch/retroarch.cfg & exit'
alias cop='gh copilot'

# ssh servers
alias sshhostinger='ssh -p 65002 u499334472@45.87.80.103'
alias sshdeck='ssh deck@steamdeck'
alias sshoracle='ssh -i ~/.ssh/ssh-key-2023-12-27.key ubuntu@130.61.117.243'

# autopush
gps() {
	git add .
	git commit -am "$1"
	git push
}

# find synonyms and open in vscode file
sy() { /Users/lex/repos/transistor/.env/bin/python /Users/lex/repos/transistor/scripts/synonyme.py "$@" | code - ; }

# deepl translate
tra() {
	# combine all arguments into one string
	local text="'$*'"
	local response=$(curl -s -S -X POST 'https://api-free.deepl.com/v2/translate' \
		--header 'Authorization: DeepL-Auth-Key af0a22c5-86aa-756b-7e00-b052f04f80f9:fx' \
		--data-urlencode "text=$text" \
		--data-urlencode "source_lang=EN"\
		--data-urlencode "target_lang=DE")
	# echo $response
	echo $response | jq '.translations[0].text'
}