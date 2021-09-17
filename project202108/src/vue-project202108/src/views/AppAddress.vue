<template>
    <div class="address-form">

        <div class="alert-box-root" v-if="openAlert">
            <div class="alert-box-bg">
                <div class="alert-box">
                    
                    <div class="alert-header">
                        Error :/
                    </div>

                    <div class="alert-content">
                        {{errorMessage}}
                    </div>

                    <div class="alert-footer">
                        <p id="alert-close" @click="closeAlert()">
                            닫기
                        </p>
                    </div>

                </div>
            </div>
        </div>

        <div class="address-form-header">
            <div class="address-form-header-inner">
                <div style="width:70%">
                    <input type="text" ref="juso1" class="address-juso" v-model="address" placeholder="주소" disabled/>
                </div>
                <div style="width:30%">
                    <button type="button" class="address-jusofind" @click="openAddressEmbed()">주소 찾기</button>
                </div>
            </div>
        </div>

        <div>
            <input type="text" ref="juso2" class="address-juso2" v-model="address2" placeholder="정확한 배달을 위해 아파트의 동, 호 수를 입력해주세요." disabled/>
        </div>

        <div ref="addrembed" class="address-embed">
        </div>

        <div class="address-done">
            <a @click="addressDone()">확인</a>
        </div>

    </div>
</template>

<script>
export default {
    data: function() {
        return {
            address: '',
            address2: '',

            openAlert: false,
            errorMessage: ''
        }
    },
    methods: {
        openAddressEmbed: function() {
            new window.daum.Postcode({
                oncomplete: (data) => {
                    let roadAddr = data.roadAddress
                    let extraRoadAddr = ''

                    if(data.bname !== '' && /[도|로|가]$/g.test(data.bname))
                        extraRoadAddr += data.bname
                    
                    if(data.buildingName != '' && data.apartment === 'Y')
                        extraRoadAddr += ((extraRoadAddr !== '') ? ', ' + data.buildingName : data.buildingName)
                    
                    if(extraRoadAddr !== '')
                        extraRoadAddr = ' (' + extraRoadAddr + ')'
                    
                    if(roadAddr !== '')
                        roadAddr += extraRoadAddr

                    this.address = data.zonecode + " " + roadAddr
                    this.$refs.juso2.disabled = false
                },
                width: '100%', height: '100%'
            }).embed(this.$refs.addrembed)
        },
        addressDone: function() {
            if(this.address === '' || this.address2 === '') {
                this.openAlert = true
                this.errorMessage = '주소를 입력해주세요.'
            }
            else {
                localStorage.setItem('my-address', this.address)
                localStorage.setItem('my-address-secondary', this.address2)
                this.$router.push({
                    name: 'AppOrder'
                })
            }
        },
        closeAlert: function() {
            this.openAlert = false
            this.errorMessage = ''
        }
    }
}
</script>

<style scoped>
.address-embed {
    margin-top: 16px;
    position: relative;
    margin: 0 auto;
    height: 350px;
}
.address-form {
    width: 100%;
    margin-top: 60px;
}
/* .address-form-header {

} */
.address-form-header-inner {
    width: 100%;
    display: flex;
}

.address-juso {
    width: 100%
}
.address-jusofind {
    margin-left: 12px;
}
.address-juso2 {
    margin-top: 16px;
    width: 99%;
}

.address-done {
    margin: 20px 0;
    font-size: 22px;
    color: #42b983;
}
.address-done a {
    cursor: pointer;
}

input[type=text] {
    height: 34px;
    border: 1px solid #bbb;
    border-radius: 5px;
    font-size: 18px;
}
input[type=text]::placeholder {
    font-weight: 300;
    color: #c0c0c0;
}
button {
    cursor: pointer;
    height: 37px;
    background: #42b983;
    color: #fff;
    border: none;
    border-radius: 5px;
    font-size: 18px;
    font-weight: 300;
    padding: 4px 21px;
}
</style>