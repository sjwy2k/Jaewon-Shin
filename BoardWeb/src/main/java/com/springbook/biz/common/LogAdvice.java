package com.springbook.biz.common;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Service;

@Service // DI 주입
//@Aspect // AOP 설정
public class LogAdvice {
	
	@Pointcut("execution(* com.springbook.com..*Impl.*(..))")
	public void allPointcut() { }
	
	@Before("allPointcut()")
	public void printLog(JoinPoint jp) {
		System.out.println("[공통 로그] 비즈니스 로직 수행 전 동작");
	}

}
