# 路由封装说明

## 如何封装


### 封装的思路
```
    大致思路如下
    1. 使用原生的路由进行跳转
    2. 因为flutter原生的路由并没有提供对路由栈的统一管理, 所以需要在路由监听里面进行路由栈的保存
    3. 每监听到路由发生变化, 就需要操作自己保存的路由表
    4. 监听到路由发生变化的同时需要打印出相应的日志

```