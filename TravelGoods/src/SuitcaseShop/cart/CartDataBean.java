package SuitcaseShop.cart;

public class CartDataBean {
	private int cart_id; // 장바구니의 아이디
	private String buyer; // 구매자
	private int suitcase_id; // 구매된 상품의 아이디
	private String suitcase_title; // 구매된 상품 이름
	private int buy_price; // 판매가
	private byte buy_count; // 판매수량
	private String suitcase_image; // 상품 이미지

	public int getCart_id() {
		return cart_id;
	}

	public void setCart_id(int cart_id) {
		this.cart_id = cart_id;
	}

	public String getBuyer() {
		return buyer;
	}

	public void setBuyer(String buyer) {
		this.buyer = buyer;
	}

	public int getSuitcase_id() {
		return suitcase_id;
	}

	public void setSuitcase_id(int suitcase_id) {
		this.suitcase_id = suitcase_id;
	}

	public String getSuitcase_title() {
		return suitcase_title;
	}

	public void setSuitcase_title(String suitcase_title) {
		this.suitcase_title = suitcase_title;
	}

	public int getBuy_price() {
		return buy_price;
	}

	public void setBuy_price(int buy_price) {
		this.buy_price = buy_price;
	}

	public byte getBuy_count() {
		return buy_count;
	}

	public void setBuy_count(byte buy_count) {
		this.buy_count = buy_count;
	}

	public String getSuitcase_image() {
		return suitcase_image;
	}

	public void setSuitcase_image(String suitcase_image) {
		this.suitcase_image = suitcase_image;
	}

}
