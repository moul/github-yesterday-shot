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
	PATH="$$PATH:./node_modules/.bin" ../shot.sh moul
	mv shot.png shot-moul.png
	PATH="$$PATH:./node_modules/.bin" ../shot.sh moul-bot
	mv shot.png shot-moul-bot.png

.PHONY: clean
clean:
	rm -f shot-moul.png shot-moul-bot.png

#.PHONY: cron
#cron:


.PHONY: deps
deps:
	yarn
	sudo apt install ca-certificates fonts-liberation libappindicator3-1 libasound2 libatk-bridge2.0-0 libatk1.0-0 libc6 libcairo2 libcups2 libdbus-1-3 libexpat1 libfontconfig1 libgbm1 libgcc1 libglib2.0-0 libgtk-3-0 libnspr4 libnss3 libpango-1.0-0 libpangocairo-1.0-0 libstdc++6 libx11-6 libx11-xcb1 libxcb1 libxcomposite1 libxcursor1 libxdamage1 libxext6 libxfixes3 libxi6 libxrandr2 libxrender1 libxss1 libxtst6 lsb-release wget xdg-utils
