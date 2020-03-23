
参考博客：https://blog.csdn.net/qq_42714869/article/details/92794911?depth_1-utm_source=distribute.pc_relevant.none-task&utm_source=distribute.pc_relevant.none-task

概念：https://cloud.tencent.com/developer/article/1403887
https://cloud.tencent.com/developer/article/1384112

```
查看路由配置信息  http://localhost:8080/route/routes
手动刷新路由配置信息  http://localhost:8080/route/refresh


"id"|"service_id"|"uri"|"predicates"|"filters"|"order_"|"creator_id"|"create_date"|"update_id"|"update_date"|"remarks"|"del_flag"
"1"|"serviceNode1"|"http://baidu.com"|"/api-baidu/**"|"1"|"0"|""|"2020/3/2 00:05:59"|""|"2020/3/2 00:50:27"|""|"0"
"2"|"serviceNode2"|"https://www.taobao.com/"|"/api-taobao/**"|"1"|"0"|""|"2020/3/2 00:51:30"|""|""|""|"0"


访问：http://localhost:8080/api-taobao/


访问：http://localhost:8080/api-baidu/

```


Spring Cloud Gateway 代理日志记录 Filter
参考博客：https://www.jianshu.com/p/350d26dea23f

    新增包：filter包
    
    新增配置类：configuration/GatewayLoggerProfile.java
    
    新增日志输出路径：
                logging:
                  path: /Users/su/Desktop/java/
    