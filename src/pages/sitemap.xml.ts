import { getCollection } from 'astro:content';

export async function GET() {
  const posts = await getCollection('blog');
  
  const sitemapEntries = [
    // Main pages
    { url: '/', lastmod: new Date().toISOString(), changefreq: 'daily', priority: 1.0 },
    { url: '/blog', lastmod: new Date().toISOString(), changefreq: 'daily', priority: 0.9 },
    { url: '/search', lastmod: new Date().toISOString(), changefreq: 'weekly', priority: 0.8 },
    { url: '/premium', lastmod: new Date().toISOString(), changefreq: 'weekly', priority: 0.8 },
    { url: '/about', lastmod: new Date().toISOString(), changefreq: 'monthly', priority: 0.7 },
    { url: '/contact', lastmod: new Date().toISOString(), changefreq: 'monthly', priority: 0.7 },
    
    // Legal pages
    { url: '/privacy', lastmod: new Date().toISOString(), changefreq: 'monthly', priority: 0.5 },
    { url: '/terms', lastmod: new Date().toISOString(), changefreq: 'monthly', priority: 0.5 },
    
    // Category pages
    { url: '/category/productivity', lastmod: new Date().toISOString(), changefreq: 'weekly', priority: 0.8 },
    { url: '/category/writing', lastmod: new Date().toISOString(), changefreq: 'weekly', priority: 0.8 },
    { url: '/category/marketing', lastmod: new Date().toISOString(), changefreq: 'weekly', priority: 0.8 },
    { url: '/category/comparison', lastmod: new Date().toISOString(), changefreq: 'weekly', priority: 0.8 },
    // Only include categories that exist
    
    // Blog posts
    ...posts.map((post) => ({
      url: `/blog/${post.slug}`,
      lastmod: post.data.updatedDate ? post.data.updatedDate.toISOString() : post.data.pubDate.toISOString(),
      changefreq: 'monthly',
      priority: post.data.featured ? 0.9 : 0.8
    }))
  ];

  // Determine site origin from env or default to current request origin
  const siteOrigin = import.meta.env.PUBLIC_SITE_URL || 'https://example.com';
  const sitemap = `<?xml version="1.0" encoding="UTF-8"?>
<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">
${sitemapEntries.map(entry => `
  <url>
    <loc>${new URL(entry.url, siteOrigin).href}</loc>
    <lastmod>${entry.lastmod}</lastmod>
    <changefreq>${entry.changefreq}</changefreq>
    <priority>${entry.priority}</priority>
  </url>
`).join('')}
</urlset>`;

  return new Response(sitemap, {
    headers: {
      'Content-Type': 'application/xml'
    }
  });
}
