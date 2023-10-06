#!/usr/bin/env bash
set -e
readonly OWNER="$(gh api user --jq .login)"
readonly REPO="thi3nl0ng.github.io"

echo $OWNER .$REPO
gh api --silent \
  --method POST \
  -H "Accept: application/vnd.github.v3+json" \
  "/repos/$OWNER/$REPO/git/refs" \
  -f ref='refs/heads/add-readme' \
  -f sha="$(gh api repos/thi3nl0ng/thi3nl0ng.github.io/git/ref/heads/main --jq .object.sha)"

gh api --silent \
  -X PUT "/repos/$OWNER/$REPO/contents/README2.md" \
  -f branch=add-readme \
  -f message='add README2.md' \
  -f content="$(echo '123' | base64)"
