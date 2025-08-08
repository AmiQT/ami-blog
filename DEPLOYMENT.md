# Deployment Guide

This guide will help you deploy your AI Review Site to various platforms.

## GitHub Pages Deployment

### Prerequisites
- A GitHub account
- Your repository pushed to GitHub

### Steps

1. **Push your code to GitHub**
   ```bash
   git init
   git add .
   git commit -m "Initial commit"
   git branch -M main
   git remote add origin https://github.com/yourusername/ai-review-site.git
   git push -u origin main
   ```

2. **Update the site URL in `astro.config.mjs`**
   ```javascript
   export default defineConfig({
     site: 'https://yourusername.github.io',
     base: '/ai-review-site',
     // ... rest of config
   });
   ```

3. **Enable GitHub Pages**
   - Go to your repository on GitHub
   - Click on "Settings"
   - Scroll down to "Pages" section
   - Under "Source", select "GitHub Actions"
   - The workflow will automatically deploy your site

4. **Your site will be available at**
   `https://yourusername.github.io/ai-review-site`

## Netlify Deployment

### Option 1: Git Integration (Recommended)

1. **Push your code to GitHub/GitLab/Bitbucket**

2. **Connect to Netlify**
   - Go to [netlify.com](https://netlify.com)
   - Click "New site from Git"
   - Choose your repository
   - Set build command: `npm run build`
   - Set publish directory: `dist`
   - Click "Deploy site"

### Option 2: Manual Deploy

1. **Build your site locally**
   ```bash
   npm run build
   ```

2. **Drag and drop the `dist` folder to Netlify**

## Vercel Deployment

1. **Install Vercel CLI**
   ```bash
   npm i -g vercel
   ```

2. **Deploy**
   ```bash
   vercel
   ```

3. **Follow the prompts**
   - Vercel will automatically detect it's an Astro project
   - Choose your project settings
   - Deploy!

## Environment Variables

If you need to set environment variables for your deployment:

### GitHub Pages
- Go to repository Settings → Secrets and variables → Actions
- Add your secrets there

### Netlify
- Go to Site settings → Environment variables
- Add your variables

### Vercel
- Go to Project settings → Environment variables
- Add your variables

## Custom Domain

### GitHub Pages
1. Go to repository Settings → Pages
2. Under "Custom domain", enter your domain
3. Add a CNAME record pointing to `yourusername.github.io`

### Netlify
1. Go to Site settings → Domain management
2. Click "Add custom domain"
3. Follow the DNS configuration instructions

### Vercel
1. Go to Project settings → Domains
2. Add your domain
3. Configure DNS as instructed

## Troubleshooting

### Build Errors
- Check that all dependencies are installed: `npm install`
- Verify your Node.js version (18+ recommended)
- Check the build logs for specific error messages

### 404 Errors
- Ensure your `base` path in `astro.config.mjs` matches your deployment path
- Check that all internal links use relative paths

### Styling Issues
- Verify Tailwind CSS is properly imported in your layout
- Check that the build process includes all CSS files

## Performance Optimization

### Enable Compression
Most hosting platforms automatically enable gzip compression.

### Image Optimization
- Use WebP format when possible
- Optimize images before uploading
- Consider using Astro's image optimization features

### Caching
- Set appropriate cache headers for static assets
- Use CDN if available

## Monitoring

### Analytics
Consider adding analytics to track your site's performance:
- Google Analytics
- Plausible Analytics
- Simple Analytics

### Uptime Monitoring
- UptimeRobot
- Pingdom
- StatusCake

## Security

### HTTPS
Most modern hosting platforms provide HTTPS by default.

### Content Security Policy
Consider adding a CSP header to your site for additional security.

### Regular Updates
Keep your dependencies updated:
```bash
npm update
npm audit fix
```

## Support

If you encounter issues:
1. Check the [Astro documentation](https://docs.astro.build)
2. Search existing issues on GitHub
3. Create a new issue with detailed information
