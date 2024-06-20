const path = require('path');
const webpack = require('webpack');

module.exports = {
  mode: 'development',
  entry: {
    application: './app/javascript/application.js'
  },
  output: {
    filename: '[name].js',
    path: path.resolve(__dirname, '../../public/packs')
  },
  module: {
    rules: [
      {
        test: /\.js$/,
        exclude: /node_modules/,
        use: {
          loader: 'babel-loader'
        }
      }
    ]
  },
  plugins: [
    new webpack.ProvidePlugin({
      $: 'jquery',
      jQuery: 'jquery'
    })
  ],
  resolve: {
    extensions: ['.js', '.jsx']
  }
};
