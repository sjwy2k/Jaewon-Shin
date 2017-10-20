package polymorphism;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

//@Component("tv")
@Service("tv")
public class LgTV implements TV {
	
	@Autowired // 의존성이 주입된다. setter injection
//	@Qualifier("sony")	
//	@Resource(name="apple")
	private Speaker speaker;
	
//	private int price;	
/////*private AppleSpeaker speaker;*/
	
	/*public void initMethod() {
		System.out.println("init-method 파라미터 통해 객체 초기화 작업 처리!!");
	}
	
	public void destroyMethod() {
		System.out.println("destroy-method 파라미터 통해 객체 삭제 전 처리할 로직 처리!!");
	}*/
	
	// 1. 기본 생성자
	public LgTV() {
		System.out.println("===> 'LgTV(1)' 객체 생성");
	}

		
	// 2. 오버로딩 생성자   ***두 가지 문제점 해결(생성자 인젝션 방법)
	/*public LgTV(SonySpeaker speaker) {
		System.out.println("===> 'LgTV(2)' 객체 생성");
		this.speaker = speaker;
	}*/
//	public LgTV(Speaker speaker) {
//		System.out.println("===> 'LgTV(2)' 객체 생성");
//		this.speaker = speaker;
//	}
	
	// 3. 다중 변수 매핑
	/*public LgTV(SonySpeaker speaker, int price) {
		System.out.println("===> 'LgTV(3)' 객체 생성");
		this.speaker = speaker;
		this.price = price;
	}*/
	
//	public LgTV(Speaker speaker, int price) {
//		System.out.println("===> 'LgTV(3)' 객체 생성");
//		this.speaker = speaker;
//		this.price = price;
//	}
	
	
	@Override
	public void powerOn() {
		System.out.println("LgTV---전원 켠다");
//		System.out.println("LgTV---전원 켠다. (가격 : " + price + ")" );
	}
	
	@Override
	public void powerOff() {
		System.out.println("LgTV---전원 끈다");
	}
	
	@Override
	public void volumeUp() {
		/*speaker = new SonySpeaker();*/ // 일괄관리하므로 제거
//		System.out.println("LgTV---소리 올린다");
		/*System.out.println("SonySpeaker---소리 올린다");*/
		/*System.out.println("AppleSpeaker---소리 올린다");*/
		speaker.volumeUp();
	}
	
	@Override
	public void volumeDown() {
		/*speaker = new SonySpeaker();*/ // 일괄관리하므로 제거
//		System.out.println("LgTV---소리 내린다");
		/*System.out.println("SonySpeaker---소리 내린다");*/
		/*System.out.println("AppleSpeaker---소리 내린다");*/
		speaker.volumeDown();
	}	
}
