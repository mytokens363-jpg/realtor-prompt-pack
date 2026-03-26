# Netlify API Notes

The Netlify API token stored in credentials.md appears to be expired or revoked.

**Alternative deployment options:**

## Option 1: Netlify Web Interface (Recommended)
1. Go to https://app.netlify.com/drop
2. Drag & drop the `landing-page/` folder or upload the ZIP
3. Site will be live at `*.netlify.app` instantly

## Option 2: Netlify CLI with Fresh Token
1. Generate a new token at https://app.netlify.com/user/applications
2. Run: `netlify login` and follow instructions
3. Deploy with: `netlify deploy --prod --dir=.`

## Option 3: GitHub Pages
1. Create a new GitHub repo: `realtor-prompt-pack`
2. Push the `landing-page/` folder contents
3. Enable GitHub Pages in Settings
4. Use custom domain: `realtor.ai` (point to GitHub)

## Option 4: Vercel
1. Install Vercel CLI: `npm i -g vercel`
2. Deploy: `vercel --prod`
3. Link custom domain if needed

## Option 5: Direct HTML Hosting
Use any static hosting service that accepts HTML files:
- Cloudflare Pages
- AWS S3 + CloudFront
- Firebase Hosting

**Files ready to deploy:**
- `landing-page/index.html` - Main landing page
- `realtor-prompt-pack-landing-page.zip` - Full package

**Netlify site info (may need new token):**
- Site ID: 07ee470b-4bd9-4ede-845e-ada3916085c6
- Current URL: marvelous-begonia-68375d.netlify.app
