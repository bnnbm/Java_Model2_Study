package level1;
/*
 * 문자열 length는 1부터 시작
 * substring은 인덱스기준 0부터 시작
 */
class Solution4 {
	public String solution(String s) {
		String answer = "";
		if (s.length() % 2 == 0)
			answer = s.substring(s.length()/2 -1, s.length()/2 +1); 
		else
			answer = s.substring(s.length()/2,s.length()/2+1); 
		return answer;
	}
}
public class Test4 {
	public static void main(String[] args) {
		Solution4 s = new Solution4();
		System.out.println(s.solution("abced"));
		System.out.println(s.solution("qwer"));
	}
}