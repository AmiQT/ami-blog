// @ts-check
import { defineConfig } from 'astro/config';

import tailwindcss from '@tailwindcss/vite';

// Configuration for GitHub Pages deployment
// https://astro.build/config
export default defineConfig({
  site: 'https://yourusername.github.io',
  base: '/ai-review-site',
  vite: {
    plugins: [tailwindcss()]
  }
});
