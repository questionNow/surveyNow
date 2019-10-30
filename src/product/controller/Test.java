package product.controller;

import java.util.Arrays;

public class Test {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		String str = "06267@서울 강남구 강남대로 238-3@ (도곡동)@1동";
		
		Test(str);
	}
	
	public static void Test(String str) {
		
		String[] arr = new String[4];
		
		String[] split = str.split("@");
		
		for(int i=0; i<split.length; i++) {
			arr[i] = split[i];
		};
		
		System.out.println(Arrays.toString(arr));
	}
}
