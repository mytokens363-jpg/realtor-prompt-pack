#!/bin/bash
# Deploy landing page to Netlify using API - Create new site

ZIP_FILE="/Users/dariusvitkus/.openclaw/workspace/prompt-packs/realtor-prompt-pack/realtor-prompt-pack-landing-page.zip"
AUTH_TOKEN="nfc_Bv9nJyMLPVnSurMaCAYBJuGhpeLPFceEf0be"

echo "Creating new Netlify site..."

# Create site
CREATE_RESPONSE=$(curl -s -X POST \
  -H "Authorization: Bearer $AUTH_TOKEN" \
  -H "Content-Type: application/json" \
  -d '{"name":"realtor-prompt-pack"}' \
  "https://api.netlify.com/api/v1/sites")

echo "Site creation response:"
echo "$CREATE_RESPONSE"

# Extract site ID
SITE_ID=$(echo "$CREATE_RESPONSE" | grep -o '"id":"[^"]*"' | head -1 | cut -d'"' -f4)

if [ -z "$SITE_ID" ]; then
  echo "Failed to get site ID"
  exit 1
fi

echo "Site ID: $SITE_ID"

# Upload deploy
echo "Uploading deploy..."
curl -X POST \
  -H "Authorization: Bearer $AUTH_TOKEN" \
  -H "Content-Type: application/zip" \
  --data-binary @$ZIP_FILE \
  "https://api.netlify.com/api/v1/sites/$SITE_ID/deploys" | tee /tmp/netlify-deploy.json

echo ""
echo "Done!"
