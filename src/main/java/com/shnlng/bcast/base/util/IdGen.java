package com.shnlng.bcast.base.util;

import java.util.UUID;

public class IdGen {
	public static String id32(){
		return UUID.randomUUID().toString().replace("-", "");
	}
	
	public static void main(String[] args) {
		for(int i = 0; i < 100; i++){
			System.out.println(IdGen.id32());
		}
	}
}
