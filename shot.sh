#!/bin/sh -x

username=${1:-$USER}
when=${2:-1 day ago}
date=$(date --date="$when" "+%Y-%m-%d" 2>/dev/null || gdate --date="$when" "+%Y-%m-%d")

# remove previous shot if existing
rm -f shot.png

# take the shot
#capture-website \
#    "https://github.com/${username}?tab=overview&from=${date}&to=${date}" \
#    --verbose \
#    --timeout=60 \
#    --overwrite \
#    --no-javascript \
#    --disable-animations \
#    --full-page \
#    --style="html{background:green}body{background:blue}.application-main{background:yellow}main{background:orange}.contribution-activity-listing{padding:20px;border 0}.contribution-activity-listing.discussion-timeline::before{background:transparent}.profile-rollup-content{display:block}.Box,.js-pinned-items-reorder-container,div[itemtype=\"http://schema.org/Person\"]{display:none}" \
#    --output=shot.png
#--emulate-device="iPhone X" \

pageres \
    "https://github.com/${username}?tab=overview&from=${date}&to=${date}" \
    --delay=5 \
    --verbose \
    --overwrite \
    --selector=".contribution-activity-listing" \
    --css=".contribution-activity-listing{padding:20px;border 0}.contribution-activity-listing.discussion-timeline::before{background:transparent}.profile-rollup-content{display:block}" \
    --filename=shot

# result
ls -la shot.png
