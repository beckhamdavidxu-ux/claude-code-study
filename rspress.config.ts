import * as path from 'node:path';
import { defineConfig } from '@rspress/core';

export default defineConfig({
  root: path.join(__dirname, 'docs'),
  title: 'Claude Code Study',
  description: 'Claude Code 原理学习 — by Tencent AI pkushinnxu',
  icon: '/rspress-icon.png',
  logo: {
    light: '/rspress-light-logo.png',
    dark: '/rspress-dark-logo.png',
  },
  themeConfig: {
    socialLinks: [
      {
        icon: 'github',
        mode: 'link',
        content: 'https://github.com/beckhamdavidxu-ux/claude-code-study',
      },
    ],
    footer: {
      message: '基于 Claude Code 源码的学习笔记 — Tencent AI pkushinnxu，仅供学习交流',
    },
  },
  markdown: {
    mdxRs: false,
  },
});
