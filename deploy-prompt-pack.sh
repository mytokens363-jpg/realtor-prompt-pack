#!/bin/bash
# Deploy Realtor Prompt Pack landing page to Netlify (new site)

ZIP_FILE="/Users/dariusvitkus/.openclaw/workspace/prompt-packs/realtor-prompt-pack/realtor-prompt-pack-landing-page.zip"
AUTH_TOKEN="nfp_7MNTRWDfcUuy1hvq3Erx6FftVMPgQZUy3664"
SITE_ID="ecf3cdb7-9a28-4092-8df5-a5f5d1523fe4"

echo "Deploying to Netlify..."

RESPONSE=$(curl -s -X POST \
  -H "Authorization: Bearer $AUTH_TOKEN" \
  -H "Content-Type: application/zip" \
  --data-binary @$ZIP_FILE \
  "https://api.netlify.com/api/v1/sites/$SITE_ID/deploys")

echo "$RESPONSE" | python3 -m json.tool 2>/dev/null

# Check for errors
if echo "$RESPONSE" | grep -q "error"; then
  echo "Deployment failed!"
  exit 1
fi

# Extract deploy URL
DEPLOY_URL=$(echo "$RESPONSE" | grep -o '"url":"[^"]*"' | head -1 | cut -d'"' -f4)
PERMALINK=$(echo "$RESPONSE" | grep -o '"permalink":"[^"]*"' | head -1 | cut -d'"' -f4)

if [ -n "$PERMALINK" ]; then
  echo ""
  echo "✅ Deployment successful!"
  echo "Permalink: $PERMALINK"
fi
