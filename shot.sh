#!/bin/sh

username=${1:-$USER}
when=${2:-1 day ago}
date=$(date --date="$when" "+%Y-%m-%d" 2>/dev/null || gdate --date="$when" "+%Y-%m-%d")

# remove previous shot if existing
rm -f shot.png

# take the shot
pageres \
     "https://github.com/${username}?tab=overview&from=${date}&to=${date}" \
     --selector=.profile-timeline \
     --css=".profile-timeline{padding:20px;border 0}.profile-timeline.discussion-timeline::before{background:transparent}.profile-rollup-content{display:block}" \
     --overwrite \
     --filename=shot

# result
ls -la shot.png
