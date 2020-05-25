.PHONY: do
do:
	../shot.sh moul
	mv shot.png shot-moul.png
	../shot.sh moul-bot
	mv shot.png shot-moul-bot.png
	convert \
	  \( moul.png +append \) \
	  \( shot-moul.png +append \) \
	  \( moul-bot.png +append \) \
	  \( shot-moul-bot.png +append \) \
	  -background white -append full.png
