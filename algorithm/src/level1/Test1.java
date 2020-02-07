package level1;
// 문자열 내 p와 y의 개수를 비교판단하는 프로그램
class Solution1 {
    boolean solution(String s) {
        boolean answer = true;        
        int cnt1 = 0;
        int cnt2 = 0;
        for (int i = 0; i < s.length(); i++) {
            if (s.charAt(i) == 'p' || s.charAt(i) == 'P') {
                cnt1++;
            } else if (s.charAt(i) == 'y' || s.charAt(i) == 'Y') {
                cnt2++;
            }
        }
 
        if (cnt1 == cnt2) {
            answer = true;
        } else if (cnt1 != cnt2) {
            answer = false;
        }
 
        return answer;
    }
}
public class Test1 {
	public static void main(String[] args) {
		Solution1 s = new Solution1();
		System.out.println(s.solution("pPoooyY")); //true
		System.out.println(s.solution("pyy"));  //faluse
	}
}
