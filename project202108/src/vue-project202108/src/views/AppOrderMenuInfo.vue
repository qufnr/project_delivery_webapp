<template>
    <div class="menu-info-root">

        <div class="alert-box-root" v-if="openAlert">
            <div class="alert-box-bg">
                <div class="alert-box">
                    
                    <div class="alert-header">
                        {{alertHeader}}
                    </div>

                    <div class="alert-content">
                        {{alertContent}}
                    </div>

                    <div class="alert-footer">
                        <p id="alert-close" @click="closeInfoAlert()">
                            닫기
                        </p>
                    </div>

                </div>
            </div>
        </div>

        <div class="menu-info">
            <!-- 메뉴 이름 -->
            <div class="menu-info-name">
                {{name}}
            </div>

            <!-- 메뉴 사진 -->
            <div class="menu-info-title">
                <div class="menu-info-image" v-if="image != undefined">
                    <img :src="require(`@/assets/menu/${image}`)"/>
                </div>
                <div class="menu-info-image" v-if="image == undefined">
                    <div class="template-image">상품사진</div>
                </div>
                <div class="menu-info-price">
                    {{numberFormat(price * count)}}원
                </div>
            </div>

            <!-- 메뉴 상세 디테일 -->
            <div class="menu-info-detail">
                <div class="detail-info">
                    <i class="fas fa-utensils" @click="openInfoAlert(1)"></i>
                    <i class="fas fa-info" @click="openInfoAlert(2)"></i>
                </div>
                <div class="detail-kcal">
                    {{numberFormat(kcal * count)}} Kcal
                </div>
            </div>

            <!-- 장바구니 추가 -->
            <div class="menu-info-buy">
                <div class="menu-info-addbtn">
                    <div id="arrow-left" @click="subCount()">
                        <i class="fas fa-angle-left"></i>
                    </div>
                    <div id="counts">
                        {{count}}
                    </div>
                    <div id="arrow-right" @click="addCount()">
                        <i class="fas fa-angle-right"></i>
                    </div>
                </div>
                <div class="menu-info-addcart">
                    <div id="addcart" @click="addCart()">
                        장바구니 담기
                    </div>
                </div>
            </div>

            <!-- 메뉴 설명 -->
            <div class="menu-desc">
                <div class="menu-desc-head">
                    메뉴 설명
                </div>
                <div class="menu-desc-body">
                    {{description}}
                </div>
            </div>
        </div>
    </div>
</template>

