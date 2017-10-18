package SuitcaseShop.buy;

import java.sql.Timestamp;

public class BuyDataBean {
	private long buy_id;
	private String buyer;
	private int suitcase_id;
	private String suitcase_title;
	private int buy_price;
	private byte buy_count;
	private String suitcase_image;
	private Timestamp buy_date;
	private String account;
	private String deliveryName;
	private String deliveryTel;
	private String deliveryAddress;
	private String sanction;

	public long getBuy_id() {
		return buy_id;
	}

	public void setBuy_id(long buy_id) {
		this.buy_id = buy_id;
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

	public Timestamp getBuy_date() {
		return buy_date;
	}

	public void setBuy_date(Timestamp buy_date) {
		this.buy_date = buy_date;
	}

	public String getAccount() {
		return account;
	}

	public void setAccount(String account) {
		this.account = account;
	}

	public String getDeliveryName() {
		return deliveryName;
	}

	public void setDeliveryName(String deliveryName) {
		this.deliveryName = deliveryName;
	}

	public String getDeliveryTel() {
		return deliveryTel;
	}

	public void setDeliveryTel(String deliveryTel) {
		this.deliveryTel = deliveryTel;
	}

	public String getDeliveryAddress() {
		return deliveryAddress;
	}

	public void setDeliveryAddress(String deliveryAddress) {
		this.deliveryAddress = deliveryAddress;
	}

	public String getSanction() {
		return sanction;
	}

	public void setSanction(String sanction) {
		this.sanction = sanction;
	}

}
