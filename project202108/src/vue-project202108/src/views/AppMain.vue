<template>
    <div>

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
                            닫기
                        </p>
                    </div>

                </div>
            </div>
        </div>

        <div class="main">

            <div class="banner">
                <img class="banner-image" @click="onClickToChangeBanner()" :src="require(`@/assets/banner/${bannerImage}`)"/>
            </div>

            <div class="shortcut-group">
                <div id="my-delivery" @click="gotoDeliveryState()">
                    배달 상황 확인
                </div>
                <div id="order" @click="gotoOrder()">
                    주문하기
                </div>
            </div>
        </div>
    </div>
</template>

<script>
export default {
    data: function() {
        return {
            bannerImage: '',
            bannerImageIndex: 0,
            bannerImageList: [
                'event_banner001.jpg',
                'event_banner002.jpg'
            ],

            openAlert: false,
            alertHeader: '',
            alertContent: ''
        }
    },
    created: function() {
        this.bannerImage = this.bannerImageList[this.bannerImageIndex]
    },
    methods: {
        onClickToChangeBanner: function() {
            if(this.bannerImageIndex < this.bannerImageList.length - 1)
                this.bannerImageIndex ++
            else
                this.bannerImageIndex = 0
            this.bannerImage = this.bannerImageList[this.bannerImageIndex]
        },
        gotoDeliveryState: function() {
            this.openAlert = true
            this.alertHeader = 'Error :/'
            this.alertContent = '구현되지 않은 기능입니다.'
        },
        gotoOrder: function() {
            this.$router.push({name: 'AppOrder'})
        },
        closeAlert: function() {
            this.openAlert = false
            this.alertHeader = ''
            this.alertContent = ''
        }
    }
}
</script>

<style scoped>
.main {
    position: relative;
    margin-top: 60px;
    display: flex;
    flex-direction: column;
}

.banner {
    
}
.banner .banner-image {
    width: 100%;
    cursor: pointer;
}

.shortcut-group {
    margin-top: 16px;
    display: flex;
    justify-content: center;
    align-items: center;
}
.shortcut-group div {
    cursor: pointer;
    width: 50%;
    padding: 32px 0;
    font-size: 20px;
    background: #42b983;
    border-radius: 5px;
    color: #fff;
}
.shortcut-group #my-delivery {
    cursor: not-allowed;
    margin-right: 6px;
    background: #4279b9;
}
.shortcut-group #order {
    margin-left: 6px;
}

</style>