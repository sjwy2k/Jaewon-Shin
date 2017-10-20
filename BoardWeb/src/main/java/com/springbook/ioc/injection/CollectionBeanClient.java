package com.springbook.ioc.injection;

import java.util.Enumeration;
import java.util.Properties;

import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

public class CollectionBeanClient {
	public static void main(String[] args) {
		
		// applicationContext2.xml 안에서 collectionBean 객체를 찾는다.
		AbstractApplicationContext factory =
				new GenericXmlApplicationContext("applicationContext2.xml");
		
		//getBean() 1. lookup 방식 의존성 주입
		CollectionBean bean = (CollectionBean) factory.getBean("collectionBean");
		
		// 1. List 타입 매핑
//		List<String> addressList = bean.getAddressList();		
		// 확장 for 문
//		for(String address : addressList) {
//			System.out.println(address.toString());
//		}		
		// 기본 for 문
//		for(int i = 0; i < addressList.size(); i++) {
//			System.out.println(addressList.get(i));
//		}
		
		// 2. Set 타입 매핑
//		Set<String> addressSet = bean.getAddressList();
//		Iterator<String> it = addressSet.iterator();
//		while(it.hasNext()) {
//			String address = it.next();
//			System.out.println(address.toString());
//		}
		
		// 3. Map 타입 매핑
//		Map<String, String> addressMap = bean.getAddressMap();
//		Set<String> keySet = addressMap.keySet();
//		Iterator<String> it = keySet.iterator();
//		while(it.hasNext()) {
//			String name = it.next();
//			String address = addressMap.get(name);
//			System.out.println(name + "(" + address + ")");
//		}
		
		
		// 4. Properties 타입 매핑
		Properties addressProp = bean.getAddressProp();
		Enumeration e = addressProp.propertyNames();
		while(e.hasMoreElements()) {
			String name = (String)e.nextElement();
			String address = addressProp.getProperty(name);
			System.out.println(name + "(" + address + ")");
		}
		
		factory.close();
	}
}
