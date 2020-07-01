.PHONY: all
all: docker.build docker.run convert wipchat

.PHONY: convert
convert:
	convert \
	  \( moul.png +append \) \
	  \( shot-moul.png +append \) \
	  \( moul-bot.png +append \) \
	  \( shot-moul-bot.png +append \) \
	  -background white -append full.png

.PHONY: wipchat
wipchat:
	wipchat done --attach full.png "🐙 yesterday on GitHub #oss"

.PHONY: docker.build
docker.build:
	docker build -t moul/github-yesterday-shot ..

.PHONY: docker.run
docker.run:
	docker run -i --init --rm \
	  -v $(PWD)/..:/workdir \
	  -w /workdir/cron \
	  --privileged \
	  --cap-add=SYS_ADMIN \
	  moul/github-yesterday-shot \
	    make local.run

.PHONY: local
local: local.run convert

.PHONY: local.run
local.run:
	../shot.sh moul
	mv shot.png shot-moul.png
	../shot.sh moul-bot
	mv shot.png shot-moul-bot.png

.PHONY: clean
clean:
	rm -f shot-*.png full.png
