import { defineCollection, z } from 'astro:content';

const blog = defineCollection({
  type: 'content',
  schema: z.object({
    title: z.string(),
    description: z.string(),
    pubDate: z.coerce.date(),
    updatedDate: z.coerce.date().optional(),
    heroImage: z.string().optional(),
    tags: z.array(z.string()).default([]),
    premium: z.boolean().default(false), // New field: determines if article is premium
    excerpt: z.string().optional(), // Short preview for premium articles
    readingTime: z.number().optional(),
    author: z.string().default('AI Review Team'),
    featured: z.boolean().default(false),
    category: z.enum(['productivity', 'writing', 'marketing', 'comparison', 'news', 'tutorial']).optional(),
  }),
});

export const collections = { blog };
