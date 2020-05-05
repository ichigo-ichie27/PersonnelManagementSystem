package com.graduationDesign.aop;

import java.lang.annotation.Documented;
import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

/**
 * 
 * @author ASUS
 * 自定义注解
 *
 */
@Target(ElementType.METHOD) //注解放置的目标位置,METHOD是可将注解放在方法级别上
@Retention(RetentionPolicy.RUNTIME)//注解在哪个阶段执行
@Documented //生成文档
public @interface MyOperationLog {
	//操作内容
	public String operationContent() default "";
}
