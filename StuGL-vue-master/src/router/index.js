import Vue from 'vue'
import VueRouter from 'vue-router'
//引入login组件
import Login from '../components/Login.vue'
//引用Home组件，新建的组件要导入这
import Home from '../components/Home.vue'
//引用Welcome组件，新建的组件要导入这
import Welcome from '../components/Welcome.vue'
//引用UserList组件，新建的组件要导入这
import UserList from '../components/admin/UserList.vue'
import Rights from '../components/admin/Rights.vue'
import Info from '../components/admin/Info.vue'
import Course from '../components/admin/Course.vue'
import Source from '../components/admin/Source.vue'
import Mysource from '../components/admin/Mysource.vue'
import Mycourse from '../components/admin/Mycourse.vue'
import Verify from '../components/admin/Verify.vue'
import Regist from '../components/Regist.vue'
import Visit from '../components/admin/Visit.vue'
import Visitor from '../components/admin/Visitor.vue'

Vue.use(VueRouter)

const routes = [
  {
    path:"/",
    redirect:"/login" //重定向
  },
  {
    path:'/login',
    component:Login
  },
  
  {
    path:'/regist',
    component:Regist,
  },

  {
    path:"/home",
    component:Home,
    redirect:"/welcome",
    children:[
      {
        path:"/welcome",
        component:Welcome,
      },
      {
        path:"/user",
        component:UserList,
      },
      {
        path:"/rights",
        component:Rights,
      } ,
      {
        path:"/info",
        component:Info,
      },
      {
        path:"/course",
        component:Course,
      },
      {
        path:"/source",
        component:Source,
      },
      {
        path:"/mycourse",
        component:Mycourse,
      },
      {
        path:"/mysource",
        component:Mysource,
      },
      {
        path:"/verify",
        component:Verify,
      },
      {
        path:"/visit",
        component:Visit,
      },
      {
        path:"/visitor",
        component:Visitor,
      }
    ]
  }
]

const router = new VueRouter({
  routes
})

// 出现问题的时候使用
const originalPush = VueRouter.prototype.push
VueRouter.prototype.push = function push(location, onResolve, onReject) {
  if (onResolve || onReject) return originalPush.call(this, location, onResolve, onReject)
  return originalPush.call(this, location).catch(err => err)
}

//挂在路由导航守卫
router.beforeEach((to,from,next)=>{
  //to 将要访问
  //from 从哪访问
  //next 接着干的事  next(url)如果有写，将重定向到url上；没有写，next()继续访问to路径
  if(to.path=='/login'||to.path=='/regist')  return next();
  //获取user
  const userFlag=window.sessionStorage.getItem("user"); //取出当前用户
  if(!userFlag) return next('/login'); //无值，返回登录页
  next(); //符合要求 放行
})

export default router  //暴露出去
 