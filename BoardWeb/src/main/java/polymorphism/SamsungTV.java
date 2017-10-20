package polymorphism;

public class SamsungTV implements TV{
	
	/*private SonySpeaker speaker;*/
	/*private AppleSpeaker speaker;*/
	Speaker speaker;
	private int price;
	
	/*public void initMethod() {
		System.out.println("init-method 파라미터 통해 객체 초기화 작업 처리!!");
	}
	
	public void destroyMethod() {
		System.out.println("destroy-method 파라미터 통해 객체 삭제 전 처리할 로직 처리!!");
	}*/
	
	// 1. 기본 생성자
	public SamsungTV() {
		System.out.println("===> 'SamsungTV(1)' 객체 생성");
	}
	
	// 2. 오버로딩 생성자   ***두 가지 문제점 해결(생성자 인젝션 방법)
	/*public SamsungTV(SonySpeaker speaker) {
		System.out.println("===> 'SamsungTV(2)' 객체 생성");
		this.speaker = speaker;
	}*/
	/*public SamsungTV(Speaker speaker) {
		System.out.println("===> 'SamsungTV(2)' 객체 생성");
		this.speaker = speaker;
	}*/
	
	// 3. 다중 변수 매핑
	/*public SamsungTV(SonySpeaker speaker, int price) {
		System.out.println("===> 'SamsungTV(3)' 객체 생성");
		this.speaker = speaker;
		this.price = price;
	}*/
	
	/*public SamsungTV(Speaker speaker, int price) {
		System.out.println("===> 'SamsungTV(3)' 객체 생성");
		this.speaker = speaker;
		this.price = price;
	}*/
	
	public void setSpeaker(Speaker speaker) {
		System.out.println("===>setSpeaker() 호출");
		this.speaker = speaker;
	}

	public void setPrice(int price) {
		System.out.println("===>setPrice() 호출");
		this.price = price;
	}

	@Override
	public void powerOn() {
		/*System.out.println("SamsungTV---전원 켠다");*/
		System.out.println("SamsungTV---전원 켠다. (가격 : " + price + ")" );
	}
	
	@Override
	public void powerOff() {
		System.out.println("SamsungTV---전원 끈다");
	}
	
	@Override
	public void volumeUp() {
		/*speaker = new SonySpeaker();*/ // 일괄관리하므로 제거
		/*System.out.println("SamsungTV---소리 올린다");*/
		/*System.out.println("SonySpeaker---소리 올린다");*/
		/*System.out.println("AppleSpeaker---소리 올린다");*/
		speaker.volumeUp();
	}
	
	@Override
	public void volumeDown() {
		/*speaker = new SonySpeaker();*/ // 일괄관리하므로 제거
		/*System.out.println("SamsungTV---소리 내린다");*/
		/*System.out.println("SonySpeaker---소리 내린다");*/
		/*System.out.println("AppleSpeaker---소리 내린다");*/
		speaker.volumeDown();
	}
	
}
