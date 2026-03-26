#!/bin/bash
# Deploy Realtor Prompt Pack landing page to Netlify

ZIP_FILE="/Users/dariusvitkus/.openclaw/workspace/prompt-packs/realtor-prompt-pack/realtor-prompt-pack-landing-page.zip"
AUTH_TOKEN="nfp_7MNTRWDfcUuy1hvq3Erx6FftVMPgQZUy3664"
SITE_ID="07ee470b-4bd9-4ede-845e-ada3916085c6"

echo "Deploying to Netlify..."

RESPONSE=$(curl -s -X POST \
  -H "Authorization: Bearer $AUTH_TOKEN" \
  -H "Content-Type: application/zip" \
  --data-binary @$ZIP_FILE \
  "https://api.netlify.com/api/v1/sites/$SITE_ID/deploys")

echo "$RESPONSE" | python3 -m json.tool 2>/dev/null || echo "$RESPONSE"

# Check for errors
if echo "$RESPONSE" | grep -q "error"; then
  echo "Deployment failed!"
  exit 1
fi

# Extract deploy URL
DEPLOY_URL=$(echo "$RESPONSE" | grep -o '"url":"[^"]*"' | head -1 | cut -d'"' -f4)

if [ -n "$DEPLOY_URL" ]; then
  echo ""
  echo "✅ Deployment successful!"
  echo "Site URL: $DEPLOY_URL"
fi
