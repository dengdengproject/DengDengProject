package project.common.util;

import java.util.UUID;

public class CommonUtilss {
	public static String getRandomString() {
		return UUID.randomUUID().toString().replaceAll("-", "");
	}

}