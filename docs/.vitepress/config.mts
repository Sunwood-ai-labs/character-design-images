import { defineConfig } from 'vitepress'

const repoUrl = 'https://github.com/Sunwood-ai-labs/character-design-images'

export default defineConfig({
  base: '/character-design-images/',
  cleanUrls: true,
  description: 'Character design sheets, metadata, and Codex pet packages.',
  head: [
    ['link', { rel: 'icon', type: 'image/svg+xml', href: '/character-design-images/favicon.svg' }],
    ['meta', { property: 'og:title', content: 'Character Design Images' }],
    [
      'meta',
      {
        property: 'og:description',
        content: 'Public character sheet catalog, rights metadata, and Codex pet packages.',
      },
    ],
  ],
  lastUpdated: true,
  locales: {
    root: {
      label: 'English',
      lang: 'en-US',
      title: 'Character Design Images',
      description: 'Public character sheet catalog, rights metadata, and Codex pet packages.',
      themeConfig: {
        nav: [
          { text: 'Catalog', link: '/catalog' },
          { text: 'Pets', link: '/pets' },
          { text: 'Rights', link: '/rights' },
          { text: '日本語', link: '/ja/' },
        ],
        sidebar: [
          {
            text: 'Guide',
            items: [
              { text: 'Overview', link: '/' },
              { text: 'Character Catalog', link: '/catalog' },
              { text: 'Codex Pets', link: '/pets' },
              { text: 'Naming', link: '/naming' },
              { text: 'Rights', link: '/rights' },
            ],
          },
        ],
      },
    },
    ja: {
      label: '日本語',
      lang: 'ja-JP',
      title: 'Character Design Images',
      description: 'キャラクターシート、権利メタデータ、Codex pet package の公開カタログ。',
      themeConfig: {
        nav: [
          { text: 'カタログ', link: '/ja/catalog' },
          { text: 'Pets', link: '/ja/pets' },
          { text: '権利', link: '/ja/rights' },
          { text: 'English', link: '/' },
        ],
        sidebar: [
          {
            text: 'ガイド',
            items: [
              { text: '概要', link: '/ja/' },
              { text: 'キャラクターカタログ', link: '/ja/catalog' },
              { text: 'Codex Pets', link: '/ja/pets' },
              { text: '命名規則', link: '/ja/naming' },
              { text: '権利', link: '/ja/rights' },
            ],
          },
        ],
      },
    },
  },
  themeConfig: {
    logo: '/logo.svg',
    search: {
      provider: 'local',
    },
    socialLinks: [{ icon: 'github', link: repoUrl }],
    footer: {
      message: 'Use metadata before reuse.',
      copyright: 'Copyright (c) 2026 Sunwood AI Labs. See RIGHTS.md and LICENSE.',
    },
  },
})
