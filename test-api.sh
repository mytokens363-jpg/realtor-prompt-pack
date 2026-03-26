#!/bin/bash
# Check Netlify API token permissions

AUTH_TOKEN="nfc_Bv9nJyMLPVnSurMaCAYBJuGhpeLPFceEf0be"

echo "Testing Netlify API token..."

# Try to get user info
echo "=== Getting user info ==="
curl -s -H "Authorization: Bearer $AUTH_TOKEN" "https://api.netlify.com/api/v1/users/me" | head -20

# Try to list sites
echo ""
echo "=== Listing sites ==="
curl -s -H "Authorization: Bearer $AUTH_TOKEN" "https://api.netlify.com/api/v1/sites" | head -50
