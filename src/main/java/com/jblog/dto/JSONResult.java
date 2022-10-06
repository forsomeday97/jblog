package com.jblog.dto;

import lombok.Data;

@Data
public class JSONResult {
	private String result; // success,fail
	private String message;//if fail, set message
	private Object data;// if success, set Object
	

}
