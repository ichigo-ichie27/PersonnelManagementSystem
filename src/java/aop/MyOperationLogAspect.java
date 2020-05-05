package com.graduationDesign.aop;

import java.lang.reflect.Method;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.aspectj.lang.reflect.MethodSignature;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.graduationDesign.entity.OperationLog;
import com.graduationDesign.service.OperationLogService;
import com.graduationDesign.utils.GetUserIpUtils;

/**
 * 
 * @author ASUS 系统操作日志：切面处理类
 *
 */
@Aspect
@Component
public class MyOperationLogAspect {

	@Autowired
	private OperationLogService service;

	// 定义切点
	//在放了自定义注解的位置切入代码
	@Pointcut("@annotation(com.graduationDesign.aop.MyOperationLog)")
	public void operationLogPointcut() {
	}

	// 切面 配置通知
	@AfterReturning("operationLogPointcut()")
	public void addSystemOperationLog(JoinPoint jp) {
		try {
			// 系统操作日志
			OperationLog ol = new OperationLog();
			// 获取方法签名
			MethodSignature ms = (MethodSignature) jp.getSignature();
			// 获取方法
			Method method = ms.getMethod();
			// 获取方法上的切点
			MyOperationLog myLog = method.getAnnotation(MyOperationLog.class);
			// 获取操作内容的属性值
			if (myLog != null) {
				String oc = myLog.operationContent();
				ol.setOperationContent(oc);
			}
			// 获取操作人用户名
			HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes())
					.getRequest();
			String userName = request.getSession().getAttribute("userName").toString();
			ol.setOperator(userName);
			// 获取操作人ip
			String ipAddr = GetUserIpUtils.getIpAddr(request);
			ol.setOperatorIp(ipAddr);
			// 获取操作时间
			Date date = new Date();
			ol.setOperationTime(date);
			// 获取操作的当前时间用于查询
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			String currentTime = sdf.format(date);
			ol.setOperationCurrentTime(currentTime);
			// 将日志插入数据库
			service.insertOperationLog(ol);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
