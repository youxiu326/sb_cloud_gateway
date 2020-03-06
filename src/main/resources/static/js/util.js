
Vue.prototype.ajax={

    ajaxGet:function(app,url,success,error){
        if(!error){
            error = function(response){
                //0 - (未初始化)还没有调用send()方法
                //1 - (载入)已调用send()方法，正在发送请求
                //2 - (载入完成)send()方法执行完成，
                //3 - (交互)正在解析响应内容
                //4 - (完成)响应内容解析完成，可以在客户端调用了
                if(response.status!=0){
                    console.log("statu:"+response.status);
                }
            }
        }
        app.$http.get(url).then(success,error);
    },
    ajaxPost:function(app,url,data,success,error,form){
        if(!error){
            error = function(response){
                if(response.status!=0){
                    console.log("statu:"+response.status);
                }
            }
        }
        app.$http.post(url,data,{emulateJSON: form}).then(success,error);
    }
}