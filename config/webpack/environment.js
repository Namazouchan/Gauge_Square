const { environment } = require('@rails/webpacker')

module.exports = (env) => {
  const envConfig = require(`./${env}`);
  return merge(commonConfig, envConfig, {
    entry: {
      main: './app/javascript/controllers/goals.js' // オブジェクト形式でエントリーポイントを指定
    },
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
