<template>
   <div>
      <el-breadcrumb separator-class="el-icon-arrow-right">
            <el-breadcrumb-item :to="{ path:'/home'}">首页</el-breadcrumb-item>
            <el-breadcrumb-item>学生中心</el-breadcrumb-item>
            <el-breadcrumb-item>课表查看</el-breadcrumb-item>
        </el-breadcrumb>
   
          <el-table
                :data="list" border stripe
                style="width: 100%">
            <el-table-column aria-disabled="false"
                    prop="time"
                    label=""
                    width="120">
            </el-table-column>
            <el-table-column
                    prop="day1"
                    label="星期一"
                    width="120">
            </el-table-column>
               <el-table-column
                    prop="day2"
                    label="星期二"
                    width="120">
            </el-table-column>
              <el-table-column
                    prop="day3"
                    label="星期三"
                    width="120">
            </el-table-column>
                <el-table-column
                    prop="day4"
                    label="星期四"
                    width="120">
            </el-table-column>
                 <el-table-column
                    prop="day5"
                    label="星期五"
                    width="120">
            </el-table-column>
              <el-table-column
                    prop="day6"
                    label="星期六"
                    width="120">
            </el-table-column>
               <el-table-column
                    prop="day7"
                    label="星期天"
                    width="120">
            </el-table-column>
    
        </el-table>
       
   </div>
</template>
<script>
  import Cookies from "js-cookie";
export default {
     name: "mysourse.vue",
        created() {
           this.getList();
        },
         mounted(){
          this.getCookie();
    },
        data(){
            return{
                username:'',
                queryForm:{
                    cname:'',
                    username:'',
                    stuName:'',
                },
                list:[],
                addDiaLog:false,
                addForm:{
                  cid:'',
                    cname:'',
                    username:'',
                    weekday:'',
                    time:'',
                    num:'',
                    lesson:'',
                    address:'',
                    remake:'',
                    stuName:''
                },
                username:'',
                 options: [{
                  value: '星期一',
                  label: '星期一'
                  }, {
                  value: '星期二',
                  label: '星期二'
                  }, {
                  value: '星期三',
                  label: '星期三'
                  }, {
                  value: '星期四',
                  label: '星期四'
                  }, {
                  value: '星期五',
                  label: '星期五'
                 },
                 {
                  value: '星期六',
                  label: '星期六'
                 },
                 {
                  value: '星期天',
                  label: '星期天'
                 },
                 ],
                 optionad:[
                    { value: 'J060 402',
                      label: 'J060 402'},
                    { value: 'J060 406',
                      label: 'J060 406'},
                    { value: 'J060 504',
                      label: 'J060 504'},
                    { value: 'J060 506',
                      label: 'J060 506'},
                    { value: 'J060 508',
                      label: 'J060 508'},
                    { value: 'J060 610',
                      label: 'J060 610'},
                    { value: 'J060 612',
                      label: 'J060 612'},
                    { value: 'J060 705',
                      label: 'J060 705'},
                    { value: 'J060 707',
                      label: 'J060 707'},
                      
                    { value: 'J140 611',
                      label: 'J140 611'},
                    { value: 'J140 713',
                      label: 'J140 713'},
                    { value: 'J140 718',
                      label: 'J140 718'},
                 ],
                 optiont: [{
                  value: '08:10-09:50',
                  label: '08:10-09:50'
                  }, {
                  value: '10:30-12:10',
                  label: '10:30-12:10'
                  }, {
                  value: '14:10-15:50',
                  label: '14:10-15:50'
                  }, {
                  value: '16:30-18:10',
                  label: '16:30-18:10'
                  },{
                  value: '19:00-20:40',
                  label: '19:00-20:40'
                  }
                 ],
                    addRules: {
                    cname: [
                        {required: true, message: '请输入名称', trigger: 'blur'},
                    ],
                    weekday: [
                        {required: true,message: '请选择星期数',trigger: 'blur'},
                    ],
                    time: [
                        {required: true,message: '请选择时间',trigger: 'blur'},
                    ],
                      num: [
                        {required: true, message: '请输入课余量', trigger: 'blur'},
                    ],
                    lesson: [
                        {required: true,message: '请输入课时',trigger: 'blur'},
                    ],
                    address: [
                        {required: true,message: '请输入场地',trigger: 'blur'},
                    ],
                },
            }
        },
          methods:{
              created(){
                 this.getList();
                 this.username=Cookies.get("username");
                 console.log(this.username)
              },
            getCookie() {
            const username = Cookies.get("username");
           },
            async getList(){
                this.queryForm.stuName=Cookies.get("username")
                 const {data:res} = await this.$http.post("mysourceList?username="+Cookies.get("username"));
                 this.list =res.list;
               },
              async dropCourse(row){
                    row.stuName= Cookies.get("username");
                        const confimResust=await this.$confirm('确定退课？','提示',{
                confirmButtonText:'确定',
                cancelButtonText:'取消',
                 type:'warning'
                }).catch(err=>err)
                 if(confimResust!='confirm'){
              return this.$message.info("已取消退课");
            }
                     const {data:res} = await this.$http.post("dropCourse",row);
                   if(res=="Success"){
                      this.addDiaLog=false;
                     this.getList()
                     this.$message({
                    message: '退课成功！',
                    type: 'success'
                   });
                    
                   }
                else{
                    this.$message.error('退课失败！');
                }
               },
            
    
          }
}
</script>
<style scoped lang="less" scoped>
  .el-breadcrumb{
        padding-top: 20px;
        margin-bottom: 15px;
        font-size: 17px;
    }
      .input1{
        padding-top: 10px;
        padding-right: 10px;
        padding-left: 20px;
        width: 200px;
    }
      .input2{
        padding-top: 10px;
        padding-right: 10px;
        padding-left: 20px;
        width: 200px;
    }
    .slect1{
      width: 200px;
    }
</style>