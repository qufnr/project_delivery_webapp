<template>
    <div class="order-root">
        <div class="order-header">
            배달할 주소지를 선택해주세요.
        </div>

        <div class="order-content">
            <div class="order-address" v-if="hasOrderAddress()">
                <div>
                    다음 주소로 배달합니다:
                </div>
                <div class="order-myaddress">
                    {{address}}<br/>{{address2}}
                </div>
                <div class="order-address-btn" @click="gotoOrderMenu()">
                    주문하기
                </div>
                <div class="order-address-btn btn-blue" @click="gotoAddress()">
                    주소 변경
                </div>
                <!-- <div class="order-address-btn btn-red" @click="clearAddress()">
                    주소 지우기
                </div> -->
            </div>
            <div class="order-address" v-if="!hasOrderAddress()">
                <div>
                    귀하는 배달 주소지를 설정하지 않았습니다.
                </div>
                <div class="order-address-btn" @click="gotoAddress()">
                    주소 추가
                </div>
            </div>
        </div>
    </div>
</template>

<script>
export default {
    data: function() {
        return {
            address: undefined,
            address2: undefined
        }
    },
    methods: {
        /**
         * 설정된 주소지가 있는지 여부를 반환합니다.
         * @return 설정된 주소가 있다면 true를 반환합니다.
         */
        hasOrderAddress: function() {
            return localStorage.getItem('my-address') != null
        },
        /**
         * 주소지를 지웁니다.
         */
        clearAddress: function() {
            localStorage.clear()
            this.address = undefined
        },
        /**
         * 주소지 설정 라우터로 이동합니다.
         */
        gotoAddress: function() {
            this.$router.push({
                name: 'AppAddress'
            })
        },
        gotoOrderMenu: function() {
            this.$router.push({
                name: 'AppOrderMenu'
            })
        }
    },
    mounted: function() {
        this.address = localStorage.getItem('my-address')
        this.address2 = localStorage.getItem('my-address2')
    }
}
</script>

<style scoped>
.order-root {
    margin-top: 60px;
    text-align: left;
}

.order-header {
    font-size: 26px;
    padding-bottom: 6px;
    border-bottom: 1px solid #bbbbbb;
    margin-bottom: 12px;
}

.order-content .order-address div {
    margin-bottom: 12px;
}
.order-content .order-myaddress {
    padding-top: 0;
    text-align: center;
    color: #4381d3;
    font-weight: bold;
    font-size: 22px;
}

.order-address-btn {
    cursor: pointer;
    text-align: center;
    background: #42b983;
    color: #fff;
    font-size: 20px;
    line-height: 48px;
    border-radius: 5px;
}
.order-address-btn:hover {
    background: #2d7e59;
}
.btn-blue {
    cursor: pointer;
    background: #425ed8;
}
.btn-blue:hover {
    background: #2a3b86;
}
.btn-red {
    cursor: pointer;
    background: #c53131;
}
.btn-red:hover {
    background: #7c1e1e;
}
</style>