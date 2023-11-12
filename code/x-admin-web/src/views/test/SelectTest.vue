<template>
    <div style="margin: 20px;">
        <SelectComp :select="select" @callback="setData"></SelectComp>
        <SelectComp :select="selectC"></SelectComp>
    </div>
</template>

<script>
    import SelectComp from "./SelectComp";

    export default {
        name: "SelectTest",
        components:{SelectComp},
        data(){
            return{
                data:{},
                selectC:{
                    selectResult:'',
                    name:'食物子项',
                    data:[]
                },
                select:{
                    selectResult:'选项2',
                    name:'食物',
                    data:[{
                        value: '选项1',
                        label: '黄金糕',
                        children:[
                            {
                                value: '选项1-1',
                                label: '黄金糕1-1'
                            },
                            {
                                value: '选项1-2',
                                label: '黄金糕1-2'
                            },
                        ]
                    }, {
                        value: '选项2',
                        label: '双皮奶',
                        children:[
                            {
                                value: '选项2-1',
                                label: '双皮奶2-1'
                            },
                            {
                                value: '选项2-2',
                                label: '双皮奶2-2'
                            },
                        ]
                    }, {
                        value: '选项3',
                        label: '蚵仔煎'
                    }, {
                        value: '选项4',
                        label: '龙须面'
                    }, {
                        value: '选项5',
                        label: '北京烤鸭'
                    }],
                    change:(data)=>{
                            console.log(data)
                        this.selectC.data=data
                    }
                }

            }
        },
        methods:{
            setData(data){
                console.log(data)
            }
        }
    }
</script>

<style scoped>

</style>