<script>
export default {
    data: function() {
        return {
            idx: undefined,
            type: undefined,
            name: undefined,
            description: undefined,
            price: undefined,
            image: undefined,
            nutrientInfo: undefined,
            allergieInfo: undefined,
            kcal: undefined,

            count: 1,
            openAlert: false,
            alertHeader: undefined,
            alertContent: undefined
        }
    },
    mounted: function() {
        let thisVue = this
        thisVue.$axios.get('http://localhost:8090/mydelivery/api/GetOrderMenuInfo', {
            params: {
                idx: localStorage.getItem('_menu-itemidx')
            }
        }).then(function(response) {
            thisVue.idx = response.data.idx
            thisVue.type = response.data.type
            thisVue.name = response.data.name
            thisVue.description = response.data.description
            thisVue.price = response.data.price
            thisVue.image = response.data.image
            thisVue.nutrientInfo = response.data.nutrientInfo
            thisVue.allergieInfo = response.data.allergieInfo
            thisVue.kcal = response.data.kcal
        })
    },
    methods: {
        openInfoAlert: function(target) {
            this.openAlert = true
            if(target == 1) {
                this.alertHeader = "알레르기 정보"
                this.alertContent = this.allergieInfo
            }
            else if(target == 2) {
                this.alertHeader = "영양 정보"
                this.alertContent = this.nutrientInfo
            }
        },
        closeInfoAlert: function() {
            this.openAlert = false
            this.alertHeader = undefined
            this.alertContent = undefined
        },
        /**
         * 상품 개수를 추가합니다.
         */
        addCount: function() {
            this.count ++
        },
        /**
         * 상품 개수를 차감합니다.
         */
        subCount: function() {
            if(this.count > 1)
                this.count --
        },
        /**
         * 상품을 장바구니에 담습니다.
         */
        addCart: function() {
            let thisVue = this

            let indexes = 0
            let isSame = false
            let price = 0
            let count = 0
            let cartItem = null
            if(localStorage.length > 0) {
                for(let i = 0; i < localStorage.length; i ++) {
                    if(Number(indexes) < Number(localStorage.key(i))) {
                        indexes = localStorage.key(i)

                        cartItem = JSON.parse(localStorage.getItem(localStorage.key(i)))

                        if(JSON.stringify(cartItem.menu) == this.name) {
                            isSame = true
                            price = cartItem.price
                            count = cartItem.count
                            break;
                        }
                    }
                }
            }

            let value = null
            if(isSame) {
                value = {
                    id: indexes,
                    idx: this.idx,
                    type: this.type,
                    menu: this.name,
                    description: this.description,
                    price: this.price + price,
                    count: this.count + count
                }
            }
            else {
                indexes = Number(indexes) + 1
                value = {
                    id: indexes,
                    idx: this.idx,
                    type: this.type,
                    menu: this.name,
                    description: this.description,
                    price: this.price,
                    count: this.count
                }
            }

            localStorage.setItem(indexes, JSON.stringify(value))

            thisVue.$router.push({
                name: 'AppOrderMenuItems',
                params: {
                    type: thisVue.type
                }
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
.menu-info-root {
    margin: 0 auto;
    margin-top: 60px;
    width: 100%;
}

.menu-info {
    display: flex;
    flex-direction: column;
    justify-content: center;
    text-align: left;
    width: 100%;
}
.menu-info-name {
    line-height: 32px;
    text-align: left;
    font-size: 32px;
    font-weight: bold;
    margin-bottom: 12px;
}
.menu-info-title {
    display: flex;
    flex-direction: row;
    align-items: flex-end;

    padding-bottom: 12px;
    margin-bottom: 12px;
    border-bottom: 1px solid #666;
}
.menu-info-title .menu-info-image img {
    width: 190px;
    height: 190px;
}
.menu-info-title .menu-info-price {
    width: 100%;
    text-align: right;
    font-size: 24px;
    font-weight: bold;
    color: #42b983;
}
.menu-info-detail {
    display: flex;
    flex-direction: row;
    justify-content: space-around;
    text-align: left;
    align-items: flex-start;
    margin-bottom: 18px;
}
.menu-info-detail .detail-info {
    width: 50%;
}
.menu-info-detail .detail-info i {
    margin-top: 4px;
    cursor: pointer;
    font-size: 24px;
    margin-right: 32px;
}
.menu-info-detail .detail-kcal {
    width: 50%;
    text-align: right;
    font-size: 20px;
    color: #929292;
}

.menu-info-buy {
    width: 100%;
    display: flex;
    flex-direction: row;
    margin-bottom: 18px;
}
.menu-info-buy .menu-info-addbtn {
    width: 40%;
    display: flex;
    flex-direction: row;
    font-size: 28px;
    background: #e0e0e0;
    border-radius: 5px;
}
.menu-info-buy .menu-info-addbtn #counts {
    margin: 0 24px;
    width: 70%;
    text-align: center;
}
.menu-info-buy .menu-info-addbtn #arrow-left,
.menu-info-buy .menu-info-addbtn #arrow-right {
    cursor: pointer;
    width: 15%;
    background: #42b983;
    color: #fff;
    padding: 0 26px;
    border-radius: 5px;
    text-align: center;
}
.menu-info-buy .menu-info-addcart {
    width: 60%;
    text-align: right;
}
.menu-info-buy .menu-info-addcart #addcart {
    cursor: pointer;
    background: #ccc;
    text-align: center;
    margin-left: 32px;
    line-height: 40px;
    font-size: 18px;
    font-weight: bold;
    border-radius: 5px;
    background: #faed7b;
}

.menu-desc {
    display: flex;
    flex-direction: column;
}
.menu-desc .menu-desc-head {
    border-top: 1px solid #888;
    border-bottom: 1px solid #888;
    font-size: 22px;
    font-weight: bold;
    background: #f0f0f0;
    margin-bottom: 6px;
}
.menu-desc .menu-desc-body {
    font-size: 18px;
}


.template-image {
    width: 190px;
    height: 190px;
    background: #888888;
    text-align: center;
    font-size: 26px;
    line-height: 180px;
}
</style>