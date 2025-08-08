#!/bin/bash

# AI Review Site - Deployment Script
# This script helps you deploy your AI review site to production

echo "🚀 AI Review Site - Deployment Script"
echo "====================================="

# Check if we're in the right directory
if [ ! -f "package.json" ]; then
    echo "❌ Error: Please run this script from the ai-review-site directory"
    exit 1
fi

# Step 1: Install dependencies
echo ""
echo "📦 Step 1: Installing dependencies..."
npm install

# Step 2: Build the project
echo ""
echo "🔨 Step 2: Building the project..."
npm run build

if [ $? -ne 0 ]; then
    echo "❌ Build failed! Please fix the errors and try again."
    exit 1
fi

echo "✅ Build completed successfully!"

# Step 3: Test the build
echo ""
echo "🧪 Step 3: Testing the build..."
npm run preview &
PREVIEW_PID=$!

# Wait a moment for the server to start
sleep 3

# Check if the server is running
if curl -s http://localhost:4321 > /dev/null; then
    echo "✅ Preview server is running at http://localhost:4321"
    echo "   You can test your site now. Press Ctrl+C to stop the preview."
    
    # Wait for user to stop the preview
    wait $PREVIEW_PID
else
    echo "❌ Preview server failed to start"
    kill $PREVIEW_PID 2>/dev/null
    exit 1
fi

# Step 4: Configuration checklist
echo ""
echo "⚙️  Step 4: Configuration Checklist"
echo "=================================="
echo ""
echo "Before deploying, please ensure you have:"
echo ""
echo "📊 Analytics Setup:"
echo "   □ Updated GA_MEASUREMENT_ID in src/components/Analytics.astro"
echo "   □ Updated YOUR_FACEBOOK_PIXEL_ID in src/components/Analytics.astro"
echo "   □ Updated YOUR_LINKEDIN_PARTNER_ID in src/components/Analytics.astro"
echo ""
echo "🌐 Domain Setup:"
echo "   □ Purchased your domain (e.g., aireviewsite.com)"
echo "   □ Updated site URL in astro.config.mjs"
echo "   □ Updated sitemap domain in src/pages/sitemap.xml.ts"
echo ""
echo "📧 Email Setup:"
echo "   □ Set up ConvertKit or Mailchimp for newsletters"
echo "   □ Updated email addresses in legal pages"
echo ""
echo "💳 Payment Setup:"
echo "   □ Created Stripe account for premium subscriptions"
echo "   □ Updated Stripe keys in payment components"
echo ""
echo "🔒 Security Setup:"
echo "   □ Updated business address in legal pages"
echo "   □ Set up SSL certificate"
echo "   □ Configured security headers"
echo ""

# Ask user if they want to proceed
read -p "Have you completed the configuration checklist? (y/N): " -n 1 -r
echo ""
if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    echo "Please complete the configuration checklist before deploying."
    exit 1
fi

# Step 5: Deploy to GitHub Pages
echo ""
echo "🚀 Step 5: Deploying to GitHub Pages..."
echo ""

# Check if git is initialized
if [ ! -d ".git" ]; then
    echo "📝 Initializing git repository..."
    git init
    git add .
    git commit -m "Initial commit - AI Review Site"
    echo "✅ Git repository initialized"
fi

# Check if remote exists
if ! git remote get-url origin > /dev/null 2>&1; then
    echo ""
    echo "🔗 Please add your GitHub repository as origin:"
    echo "   git remote add origin https://github.com/yourusername/ai-review-site.git"
    echo ""
    read -p "Have you added the remote origin? (y/N): " -n 1 -r
    echo ""
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        echo "Please add the remote origin and try again."
        exit 1
    fi
fi

# Push to GitHub
echo "📤 Pushing to GitHub..."
git add .
git commit -m "Deploy AI Review Site - Production ready"
git push origin main

if [ $? -eq 0 ]; then
    echo "✅ Successfully pushed to GitHub!"
    echo ""
    echo "🎉 Deployment Steps Completed!"
    echo "=============================="
    echo ""
    echo "Next steps:"
    echo "1. Go to your GitHub repository settings"
    echo "2. Navigate to Pages section"
    echo "3. Set source to 'Deploy from a branch'"
    echo "4. Select 'gh-pages' branch and '/ (root)' folder"
    echo "5. Save the settings"
    echo ""
    echo "Your site will be available at: https://yourusername.github.io/ai-review-site"
    echo ""
    echo "📊 Post-Deployment Checklist:"
    echo "   □ Submit sitemap to Google Search Console"
    echo "   □ Set up Google Analytics goals"
    echo "   □ Test all forms and functionality"
    echo "   □ Monitor for any errors"
    echo "   □ Start creating content!"
    echo ""
    echo "🎯 Success Metrics to Track:"
    echo "   • Monthly unique visitors"
    echo "   • Newsletter signups"
    echo "   • Premium subscriptions"
    echo "   • Affiliate conversions"
    echo "   • User engagement (time on site, pages per session)"
    echo ""
    echo "Good luck with your AI Review Site! 🚀"
else
    echo "❌ Failed to push to GitHub. Please check your git configuration."
    exit 1
fi
