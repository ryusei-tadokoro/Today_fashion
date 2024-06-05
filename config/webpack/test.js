process.env.NODE_ENV = process.env.NODE_ENV || 'test'

const environment = require('./environment')

// 無効なnodeオプションが含まれていないことを確認
environment.config.node = {
  global: true,
  __filename: true,
  __dirname: true
}

module.exports = environment.toWebpackConfig()
