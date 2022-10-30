#!/bin/bash

echo "Ingrese el nombre de tu nuevo proyecto: "; read pn

yarn create vite --template react $pn

cd "$pn"

yarn add tailwindcss postcss autoprefixer
npx tailwindcss init -p

rm tailwind.config.cjs

echo "/** @type {import('tailwindcss').Config} */" >> tailwind.config.cjs
echo "module.exports = {" >> tailwind.config.cjs
echo "  content: [" >> tailwind.config.cjs
echo '    "./index.html",' >> tailwind.config.cjs
echo '    "./src/**/*.{js,ts,jsx,tsx}",' >> tailwind.config.cjs
echo "  ]," >> tailwind.config.cjs
echo "  theme: {" >> tailwind.config.cjs
echo "    extend: {}," >> tailwind.config.cjs
echo "  }," >> tailwind.config.cjs
echo "  plugins: []," >> tailwind.config.cjs
echo "}" >> tailwind.config.cjs

rm src/index.css

echo "@tailwind base;" >> src/index.css
echo "@tailwind components;" >> src/index.css
echo "@tailwind utilities;" >> src/index.css

code .

yarn
yarn dev
