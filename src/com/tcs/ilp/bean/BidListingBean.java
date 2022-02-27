package com.tcs.ilp.bean;

import java.util.Date;

public class BidListingBean {
	private int bidId;
	private String bidName;
	private Date createdDate;
	private Date expiryDate;
	private int status;
	private String criteria;
	private String value;
	
	public String getCriteria() {
		return criteria;
	}
	public void setCriteria(String criteria) {
		this.criteria = criteria;
	}
	public String getValue() {
		return value;
	}
	public void setValue(String value) {
		this.value = value;
	}
	public BidListingBean() {
		super();
	}
	public int getBidId() {
		return bidId;
	}
	public void setBidId(int bidId) {
		this.bidId = bidId;
	}
	public String getBidName() {
		return bidName;
	}
	public void setBidName(String bidName) {
		this.bidName = bidName;
	}
	public Date getCreatedDate() {
		return createdDate;
	}
	public void setCreatedDate(Date createdDate) {
		this.createdDate = createdDate;
	}
	public Date getExpiryDate() {
		return expiryDate;
	}
	public void setExpiryDate(Date expiryDate) {
		this.expiryDate = expiryDate;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public BidListingBean(int bidId, String bidName, Date createdDate,
			Date expiryDate, int status) {
		super();
		this.bidId = bidId;
		this.bidName = bidName;
		this.createdDate = createdDate;
		this.expiryDate = expiryDate;
		this.status = status;
	}
	@Override
	public String toString() {
		return "BidListing [bidId=" + bidId + ", bidName=" + bidName
				+ ", createdDate=" + createdDate + ", expiryDate=" + expiryDate
				+ ", status=" + status + "]";
	}
	
	
}
