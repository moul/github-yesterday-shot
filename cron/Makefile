OB.PHONY: all
all: clean local convert makerinbox

.PHONY: convert
convert:
	convert \
	  \( moul.png +append \) \
	  \( shot-moul.png +append \) \
	  \( moul-bot.png +append \) \
	  \( shot-moul-bot.png +append \) \
	  -background white -append full.png

.PHONY: makerinbox
makerinbox:
	makerinbox done --force --attach full.png ":octopus: yesterday on GitHub #oss"

.PHONY: wipchat
wipchat:
	wipchat done --attach full.png ":octopus: yesterday on GitHub #oss"

.PHONY: makerlog
makerlog:
	makerlog done --attach full.png ":octopus: yesterday on GitHub #oss"

.PHONY: docker
docker:
	docker build -t moul/github-yesterday-shot ..
	docker run -i --init --rm \
	  -v $(PWD)/..:/workdir \
	  -w /workdir/cron \
	  --cap-add=SYS_ADMIN \
	  moul/github-yesterday-shot \
	    make local


.PHONY: local
local:
	../shot.sh moul
	mv shot.png shot-moul.png
	../shot.sh moul-bot
	mv shot.png shot-moul-bot.png

.PHONY: clean
clean:
	rm -f shot-moul.png shot-moul-bot.png
