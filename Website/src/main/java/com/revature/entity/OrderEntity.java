package com.revature.entity;

import java.util.Date;

public class OrderEntity {
	private String mobileNumber;
	private String productName;
	private int quantity;
	private double subTotal;
	private String address;
	private String city;
	private String state;
	private String country;
	private Date orderDate;
	private Date expectedDeliveryDate;
	private String paymentMethod;
	private String transactionId;
	private String status;

	public String getMobileNumber() {
		return mobileNumber;
	}

	public void setMobileNumber(String mobileNumber) {
		this.mobileNumber = mobileNumber;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public double getSubTotal() {
		return subTotal;
	}

	public void setSubTotal(double subTotal) {
		this.subTotal = subTotal;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	public Date getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}

	public Date getExpectedDeliveryDate() {
		return expectedDeliveryDate;
	}

	public void setExpectedDeliveryDate(Date expectedDeliveryDate) {
		this.expectedDeliveryDate = expectedDeliveryDate;
	}

	public String getPaymentMethod() {
		return paymentMethod;
	}

	public void setPaymentMethod(String paymentMethod) {
		this.paymentMethod = paymentMethod;
	}

	public String getTransactionId() {
		return transactionId;
	}

	public void setTransactionId(String transactionId) {
		this.transactionId = transactionId;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public OrderEntity(String mobileNumber, String productName, int quantity, double subTotal, String address,
			String city, String state, String country, Date orderDate, Date expectedDeliveryDate, String paymentMethod,
			String transactionId, String status) {
		super();
		this.mobileNumber = mobileNumber;
		this.productName = productName;
		this.quantity = quantity;
		this.subTotal = subTotal;
		this.address = address;
		this.city = city;
		this.state = state;
		this.country = country;
		this.orderDate = orderDate;
		this.expectedDeliveryDate = expectedDeliveryDate;
		this.paymentMethod = paymentMethod;
		this.transactionId = transactionId;
		this.status = status;
	}

	public OrderEntity() {
		super();
	}

	@Override
	public String toString() {
		return "OrderEntity [mobileNumber=" + mobileNumber + ", productName=" + productName + ", quantity=" + quantity
				+ ", subTotal=" + subTotal + ", address=" + address + ", city=" + city + ", state=" + state
				+ ", country=" + country + ", orderDate=" + orderDate + ", expectedDeliveryDate=" + expectedDeliveryDate
				+ ", paymentMethod=" + paymentMethod + ", transactionId=" + transactionId + ", status=" + status + "]";
	}

}