const { environment } = require('@rails/webpacker')

module.exports = (env) => {
  const envConfig = require(`./${env}`);
  return merge(commonConfig, envConfig, {
    entry: './app/javasctipt/controllers/goals.js', // エントリーポイントを共通設定に追加
  });
};

const webpack = require('webpack')
environment.plugins.prepend('Provide',
  new webpack.ProvidePlugin({
    $: 'jquery/src/jquery',
    jQuery: 'jquery/src/jquery'
  })
)

module.exports = environment
