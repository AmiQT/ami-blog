# AI Review Site

A modern, responsive blog built with Astro for reviewing and analyzing AI tools, technologies, and trends.

## Features

- 📝 **Markdown Blog Posts** - Write content in Markdown with frontmatter
- 🎨 **Responsive Design** - Mobile-friendly with beautiful UI
- 🔍 **SEO Optimized** - Meta tags, Open Graph, and Twitter Cards
- 📱 **Modern UI** - Clean design with Tailwind CSS
- 🚀 **Fast Performance** - Static site generation with Astro
- 📊 **Content Collections** - Type-safe content management
- 🌐 **GitHub Pages Ready** - Easy deployment configuration

## Quick Start

### Prerequisites

- Node.js 18+ 
- npm or yarn

### Installation

1. Clone the repository:
```bash
git clone <your-repo-url>
cd ai-review-site
```

2. Install dependencies:
```bash
npm install
```

3. Start the development server:
```bash
npm run dev
```

4. Open your browser and visit `http://localhost:4321`

## Project Structure

```
ai-review-site/
├── src/
│   ├── content/
│   │   ├── blog/           # Blog posts (Markdown files)
│   │   └── config.ts       # Content collections schema
│   ├── layouts/
│   │   └── Layout.astro    # Main layout component
│   ├── pages/
│   │   ├── index.astro     # Homepage
│   │   └── blog/
│   │       ├── index.astro # Blog list page
│   │       └── [...slug].astro # Dynamic blog post pages
│   └── styles/
│       └── global.css      # Global styles with Tailwind
├── public/                 # Static assets
├── astro.config.mjs        # Astro configuration
└── package.json
```

## Adding Blog Posts

1. Create a new Markdown file in `src/content/blog/`
2. Add frontmatter with required fields:

```markdown
---
title: "Your Post Title"
description: "Brief description of the post"
pubDate: 2024-01-15
tags: ["ai", "review", "technology"]
---

# Your content here

Write your blog post content in Markdown...
```

3. The post will automatically appear on the blog list and homepage

## Customization

### Styling
- The site uses Tailwind CSS for styling
- Modify `src/styles/global.css` for custom styles
- Update the layout in `src/layouts/Layout.astro`

### Content Schema
- Edit `src/content/config.ts` to modify the blog post schema
- Add new fields or validation rules as needed

### Navigation
- Update the navigation links in `src/layouts/Layout.astro`
- Add new pages in `src/pages/`

## Deployment

### GitHub Pages

1. Push your code to GitHub
2. Enable GitHub Pages in your repository settings
3. Set the source to "GitHub Actions"
4. Update the `site` URL in `astro.config.mjs` with your GitHub Pages URL
5. The site will automatically deploy on every push to main

### Other Platforms

The site can be deployed to any static hosting platform:

- **Netlify**: Connect your repository and build with `npm run build`
- **Vercel**: Import your repository and use the Astro preset
- **Cloudflare Pages**: Connect your repository and build with `npm run build`

## Available Scripts

- `npm run dev` - Start development server
- `npm run build` - Build for production
- `npm run preview` - Preview production build
- `npm run astro ...` - Run Astro CLI commands

## Technologies Used

- [Astro](https://astro.build/) - Static site generator
- [Tailwind CSS](https://tailwindcss.com/) - Utility-first CSS framework
- [Content Collections](https://docs.astro.build/en/guides/content-collections/) - Type-safe content management
- [Markdown](https://www.markdownguide.org/) - Content authoring

## Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Test locally with `npm run dev`
5. Submit a pull request

## License

This project is open source and available under the [MIT License](LICENSE).

## Support

For questions or issues, please open an issue on GitHub or contact the maintainers.
