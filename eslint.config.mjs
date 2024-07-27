import globals from "globals";
import pluginReact from "eslint-plugin-react";


export default [
  {
    files: ["**/*.{js,mjs,cjs,jsx}"],
  },
  {languageOptions: { globals: globals.browser }},
  pluginReact.configs.flat.recommended,
  {
    rules: {
      "react/prop-types": "off",
      "react/display-name": "off"
    },
    ignores: [
      "./node_modules/*"
    ],
    settings: {
      react: {
        version: "detect",
      },
    },
  }
];
