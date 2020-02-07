package level1;
import java.util.Arrays;

class Solution2 {
	 String solution(String s) {
		 String answer = null;
		 char[] arr = s.toCharArray();
		 Arrays.sort(arr);
		 StringBuilder sb = new StringBuilder(new String(arr));
		 answer = sb.reverse().toString();
		 return answer;
    }
}
public class Test2 {
	public static void main(String[] args) {
		System.out.println(new Solution2().solution("Zbcdefg")); //gfedcbZ
	}
}
