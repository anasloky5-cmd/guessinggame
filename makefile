all: README.md

README.md: guessinggame.sh
	echo "# Guessing Game" > README.md
	echo "" >> README.md
	echo "**make was run on:** $$(date)" >> README.md
	echo "" >> README.md
	echo "**Lines of code in guessinggame.sh:** $$(wc -l < guessinggame.sh | tr -d ' ')" >> README.md
