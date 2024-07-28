import {defineConfig} from 'vite'
import ViteRails from "vite-plugin-rails"
import FullReload from 'vite-plugin-full-reload'

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
})
