# 人事管理系统
## 项目描述
### 本项目结构上分为数据访问层、业务逻辑层和表现层，层次间的依赖关系自下到上。采用的技术有spring，springMVC，Mybatis，Thymeleaf等。其中表现层使用springMVC框架开发；业务逻辑层为了增加程序的可扩展和可维护性，每一个业务模块都有自己的接口以及实现类；数据访问层为了将SQL语句从程序代码中彻底分离，降低耦合度，使用了Mybatis持久层框架，并利用spring的IOC容器管理三层结构的对象及其依赖关系。项目中配置了登录拦截器，需要通过登录验证才能访问系统中的资源。使用Thymeleaf实现了基于角色的权限控制，并能实时的修改角色的权限。为了实时监控系统的操作情况，项目中使用了spring的AOP实现了系统操作日志。
## 系统框图
### 系统结构图
![image](https://github.com/ichigo-ichie27/PersonnelManagementSystem/raw/master/images/QQ%E6%88%AA%E5%9B%BE20200421001327.png)
### 系统运行流程图
![image](https://github.com/ichigo-ichie27/PersonnelManagementSystem/raw/master/images/QQ%E6%88%AA%E5%9B%BE20200422105644.png)
### 系统功能结构图
![image](https://github.com/ichigo-ichie27/PersonnelManagementSystem/raw/master/images/QQ截图20200422122002.png)
## 系统实物图
![image](https://github.com/ichigo-ichie27/PersonnelManagementSystem/raw/master/images/QQ%E6%88%AA%E5%9B%BE20200423110606.png)

![image](https://github.com/ichigo-ichie27/PersonnelManagementSystem/raw/master/images/QQ%E6%88%AA%E5%9B%BE20200423130854.png)

![image](https://github.com/ichigo-ichie27/PersonnelManagementSystem/raw/master/images/QQ%E6%88%AA%E5%9B%BE20200423231146.png)

![image](https://github.com/ichigo-ichie27/PersonnelManagementSystem/raw/master/images/QQ%E6%88%AA%E5%9B%BE20200424103244.png)

![image](https://github.com/ichigo-ichie27/PersonnelManagementSystem/raw/master/images/QQ%E6%88%AA%E5%9B%BE20200424124344.png)

![image](https://github.com/ichigo-ichie27/PersonnelManagementSystem/raw/master/images/QQ%E6%88%AA%E5%9B%BE20200424134158.png)

![image](https://github.com/ichigo-ichie27/PersonnelManagementSystem/raw/master/images/QQ%E6%88%AA%E5%9B%BE20200424160219.png)
