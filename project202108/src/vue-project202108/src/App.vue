<template>
    <div id="app">
        <Header></Header>
        <router-view></router-view>
    </div>
</template>

<script>
import Header from '@/components/Header'
export default {
    components: {
        Header
    }
}
</script>

<style>
#app {
    font-family: 'Noto Sans KR', Avenir, Helvetica, Arial, sans-serif;
    -webkit-font-smoothing: antialiased;
    -moz-osx-font-smoothing: grayscale;
    text-align: center;
    color: #2c3e50;
    max-width: 700px;
    margin: 0 auto;
}

#nav {
    padding: 30px;
}

#nav a {
    font-weight: bold;
    color: #2c3e50;
}

#nav a.router-link-exact-active {
    color: #42b983;
}

/* 컨텐츠 해더 */
.content-header {
    font-size: 22px;
    text-align: left;
    line-height: 38px;
    font-weight: bold;
    border-bottom: 1px solid #888;
    margin-bottom: 20px;
}

/* Alert 박스 스타일 */
.alert-box-root {
    position: fixed;
    left: 0;
    top: 0;
    width: 100%;
    height: 100%;
    background: rgba(0, 0, 0, 0.5);
    z-index: 1030;
}
.alert-box-bg {
    display: flex;
    align-items: center;
    justify-content: center;
}
.alert-box {
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    width: 60%;
    max-width: 380px;
    /* height: 200px; */
    background: #ffffff;
    border-radius: 6px;
}
.alert-box .alert-header {
    margin-top: 6px;
    font-size: 24px;
    padding-bottom: 6px;
    border-bottom: 1px solid #666;
    margin-bottom: 12px;
}
.alert-box .alert-content {
    font-size: 15px;
    padding: 0 12px;
}
.alert-box .alert-footer {
    font-size: 22px;
    line-height: 6px;
    color: #d45353;
    padding-bottom: 4px;
}
.alert-box .alert-footer #alert-close {
    cursor: pointer;
}
</style>
