#!/bin/bash
# Force Netlify rebuild

AUTH_TOKEN="nfp_7MNTRWDfcUuy1hvq3Erx6FftVMPgQZUy3664"
SITE_ID="ecf3cdb7-9a28-4092-8df5-a5f5d1523fe4"

echo "Triggering Netlify rebuild..."

# Cancel any pending builds
curl -s -X POST \
  -H "Authorization: Bearer $AUTH_TOKEN" \
  "https://api.netlify.com/api/v1/sites/$SITE_ID/cancel-build"

# Clear cache
curl -s -X POST \
  -H "Authorization: Bearer $AUTH_TOKEN" \
  -H "Content-Type: application/json" \
  -d '{"clear_cache": true}' \
  "https://api.netlify.com/api/v1/sites/$SITE_ID/clear-cache"

echo "Cache cleared. Site should rebuild on next request."
