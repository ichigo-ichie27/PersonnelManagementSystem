package com.graduationDesign.utils;

import java.util.ArrayList;
import java.util.List;

public class GetBatchIdUtils {

	public static List<Integer> batchId(String id){
		String[] strId = id.split(",");
		ArrayList<Integer> batchId = new ArrayList<Integer>();
		for (String bid : strId) {
			batchId.add(Integer.parseInt(bid));
		}
		return batchId;
	}
}
