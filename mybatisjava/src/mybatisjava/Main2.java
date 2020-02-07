package mybatisjava;

import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class Main2 {
	private final static String NS = "student.";
	private static SqlSessionFactory sqlMap;
	static { //static 초기화 블럭
		InputStream input = null;
		try {
			input = Resources.getResourceAsStream("mapper/mybatis-config.xml");
		} catch (IOException e) {
			e.printStackTrace();
		}
		sqlMap = new SqlSessionFactoryBuilder().build(input);
	}
	public static void main(String[] args) {
		SqlSession session = sqlMap.openSession(); //Connection 기능
		//student 테이블의 총 레코드 건수 출력하기
		int cnt = session.selectOne(NS + "count");
		System.out.println("student 테이블의 레코드 건수 :" + cnt);
		//student 테이블의 총 레코드 출력하기
		List<Student> list = session.selectList(NS + "list");
		for(Student s : list) System.out.println(s);
		
		System.out.println("Student 테이블에 레코드 추가하기");
		Student st = new Student();
		st.setStudno(1000);
		st.setName("홍길동");
		st.setGrade(1);
		st.setId("hongkd");
		st.setJumin("123456");
		st.setMajor1(101);
		cnt = session.insert(NS+"insert",st);
		System.out.println("student 레코드 추가:" + cnt);
		Student stu = session.selectOne(NS + "selectno", st.getStudno());
		System.out.println(stu);
		System.out.println("Student 테이블에 레코드 수정하기");
		/*
		 * 1000번 학생의 학년을 2학년으로, 몸무게 80, 키를 175로 지도교수번호를 1001로 수정하기
		 */
		st.setGrade(2);
		st.setWeight(80);
		st.setHeight(175);
		st.setProfno(1001);
		cnt = session.update(NS+"update",st);		
		stu = session.selectOne(NS + "selectno", st.getStudno());
		System.out.println(stu);
		/*
		 * 성이 김씨인 학생의 목록 조회하기
		 */
		System.out.println("성이 김씨인 학생 조회하기");
		list = session.selectList(NS + "select2","김");
		for(Student s : list) System.out.println(s);
		/*
		 * 101번 학과 학생 중 3학년 이상의 학생의 목록 조회하기
		 */
		System.out.println("101번 학과 학생 중 3학년 이상의 학생의 목록 조회하기");
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("major1",101);
		map.put("grade",3);
		list = session.selectList(NS + "select3",map);		
		for(Student s : list) System.out.println(s);
		/* 몸무게가75 이상인 학생의 목록 조회하기 */
		map.clear();
		map.put("col","weight");
		map.put("val",75);
		System.out.println("몸무게가75 이상인 학생의 목록 조회하기");		
		list = session.selectList(NS + "select4",map);
		for(Student s : list) System.out.println(s);
		/* 키가 175 이상인 학생의 목록 조회하기 */
		map.clear();
		map.put("col","height");
		map.put("val",175);
		System.out.println("키가 175 이상인 학생의 목록 조회하기");		
		list = session.selectList(NS + "select4",map);
		for(Student s : list) System.out.println(s);
		/* 학년이 2학년 이상인 학생의 목록 조회하기 */
		map.clear();
		map.put("col","grade");
		map.put("val",2);
		System.out.println("학년이 2학년 이상인 학생의 목록 조회하기");		
		list = session.selectList(NS + "select4",map);
		for(Student s : list) System.out.println(s);
		/* 주민번호 기준 여학생 조회 */
		map.clear();
		map.put("col","substr(jumin,7,1)");
		map.put("val",2);
		System.out.println("주민번호 기준 여학생");		
		list = session.selectList(NS + "select4",map);
		for(Student s : list) System.out.println(s);
		
		System.out.println("1000번 학생 삭제하기");
		map.clear();
		map.put("col","studno");
		map.put("val",1000);
		cnt = session.delete(NS + "delete",map);
		stu = session.selectOne(NS + "selectno", st.getStudno());
		System.out.println(stu);
		
		System.out.println("유진성 학생 삭제하기");
		map.clear();
		map.put("col","name");
		map.put("val","유진성");
		cnt = session.delete(NS + "delete",map);
		stu = session.selectOne(NS + "selectno", 971211);
		System.out.println(stu);
	}
}