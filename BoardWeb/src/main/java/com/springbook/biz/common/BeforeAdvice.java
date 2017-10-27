package com.springbook.biz.common;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Service;

@Service
//@Aspect
public class BeforeAdvice {
	
//	@Pointcut("execution(* com.springbook.biz..*Impl.*(..))")
//	public void allPointcut() { }
	
	@Before("PointcutCommon.allPointcut()")
	public void beforeLog(JoinPoint jp) {		
		
		String method = jp.getSignature().getName(); // 비지니스 메서드 이름 정보 받아둔다
		Object[] args = jp.getArgs(); // 비즈니스 메서드 매개변수 정보 받아둔다
		
		System.out.println("[사전 처리] " + method + 
				"() 메소드 ARGS 정보 : " + args[0].toString());
	}
}
