# SET STORY TO COMPLETED

COMPLETED=`curl -X GET -H "Content-Type: application/json" -L "${API_URL}/workflows?token=${secrets.getValue("clubhouse-token")}" | jq -r '.[].states[] | select(.name=="Completed") | .id'`

#### ADDING COMMENT

curl -X POST -L "https://api.clubhouse.io/api/v3/stories/${STORY_ID}/comments?token=${secrets.getValue("clubhouse-token")}" -H "Content-Type: application/json" -d "{\"text\": \"Approved and Completed\"}"

#### UPDATING STATE

curl -X PUT -L "${API_URL}/stories/${STORY_ID}?token=${secrets.getValue("clubhouse-token")}" -H "Content-Type: application/json" -d "{\"workflow_state_id\": \"${COMPLETED}\"}}"
