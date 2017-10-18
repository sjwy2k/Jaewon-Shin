package SuitcaseShop.manager;

import java.sql.Timestamp;

public class ShopSuitcaseDataBean {

	private int suitcase_id; // 제품명
	private String suitcase_kind; // 제품규격
	private String suitcase_title; // 제품이름
	private int suitcase_price; // 제품가격
	private short suitcase_count; // 제품수량
	private String manufacturer; // 제조사
	private String product_con; // 생산지
	private String product_date; // 제품생산일
	private String suitcase_image; // 제품이미지
	private String suitcase_content; // 제품설명
	private byte discount_rate; // 제품할인율
	private Timestamp reg_date; // 제품등록일

	public int getSuitcase_id() {
		return suitcase_id;
	}

	public void setSuitcase_id(int suitcase_id) {
		this.suitcase_id = suitcase_id;
	}

	public String getSuitcase_kind() {
		return suitcase_kind;
	}

	public void setSuitcase_kind(String suitcase_kind) {
		this.suitcase_kind = suitcase_kind;
	}

	public String getSuitcase_title() {
		return suitcase_title;
	}

	public void setSuitcase_title(String suitcase_title) {
		this.suitcase_title = suitcase_title;
	}

	public int getSuitcase_price() {
		return suitcase_price;
	}

	public void setSuitcase_price(int suitcase_price) {
		this.suitcase_price = suitcase_price;
	}

	public short getSuitcase_count() {
		return suitcase_count;
	}

	public void setSuitcase_count(short suitcase_count) {
		this.suitcase_count = suitcase_count;
	}

	public String getManufacturer() {
		return manufacturer;
	}

	public void setManufacturer(String manufacturer) {
		this.manufacturer = manufacturer;
	}

	public String getProduct_con() {
		return product_con;
	}

	public void setProduct_con(String product_con) {
		this.product_con = product_con;
	}

	public String getProduct_date() {
		return product_date;
	}

	public void setProduct_date(String product_date) {
		this.product_date = product_date;
	}

	public String getSuitcase_image() {
		return suitcase_image;
	}

	public void setSuitcase_image(String suitcase_image) {
		this.suitcase_image = suitcase_image;
	}

	public String getSuitcase_content() {
		return suitcase_content;
	}

	public void setSuitcase_content(String suitcase_content) {
		this.suitcase_content = suitcase_content;
	}

	public byte getDiscount_rate() {
		return discount_rate;
	}

	public void setDiscount_rate(byte discount_rate) {
		this.discount_rate = discount_rate;
	}

	public Timestamp getReg_date() {
		return reg_date;
	}

	public void setReg_date(Timestamp reg_date) {
		this.reg_date = reg_date;
	}

}
