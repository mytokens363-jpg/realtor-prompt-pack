# Realtor Prompt Pack - GitHub Setup

## Repository: realtor-prompt-pack

### Files to push:
1. `index.html` - Landing page (main)
2. `netlify.toml` - Optional (for redirect rules)
3. `DEPLOY-TRoubleshooting.md` - Notes

### Setup Steps:

1. Create repository: https://github.com/new
   - Name: `realtor-prompt-pack`
   - Description: AI prompts for real estate professionals
   - Public (since it's a product landing page)

2. Push the files:
```bash
cd /Users/dariusvitkus/.openclaw/workspace/prompt-packs/realtor-prompt-pack/landing-page
git init
git add .
git commit -m "Initial commit - Realtor Prompt Pack landing page"
git remote add origin https://github.com/[your-username]/realtor-prompt-pack.git
git branch -M main
git push -u origin main
```

3. Enable GitHub Pages:
   - Go to repo Settings → Pages
   - Source: main branch
   - Click Save

4. Your site will be live at:
   - `https://[username].github.io/realtor-prompt-pack/`

### Benefits of GitHub Pages:
- ✅ Correct content-type for HTML
- ✅ Free and reliable
- ✅ Automatic HTTPS
- ✅ No build needed for static sites
- ✅ Easy to update (just push new commits)

Let me know if you want me to help with the git setup or if you'll handle it manually!
