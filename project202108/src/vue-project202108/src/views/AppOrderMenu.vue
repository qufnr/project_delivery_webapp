<template>
    <div>
        <div class="menu">

            <div class="menu-item" v-for="i in menu" v-bind:key="i.index" @click="gotoOrderMenuItem(i.index, i.display)">
                {{i.display}}
            </div>
        </div>
    </div>
</template>

<script>
export default {
    data: function() {
        return {
            menu: [
                {index: 0, display: '추천 메뉴'},
                {index: 1, display: '세트 메뉴'},
                {index: 2, display: '도시락'},
                {index: 3, display: '면류 도시락'},
                {index: 4, display: '사이드 메뉴'},
                {index: 5, display: '음료'}
            ]
        }
    },
    methods: {
        gotoOrderMenuItem: function(mType, mName) {
            localStorage.setItem('_menu-mType', mType)
            localStorage.setItem('_menu-mName', mName)
            this.$router.push({
                name: 'AppOrderMenuItems'
            })
        }
    }
}
</script>

<style scoped>
.menu {
    margin-top: 60px;
    display: grid;
    grid-template-columns: 1fr 1fr;
    gap: 30px;
    align-items: center;
}
.menu .menu-item {
    /* border: 1px solid #aaa; */
    border-radius: 5px;
    text-align: center;
    cursor: pointer;
    padding: 60px 0;
    font-size: 24px;
}
/* .menu .menu-item:nth-child(odd) {
    background: #a0c3d1;
}
.menu .menu-item:nth-child(even) {
    background: #75c0fd;
} */
.menu .menu-item {
    border-radius: 5px;
} 
.menu .menu-item:nth-child(1) {
    background: linear-gradient(
        to top,
        rgba(255, 255, 255, 0) 10%,
        rgba(255, 255, 255, 0.7) 50%,
        rgba(255, 255, 255, 1) 100%
    ), url('../assets/menu/udonn.jpg'); font-weight: bold;
    background-position: top center;
    background-size: 350px;
    background-repeat: no-repeat;
    /* color: #FFF; */
}
.menu .menu-item:nth-child(2) {
    background: linear-gradient(
        to top,
        rgba(255, 255, 255, 0) 10%,
        rgba(255, 255, 255, 0.7) 50%,
        rgba(255, 255, 255, 1) 100%
    ), url('../assets/menu/donnkatsu.jpg'); font-weight: bold;
    background-position: top center;
    background-size: 350px;
    background-repeat: no-repeat;
}
.menu .menu-item:nth-child(3) {
    background: linear-gradient(
        to top,
        rgba(255, 255, 255, 0) 10%,
        rgba(255, 255, 255, 0.7) 50%,
        rgba(255, 255, 255, 1) 100%
    ), url('../assets/menu/spammayo.jpg'); font-weight: bold;
    background-position: top center;
    background-size: 350px;
    background-repeat: no-repeat;
}
.menu .menu-item:nth-child(4) {
    background: linear-gradient(
        to top,
        rgba(255, 255, 255, 0) 10%,
        rgba(255, 255, 255, 0.7) 50%,
        rgba(255, 255, 255, 1) 100%
    ), url('../assets/menu/cheeseramyun.jpg'); font-weight: bold;
    background-position: top center;
    background-size: 350px;
    background-repeat: no-repeat;
}
.menu .menu-item:nth-child(5) {
    background: linear-gradient(
        to top,
        rgba(255, 255, 255, 0) 10%,
        rgba(255, 255, 255, 0.7) 50%,
        rgba(255, 255, 255, 1) 100%
    ), url('../assets/menu/ebihurai.jpg'); font-weight: bold;
    background-position: top center;
    background-size: 350px;
    background-repeat: no-repeat;
}
.menu .menu-item:nth-child(6) {
    background: linear-gradient(
        to top,
        rgba(255, 255, 255, 0) 10%,
        rgba(255, 255, 255, 0.7) 50%,
        rgba(255, 255, 255, 1) 100%
    ), url('../assets/menu/water500ml.jpg'); font-weight: bold;
    background-position: top center;
    background-size: 350px;
    background-repeat: no-repeat;
}
</style>