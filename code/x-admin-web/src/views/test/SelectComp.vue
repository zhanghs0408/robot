<template>
    <el-select v-model="val" filterable :placeholder="'请选择'+select.name" @change="change">
        <el-option
                v-for="item in select.data"
                :key="item.value"
                :label="item.label"
                :value="item.value">
        </el-option>
    </el-select>
</template>

<script>
    export default {
        name: "SelectComp",
        data() {
            return {

                //value: this.select.selectResult
                //val:''
            }
        },
        computed:{
           val:{
                get() {
                    //this.change(this.select.selectResult)
                    return this.value
                },
                set(){

                }
            }
        },
        props:{
            select:Object,
            value:String
        },
        methods:{
            change(val){
                //this.select.selectResult=val
                //this.select.change&&this.select.change(val);
                //this.select.children&&this.select.children(this.buildChild(val));

                this.$emit('input',val)

                this.$emit('callback',val)
            },
            buildChild(val){
                let select_item = this.select.data.find(item=>{
                    return item.value==val
                })
                return select_item&&select_item.children
            }
        }
    }
</script>

<style scoped>

</style>