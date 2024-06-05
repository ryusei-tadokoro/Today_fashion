const { environment } = require('@rails/webpacker');
const webpack = require('webpack');

// ProvidePlugin設定
environment.plugins.prepend('Provide',
  new webpack.ProvidePlugin({
    $: 'jquery',
    jQuery: 'jquery',
    Popper: ['popper.js', 'default']
  })
);

// Polyfills設定
environment.plugins.append('Provide', new webpack.ProvidePlugin({
  process: 'process/browser',
  Buffer: ['buffer', 'Buffer']
}));

// Babelローダーの設定
environment.loaders.append('babel', {
  test: /\.js$/,
  exclude: /node_modules/,
  use: {
    loader: 'babel-loader',
    options: {
      presets: ['@babel/preset-env']
    }
  }
});

module.exports = environment;
