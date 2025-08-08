// @ts-check
import { defineConfig } from 'astro/config';

import tailwindcss from '@tailwindcss/vite';

// https://astro.build/config
// Compute site/base dynamically for GitHub Pages if building in CI
const isGitHubPages = process.env.GITHUB_PAGES === 'true' && !!process.env.GITHUB_REPOSITORY;
let site;
let base;

if (isGitHubPages) {
  const [owner, repo] = String(process.env.GITHUB_REPOSITORY).split('/');
  site = `https://${owner}.github.io`;
  base = `/${repo}`;
}

export default defineConfig({
  site,
  base,
  vite: {
    plugins: [tailwindcss()]
  }
});