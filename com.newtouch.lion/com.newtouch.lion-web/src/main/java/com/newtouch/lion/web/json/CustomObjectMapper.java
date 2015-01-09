/*
 * Copyright (c)  2015, Newtouch
 * All rights reserved. 
 *
 * $id: CustomObjectMapper.java 9552 2015年1月9日 下午4:39:55 WangLijun$
 */
package com.newtouch.lion.web.json;
 
import java.util.Date;

import com.fasterxml.jackson.annotation.JsonInclude.Include;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.SerializationFeature;
import com.fasterxml.jackson.databind.module.SimpleModule;
import com.newtouch.lion.web.json.date.DateTimeSerializer;

/**
 * <p>
 * Title:解决SpringMVC使用@ResponseBody返回json时，日期格式默认显示为时间戳的问题
 * </p>
 * <p>
 * Description: 解决SpringMVC使用@ResponseBody返回json时，日期格式默认显示为时间戳的问题
 * </p>
 * <p>
 * Copyright: Copyright (c) 2015
 * </p>
 * <p>
 * Company: Newtouch
 * </p>
 * 
 * @author WangLijun
 * @version 1.0
 */

public class CustomObjectMapper extends ObjectMapper {

	/**
	 * 序列化
	 */
	private static final long serialVersionUID = -680693716098834498L;

	public CustomObjectMapper() {
		SimpleModule module = new SimpleModule();		 
		module.addSerializer(Date.class,new DateTimeSerializer());
		//设置null值不参与序列化(字段不被显示)  
	    this.setSerializationInclusion(Include.NON_NULL);
	    //当找不到对应的序列化器时 忽略此字段  
	    this.configure(SerializationFeature.FAIL_ON_EMPTY_BEANS, false);
		this.registerModule(module);

	}
}
