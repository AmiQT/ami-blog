export async function GET() {
  const siteUrl = import.meta.env.PUBLIC_SITE_URL || '';
  const body = `User-agent: *\nAllow: /\n\nSitemap: ${siteUrl ? siteUrl.replace(/\/$/, '') : ''}/sitemap.xml`;

  return new Response(body, {
    headers: {
      'Content-Type': 'text/plain'
    }
  });
}


