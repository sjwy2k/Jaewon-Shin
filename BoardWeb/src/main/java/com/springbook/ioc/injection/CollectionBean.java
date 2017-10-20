package com.springbook.ioc.injection;

import java.util.Properties;

public class CollectionBean {

	// 1. List<ArrayList> 타입 매핑
	/*
	 * private List<String> addressList;
	 * 
	 * public List<String> getAddressList() { return addressList; }
	 * 
	 * public void setAddressList(List<String> addressList) { this.addressList =
	 * addressList; }
	 */

	// 2. Set 타입 매핑
//
//	private Set<String> addressList;
//
//	// getter
//	public Set<String> getAddressList() {
//		return addressList;
//	}
//
//	// setter
//	public void setAddressList(Set<String> addressList) {
//		this.addressList = addressList;
//	}
	
	// 3. Map 타입 매핑
//	private Map<String, String> addressMap;
//
//	public Map<String, String> getAddressMap() {
//		return addressMap;
//	}
//
//	public void setAddressMap(Map<String, String> addressMap) {
//		this.addressMap = addressMap;
//	}
	
	// 4. Properties 타입 매핑
	
	private Properties addressProp;

	public Properties getAddressProp() {
		return addressProp;
	}

	public void setAddressProp(Properties addressProp) {
		this.addressProp = addressProp;
	}
	
	

}
