<template>
    <div class="cart-list-root">

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
                        <p id="alert-close" @click="closeAlert()">
                            {{closeBtnName}}
                        </p>
                    </div>

                </div>
            </div>
        </div>

        <div v-if="totalPrice <= 0" style="font-size:18px;text-align:center;line-height:56px;">
            장바구니가 비어있습니다.
        </div>
        <div v-if="totalPrice > 0">
            <div class="content-header">
                장바구니 목록
            </div>
            <div class="cart-list">
                <div class="cart-item" v-for="item in cartItems" v-bind:key="item.id">
                    <div class="cart-item-header">
                        <div class="name">
                            {{item.menu}}
                        </div>
                        <div class="delete">
                            <a style="cursor:pointer" @click="deleteCart('' + item.id)">
                                <i class="far fa-trash-alt"></i>
                            </a>
                        </div>
                    </div>
                    <div class="cart-item-content">
                        {{item.description}}
                    </div>
                    <div class="cart-item-footer">
                        <div class="price">{{numberFormat(item.price)}}원</div>
                        <div class="count">{{item.count}}개</div>
                    </div>
                </div>
            </div>
            <div class="cart-footer">
                <div id="totalPrice">
                    총 주문 금액: <span>{{numberFormat(totalPrice)}}원</span>
                </div>
                <div id="orderDone" @click="orderDone()">주문하기</div>
            </div>
        </div>

        <!-- <button type="button" @click="clearCart()">장바구니 비우기</button> -->
    </div>
</template>

<script>
export default {
    data: function() {
        return {
            cartItems: [],
            totalPrice: 0,

            openAlert: false,
            closeBtnName: '',
            alertHeader: '',
            alertContent: ''
        }
    },
    methods: {
        /**
         * 장바구니 모두 지우기
         */
        clearCart: function() {
            if(localStorage.length > 0) {
                for(let i = 0; i < localStorage.length; i ++) {
                    if(localStorage.key(i) !== 'loglevel:webpack-dev-server' &&
                        localStorage.key(i) !== 'my-address' &&
                        localStorage.key(i) !== 'my-address-secondary' &&
                        localStorage.key(i) !== '_menu-mType' &&
                        localStorage.key(i) !== '_menu-mName' &&
                        localStorage.key(i) !== '_menu-itemidx') {
                        localStorage.removeItem(localStorage.key(i))
                    }
                }
                this.cartItems = []
                this.totalPrice = 0
            }
        },
        /**
         * 선택한 항목만 지우기
         * @param id    항목 ID
         */
        deleteCart: function(id) {
            if(localStorage.length > 0) {
                for(let i = 0; i < localStorage.length; i ++) {
                    if(localStorage.key(i) === id) {
                        localStorage.removeItem(localStorage.key(i))
                        this.$router.go()
                    }
                }
            }
        },
        /**
         * 주문 처리
         */
        orderDone: function() {
            if(localStorage.getItem('my-address') == null || localStorage.getItem('my-address-secondary') == null) {
                this.openAlert = true
                this.closeBtnName = '닫기'
                this.alertHeader = 'Error :/'
                this.alertContent = "배달 주소를 작성해주세요."
            }
            else {
                this.openAlert = true
                this.closeBtnName = '확인'
                this.alertHeader = '주문 완료'
                this.alertContent = '주문이 완료되었습니다.'
            }
        },
        closeAlert: function() {
            this.openAlert = false
            if(this.alertHeader === '주문 완료') {
                this.clearCart()
                this.$router.push({
                    name: 'AppMain'
                })
            }
        },
        /**
         * 숫자를 포멧합니다.
         * @param num   포멧할 숫자
         * @return      포멧된 숫자   
         */
        numberFormat: function(num) {
            return num.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",")
        }
    },
    created: function() {
        if(localStorage.length > 0) {
            for(let i = 0; i < localStorage.length; i ++) {
                if(localStorage.key(i) !== 'loglevel:webpack-dev-server' &&
                    localStorage.key(i) !== 'my-address' &&
                    localStorage.key(i) !== 'my-address-secondary' &&
                    localStorage.key(i) !== '_menu-mType' &&
                    localStorage.key(i) !== '_menu-mName' &&
                    localStorage.key(i) !== '_menu-itemidx') {
                    this.cartItems.push(JSON.parse(localStorage.getItem(localStorage.key(i))))
                }
            }

            for(let i = 0; i < localStorage.length; i ++) {
                this.totalPrice += this.cartItems[i].price;
            }
        }
    }
}
</script>

<style scoped>
.cart-list-root {
    margin-top: 60px;
}
.cart-list {
    width: 100%;
    display: flex;
    flex-direction: column;
}
.cart-list .cart-item {
    display: flex;
    flex-direction: column;
    border-radius: 3px;
    border: 1px solid #999;
    text-align: left;
    padding: 8px 18px;
    margin-bottom: 18px;
}
.cart-list .cart-item .cart-item-header {
    width: 100%;
    display: flex;
    flex-direction: right;
}
.cart-list .cart-item .cart-item-header .name {
    width: 80%;
    font-weight: bold;
    font-size: 18px;
    text-align: left;
}
.cart-list .cart-item .cart-item-header .delete {
    width: 20%;
    font-size: 20px;
    text-align: right;
}
.cart-list .cart-item .cart-item-footer {
    display: flex;
    flex-direction: row;
}
.cart-list .cart-item .cart-item-footer .price {
    width: 60%;
}
.cart-list .cart-item .cart-item-footer .count {
    width: 40%;
}
.cart-list .cart-item div {
    line-height: 32px;
}
.cart-footer {
    display: flex;
    flex-direction: row;
    margin: 0 6px;
}
.cart-footer #totalPrice {
    width: 50%;
    text-align: left;
}
.cart-footer #totalPrice span {
    font-weight: bold;
    font-size: 20px;
    color: #42b983;
}
.cart-footer #orderDone {
    cursor: pointer;
    width: 50%;
    text-align: center;
    background: #42b983;
    color: #fff;
    border-radius: 5px;
    font-size: 20px;
    line-height: 36px;
}
</style>