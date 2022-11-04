alias mbti="python3 ~/code/mbti-tools/mbti.py"
alias skål="echo 🍻 "
alias joke="curl https://icanhazdadjoke.com"
alias rickroll="nc rya.nc 1987"
alias color="printf '#9977aa' | pbcopy"

weather() {
        curl https://wttr.in/$1
}

qrcode() {
	curl qrenco.de/$1
}
