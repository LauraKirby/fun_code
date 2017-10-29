// karma.conf.js

module.exports = function (config) {
  config.set({
    frameworks: ['jasmine'],

    files: [
      './public/js/*.js',
      './spec/*.js'
    ],

    browsers: ['Chrome']
  })
}
