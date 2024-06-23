const path = require('path');
const { build } = require('esbuild');

build({
  entryPoints: {
    application: './app/javascript/application.js'
  },
  bundle: true,
  outdir: path.join(__dirname, 'public/packs'),
  platform: 'browser',
  target: ['es2020'],
  loader: {
    '.js': 'jsx'
  },
  external: ['core-js/stable', 'regenerator-runtime/runtime'],
  plugins: []
}).catch(() => process.exit(1));
