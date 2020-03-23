### spring cloud gateway 简单列子


#### 动态路由（MySQL + Redis实现动态路由）

<span  style="color: #5bdaed; ">
[动态路由实现参考博客](https://blog.csdn.net/qq_42714869/article/details/92794911?depth_1-utm_source=distribute.pc_relevant.none-task&utm_source=distribute.pc_relevant.none-task)
</span>

<br/>

<span  style="color: #AE87FA; ">
[gateway基本概念](https://cloud.tencent.com/developer/article/1403887)
</span> 

<br/>

```

查看路由配置信息  http://localhost:8080/route/routes

手动刷新路由配置信息  http://localhost:8080/route/refresh


"id"|"service_id"|"uri"|"predicates"|"filters"|"order_"|"creator_id"|"create_date"|"update_id"|"update_date"|"remarks"|"del_flag"
"1"|"serviceNode1"|"http://baidu.com"|"/api-baidu/**"|"1"|"0"|""|"2020/3/2 00:05:59"|""|"2020/3/2 00:50:27"|""|"0"
"2"|"serviceNode2"|"https://www.taobao.com/"|"/api-taobao/**"|"1"|"0"|""|"2020/3/2 00:51:30"|""|""|""|"0"


本地效果访问路径：

访问：http://localhost:8080/api-taobao/

访问：http://localhost:8080/api-baidu/

```

<br/>
<br/>


#### Global Filter记录访问日志（实现 GlobalFilter, Ordered）

<br/>

<span  style="color: #5bdaed; ">
[Gateway 代理日志记录 Filter参考博客](https://www.jianshu.com/p/350d26dea23f)
</span>


    新增包：filter包
    
    新增配置类：configuration/GatewayLoggerProfile.java
    
    新增日志输出路径：
                logging:
                  path: /Users/su/Desktop/java/
    

    查询效果可以访问：http://localhost:8080/search/sug?code=utf-8&q=%E5%8D%AB%E8%A1%A3&callback=cb

<span  style="color: #AE87FA; ">
不需要日志记录，将包与配置类，yml配置删除既可
</span>
