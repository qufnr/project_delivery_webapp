const path = require('path')


module.exports = {
    //  Vue 프로젝트 빌드 파일 위치 지정
    outputDir: path.resolve(__dirname, '../main/resources/static'),
    devServer: {
        host: '0.0.0.0',
        hot: true,
        disableHostCheck: true
    }
}