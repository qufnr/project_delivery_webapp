<template>
    <header>

        <div class="menu-bg" v-if="openMenu">
            <div class="menu">
                <div class="menu-close">
                    <a @click="closeSideMenu()"><i class="fas fa-times"></i>
                    </a>
                </div>
                <div class="menu-logo">
                    <a @click="gotoMain()">
                        {{pageName}}
                    </a>
                </div>
                <ul>
                    <li @click="closeSideMenu()">
                        <router-link to="/order">주문하기</router-link>
                    </li>
                    <li @click="closeSideMenu()">
                        <router-link to="/ordermenu">메뉴</router-link>
                    </li>
                    <li @click="closeSideMenu()">
                        <router-link to="/cart">장바구니</router-link>
                    </li>
                    <li>
                        <span class="disabled-item">즐겨찾기</span>
                    </li>
                    <li>
                        <span class="disabled-item">자주 묻는 질문</span>
                    </li>
                    <li>
                        <span class="disabled-item">가게정보</span>
                    </li>
                </ul>
                <div class="menu-image">

                </div>
            </div>
        </div>

        <div class="nav-bar">
            <div class="nav-content">
                <div class="nav-menu">
                    <a @click="openMenu = true">
                        <i class="fas fa-bars"></i>
                    </a>
                </div>
                <div class="nav-logo">
                    <router-link to="/">{{pageName}}</router-link>
                </div>
                <div class="nav-order-btn">
                    <a v-if="verifyCreateOrderBtn()" @click='gotoLink()'>{{rightMenuDisplay}}</a>
                </div>
            </div>
        </div>
    </header>
</template>

<script>    

export default {
    data: function() {
        return {
            openMenu: false,
            pageName: '지누네',
            rightMenuDisplay: ''
        }
    },
    methods: {
        closeSideMenu: function() {
            const SIDEMENU = document.querySelector('.menu')
            SIDEMENU.classList.add('menu-hide-anim')
            setTimeout(function() {
                SIDEMENU.classList.remove('menu-hide-anim')
                this.openMenu = false
            }.bind(this), 250)
        },
        verifyCreateOrderBtn: function() {
            if(this.$route.path.toString() === '/') {
                this.rightMenuDisplay = '주문하기'
                return true
            }
            else {
                this.rightMenuDisplay = ''
                return false
            }
        },
        gotoLink: function() {
            if(this.$route.path.toString() === '/')
                this.$router.push({
                    name: 'AppOrder'
                })
        }
    }
}

</script>

<style scoped>

.nav-bar {
    position: fixed;
    left: 0;
    top: 0;
    width: 100%;
    line-height: 41px;
    background-color: #ffffff;
    text-align: center;
    align-items: center;
    border-bottom: 1px solid #aaaaaa;
    z-index: 1020;
}

.nav-content {
    display: flex;
    justify-content: space-between;
    padding: 0 20px;

    max-width: 700px;
    margin: 0 auto;
}
.nav-content div {
    width: 33.3%;
}

/* Nav bar 메뉴 버튼 */
.nav-bar .nav-menu {
    font-size: 28px;
    text-align: left;
}
.nav-bar .nav-menu a, .nav-bar .nav-logo a, .menu a {
    text-decoration: none;
    color: #2c3e50;
    cursor: pointer;
}
.nav-bar .nav-logo a {
    font-weight: bold;
    font-size: 20px;
}

/* Nav bar 주문 버튼 */
.nav-bar .nav-order-btn {
    text-align: right;
}
.nav-bar .nav-order-btn a {
    text-decoration: none;
    color: #42b983;
    cursor: pointer;
    font-size: 18px;
}

/* 반응형 메뉴 */
.menu-bg {
    position: fixed;
    left: 0;
    top: 0;
    width: 100%;
    height: 100%;
    background: rgba(0, 0, 0, 0.5);
    z-index: 1030;
}
.menu {
    position: absolute;
    left: 0;
    top: 0;
    text-align: left;
    background-color: #ffffff;
    border-right: 1px solid #aaaaaa;
    height: 100%;
    width: 65%;
    max-width: 420px;
    font-size: 18px;
    line-height: 38px;

    animation-name: menu-slide;
    animation-duration: 0.5s;
    animation-direction: normal;
}
.menu-hide-anim {
    animation-name: menu-slide-close;
    animation-duration: 0.5s;
    animation-direction: normal;
}
.menu ul {
    padding-left: 28px;
}
.menu ul li {
    list-style: none;
}
.menu .menu-close {
    font-size: 28px;
    text-align: left;
    padding-left: 20px;
    line-height: 43px;
    border-bottom: 1px solid #aaaaaa;
    border-collapse: collapse;
}
.menu .menu-logo {
    font-size: 26px;
    font-weight: bold;
    text-align: center;
    margin-top: 16px;
}
.menu .menu-image {
    width: 100%;
    height: 500px;
    background: linear-gradient(
        to top,
        rgba(255, 255, 255, 0) 10%,
        rgba(255, 255, 255, 0.5) 25%,
        rgba(255, 255, 255, 0.7) 40%,
        rgba(255, 255, 255, 1) 100%
    ), url('../assets/menu.jpg');
    background-color: #ffffff;
    background-repeat: no-repeat;
    background-position: center center;
    background-size: 500px 500px;
}

.disabled-item {
    cursor: not-allowed;
    color: #a0a0a0;
}

@keyframes menu-slide {
    0% {
        left: -100%;
    }
    100% {
        left: 0%;
    }
}

@keyframes menu-slide-close {
    0% {
        left: 0%;
    }
    100% {
        left: -100%;
    }
}
    
</style>