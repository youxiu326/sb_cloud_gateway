/*
* ajax封装:
* 1. 引入文件
* 2. new Vue().ajax.get(url,data,fn,ojson), 或 new Vue().ajax.post(url,data,fn,ojson)
*     url: 需要获取数据的文件地址 (string)
*     data: 需要发送的信息 (可省略) (obj)
*     fn: 获取信息后的回调函数,接收到的返回值为data (function)
*     ojson: 是否需要转换为json格式 (可省略) (设置为 "json")
*
* 3. new Vue().ajax.get().cancel(): 取消异步请求
* 4. new Vue().ajax.json(str): 可转化json格式字符串
**/
Vue.prototype.ajax={
    //添加url传送信息
    addUrl: function (url,obj){
        //如果省略url，则为post请求，令obj为url，令url为null
        if(arguments.length==1){
            obj=url;
            url=null;
        }
        //url不为空(get请求: 设置url信息)
        if(!!url){
            for(var k in obj){
                url += (url.indexOf("?")==-1 ? "?" : "&");
                url+=encodeURIComponent(k)+ "=" +encodeURIComponent(obj[k]);
            }
        }else{
            //post请求(设置data信息)
            url="";
            for(var k in obj){
                url+=encodeURIComponent(k)+ "=" +encodeURIComponent(obj[k]);
                url+="&";
            }
            //删除最后一个&
            var arr=url.split("");
            arr.pop();
            url=arr.join("");
        }
        //返回拼接好的信息
        return url;
    },
    get: function (url,data,fn,ojson){
        this.xhr=new XMLHttpRequest();
        //省略data时,即不发送数据
        if(typeof data =="function"){
            ojson=fn;
            fn=data;
            data={};
        }
        //合并url和data信息
        url=this.addUrl(url,data)
        //是否异步发送
        this.xhr.open("get",url,true);
        this.xhr.send(null);
        //当请求完成之后调用回调函数返回数据
        this.success(fn,ojson);
        //链式编程
        return this;
    },
    post: function (url,data,fn,ojson){
        this.xhr=new XMLHttpRequest();
        //省略data时,即不发送数据
        if(typeof data =="function"){
            ojson=fn;
            fn=data;
            data={};
        }
        //合并data信息
        data=this.addUrl(data);
        //是否异步发送
        this.xhr.open("post",url,true);
        this.xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
        this.xhr.send(data);

        //当请求完成之后调用回调函数返回数据
        this.success(fn,ojson);
        //链式编程
        return this;
    },
    //字符串转换json
    json: function (str){
        return (new Function("return " + str))();
    },
    success: function (fn,ojson){
        //当请求完成之后调用回调函数返回数据
        var self=this;
        this.xhr.onreadystatechange=function (){
            var odata;
            if(self.xhr.readyState == 4){
                if((self.xhr.status>=200 && self.xhr.status<300) || self.xhr.status == 304){
                    odata=self.xhr.responseText;
                    //若为json则转化json格式
                    if(ojson==="json"){
                        odata=self.json(odata);
                    }
                    fn(odata);
                }else{
                    odata="request was unsuccessful: "+self.xhr.status;
                    fn(odata);
                }
            }
        }
    },
    //取消异步请求
    cancel: function (){
        this.xhr.abort();
        return this;
    }
}