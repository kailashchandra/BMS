package com.tcs.ilp.service;

import java.sql.*;

import com.tcs.ilp.bean.BidListingBean;
import com.tcs.ilp.dao.BidListingDao;

public class BidListingService {
	BidListingDao bidListingDao=new BidListingDao();
	public ResultSet bidList(BidListingBean bidListingBean) throws Exception{
		System.out.println("Service");
		
		ResultSet resultSet = bidListingDao.bidList(bidListingBean);
				
		return resultSet;
	}

	public void deleteBid(BidListingBean bidListingBean) throws Exception {
		// TODO Auto-generated method stub
		bidListingDao.deleteBid(bidListingBean);
	}
	
}
