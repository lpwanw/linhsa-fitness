const colors = require("tailwindcss/colors");
const flowbite = require("flowbite-react/tailwind");

module.exports = {
  content: [
    "./public/*.html",
    "./app/helpers/**/*.rb",
    "./app/javascript/**/*.{js,jsx}",
    "./app/views/**/*.{erb,haml,html,slim}",
    "./app/components/**/*.{erb,haml,html,slim}",
    flowbite.content(),
  ],
  safelist: [
    "w-64",
    "w-1/2",
    "rounded-l-lg",
    "rounded-r-lg",
    "bg-gray-200",
    "grid-cols-4",
    "grid-cols-7",
    "h-6",
    "leading-6",
    "h-9",
    "leading-9",
    "shadow-lg",
    "bg-gray-900/50",
    "dark:bg-gray-900/80",
    "fixed",
    "inset-0",
    "z-30",
    "text-red-500",
    "bg-red-100",
    "dark:bg-red-800",
    "dark:text-red-200",
    "text-green-500",
    "bg-green-100",
    "dark:bg-green-800",
    "dark:text-green-200",
  ],
  theme: {
    screens: {
      sm: "480px",
      md: "768px",
      lg: "976px",
      xl: "1440px",
    },
    fontFamily: {
      sans: ["Graphik", "sans-serif"],
      serif: ["Merriweather", "serif"],
    },
    extend: {
      colors: {
        gray: colors.zinc,
        primary: {
          50: "#eff6ff",
          100: "#dbeafe",
          200: "#bfdbfe",
          300: "#93c5fd",
          400: "#60a5fa",
          500: "#3b82f6",
          600: "#2563eb",
          700: "#1d4ed8",
          800: "#1e40af",
          900: "#1e3a8a",
          950: "#172554",
        },
      },
      spacing: {
        128: "32rem",
        144: "36rem",
      },
      borderRadius: {
        "4xl": "2rem",
      },
    },
  },
  variants: {
    fill: [],
    extend: {
      borderColor: ["focus-visible"],
      opacity: ["disabled"],
    },
  },
  darkMode: "class",
  plugins: [
    require("@tailwindcss/forms"),
    require("@tailwindcss/typography"),
    require("@tailwindcss/container-queries"),
    flowbite.plugin(),
    require("postcss-import"),
    require("autoprefixer"),
  ],
};
