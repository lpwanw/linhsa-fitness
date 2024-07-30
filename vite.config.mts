import {defineConfig} from 'vite'
import ViteRails from "vite-plugin-rails"
import {resolve} from "path";

// @ts-ignore
export default defineConfig({
  clearScreen: false,
  plugins: [
    ViteRails({
      fullReload: {
        additionalPaths: ["config/routes.rb", "app/views/**/*", "app/components/**/*", "app/javascript/**/*"],
        delay: 300
      }
    }),
  ],
  resolve: {
    alias: {
      '@utils': resolve(__dirname, 'app/javascript/utils'),
      '@routes': resolve(__dirname, 'app/javascript/routes'),
      '@hooks': resolve(__dirname, 'app/javascript/hooks'),
      '@pages': resolve(__dirname, 'app/javascript/pages'),
      '@ui': resolve(__dirname, 'app/javascript/ui'),
      '@api': resolve(__dirname, 'app/javascript/api')
    }
  }
})
