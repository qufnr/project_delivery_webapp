<template>
    <div class="menu-item-root">
        <div class="content-header">
            {{mName}}
        </div>
        <div class="menu-item" v-for="i in items" v-bind:key="i.idx">
            <div class="menu-item-inner">
                <div class="menu-item-innerleft">
                    <img v-if="i.image == null" src="../assets/order_items/temp_item_pic.png"/>
                    <img v-if="i.image != null" :src="require(`@/assets/menu/${i.image}`)"/>
                </div>

                <div class="menu-item-innercenter">
                    <div class="name">
                        {{i.name}}
                    </div>
                    <div class="description">
                        {{i.description}}
                    </div>
                    <div class="price">
                        {{numberFormat(i.price)}}원
                    </div>
                </div>

                <div class="menu-item-innerright">
                    <i class="fas fa-angle-right" @click="gotoMenuInfo(i.idx)"></i>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
export default {
    data: function() {
        return {
            items: [],
            mName: '',
            type: ''
        }
    },
    created: function() {
        let thisVue = this
        thisVue.mName = localStorage.getItem('_menu-mName')
        let mType = localStorage.getItem('_menu-mType')

        if(mType === '0') {
            thisVue.$axios.get('http://localhost:8090/mydelivery/api/GetRecommendOrderMenu').then(function(response) {
                thisVue.items = response.data
            }).catch(function(error) {
                console.error(error)
            })
        }
        else {
            thisVue.$axios.get('http://localhost:8090/mydelivery/api/GetOrderMenu', {
                params: {
                    // type: thisVue.$route.params.type
                    type: mType
                }
            }).then(function(response) {
                thisVue.items = response.data
            }).catch(function(error) {
                console.error(error)
            })
        }
    },
    methods: {
        /**
         * 선택한 메뉴의 정보 페이지로 이동합니다.
         * @param idx   선택한 메뉴 번호
         */
        gotoMenuInfo: function(idx) {
            localStorage.setItem('_menu-itemidx', idx)
            this.$router.push({
                name: 'AppOrderMenuInfo'
            })
        },
        /**
         * 숫자를 포멧합니다.
         * @param num   포멧할 숫자
         * @return      포멧된 숫자   
         */
        numberFormat: function(num) {
            return num.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",")
        }
    }
}
</script>

<style scoped>
.menu-item-root {
    margin-top: 60px;
}
.menu-item {
    width: 100%;
    display: flex;
    flex-direction: column;

    padding-bottom: 18px;
    margin-bottom: 18px;
    border-bottom: 1px solid #eee;
}

.menu-item-inner {
    width: 100%;
    height: 116px;
    display: flex;
    flex-direction: row;
    justify-content: center;
    text-align: center;
}
.menu-item-inner .menu-item-innerleft {
    width: 25%;
}
.menu-item-inner .menu-item-innerleft img {
    width: 116px;
    height: 116px;
}
.menu-item-inner .menu-item-innercenter {
    display: flex;
    flex-direction: column;
    align-items: flex-start;
    align-content: center;
    width: 60%;
    text-align: left;
    padding-left: 20px;
}
.menu-item-innercenter .name {
    font-size: 22px;
    font-weight: bold;
    color: #000;
}
.menu-item-innercenter .description {
    height: 100%;
}
.menu-item-innercenter .price {
    align-items: flex-end;
    color: #42b983;
}
.menu-item-inner .menu-item-innerright {
    width: 10%;
    text-align: center;
}
.menu-item-innerright i {
    cursor: pointer;
    line-height: 100px;
    font-size: 32px;
    text-align: center;
}
</style>