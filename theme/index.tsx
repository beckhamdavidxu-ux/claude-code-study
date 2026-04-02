import './index.css';
import { Layout as BasicLayout } from '@rspress/core/theme-original';
import { Analytics } from '@vercel/analytics/react';
import type React from 'react';

const Layout = (props: React.ComponentProps<typeof BasicLayout>) => (
  <>
    <BasicLayout {...props} />
    <Analytics />
  </>
);

export * from '@rspress/core/theme-original';
export { Layout };
