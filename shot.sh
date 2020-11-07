#!/bin/sh -x

username=${1:-$USER}
when=${2:-1 day ago}
date=$(date --date="$when" "+%Y-%m-%d" 2>/dev/null || gdate --date="$when" "+%Y-%m-%d")

# remove previous shot if existing
rm -f shot.png

# take the shot
pageres \
     "https://github.com/${username}?tab=overview&from=${date}&to=${date}" \
     --verbose \
     --selector=.contribution-activity-listing \
     --css=".contribution-activity-listing{padding:20px;border 0}.contribution-activity-listing.discussion-timeline::before{background:transparent}.profile-rollup-content{display:block}" \
     --overwrite \
     --filename=shot

# result
ls -la shot.png
