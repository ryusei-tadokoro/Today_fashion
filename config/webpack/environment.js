const { environment } = require('@rails/webpacker');
const webpack = require('webpack');

// Remove or correct the node option
environment.config.delete('node');

// If needed, add node options here
environment.config.set('node', {
  __dirname: true,
  __filename: true,
  global: true
});

environment.plugins.append(
  'Provide',
  new webpack.ProvidePlugin({
    $: 'jquery',
    jQuery: 'jquery',
    Popper: ['popper.js', 'default']
  })
);

// 追加の設定
environment.splitChunks((config) => {
  config.optimization.splitChunks = {
    chunks: 'all',
    cacheGroups: {
      vendor: {
        test: /[\\/]node_modules[\\/]/,
        name: 'vendors',
        chunks: 'all',
      },
    },
  };
  return config;
});

module.exports = environment;