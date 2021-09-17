import Vue from 'vue'
import VueRouter from 'vue-router'

import AppMain from '../views/AppMain'
import AppCart from '../views/AppCart'
import AppOrder from '../views/AppOrder'
import AppAddress from '../views/AppAddress'
import AppOrderMenu from '../views/AppOrderMenu'
import AppOrderMenuItems from '../views/AppOrderMenuItems'
import AppOrderMenuInfo from '../views/AppOrderMenuInfo'

Vue.use(VueRouter)

const routes = [
  // {
  //   path: '/',
  //   name: 'Home',
  //   component: Home
  // }
    {
        path: '/',
        name: 'AppMain',
        component: AppMain
    },
    {
        path: '/cart',
        name: 'AppCart',
        component: AppCart
    },
    {
        path: '/order',
        name: 'AppOrder',
        component: AppOrder
    },
    {
        path: '/address',
        name: 'AppAddress',
        component: AppAddress
    },
    {
        path: '/ordermenu',
        name: 'AppOrderMenu',
        component: AppOrderMenu
    },
    {
        path: '/ordermenuitems',
        name: 'AppOrderMenuItems',
        component: AppOrderMenuItems
    },
    {
        path: '/ordermenuinfo',
        name: 'AppOrderMenuInfo',
        component: AppOrderMenuInfo
    }
]

const router = new VueRouter({
    mode: 'history',
    routes
})

export default router
