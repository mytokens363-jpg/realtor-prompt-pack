#!/bin/bash
# Deploy clean version - just HTML + Netlify config

ZIP_FILE="/Users/dariusvitkus/.openclaw/workspace/prompt-packs/realtor-prompt-pack/landing-page-clean.zip"
AUTH_TOKEN="nfp_7MNTRWDfcUuy1hvq3Erx6FftVMPgQZUy3664"
SITE_ID="ecf3cdb7-9a28-4092-8df5-a5f5d1523fe4"

echo "Deploying clean version..."

RESPONSE=$(curl -s -X POST \
  -H "Authorization: Bearer $AUTH_TOKEN" \
  -H "Content-Type: application/zip" \
  --data-binary @$ZIP_FILE \
  "https://api.netlify.com/api/v1/sites/$SITE_ID/deploys")

echo "$RESPONSE" | python3 -m json.tool 2>/dev/null | head -30

# Check permalink
PERMALINK=$(echo "$RESPONSE" | grep -o '"permalink":"[^"]*"' | head -1 | cut -d'"' -f4)
if [ -n "$PERMALINK" ]; then
  echo ""
  echo "✅ Deployed! URL: $PERMALINK"
  curl -s -I "$PERMALINK" 2>/dev/null | grep "content-type"
fi
