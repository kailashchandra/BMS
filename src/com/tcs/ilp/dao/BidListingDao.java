package com.tcs.ilp.dao;

import java.sql.*;

import com.tcs.ilp.bean.BidListingBean;
import com.tcs.ilp.util.ConnectionProvider;

public class BidListingDao {
	public ResultSet bidList(BidListingBean bidListingBean) throws Exception{
		String criteria = bidListingBean.getCriteria();
		String value = bidListingBean.getValue();
		System.out.println(criteria+" "+value);
		
		Connection connection=ConnectionProvider.getConnection();
		Statement statement=connection.createStatement();
		ResultSet resultSet=null;
		if(criteria.equalsIgnoreCase("bidId")){
			System.out.println("id m m hu");
			 			resultSet=statement.executeQuery("select a.id,a.name,a.created_date,a.expiry_date, b.value as status from bid_251 a inner join ref_data_val_251 b on a.status=b.id and b.reference_id = (select id from reference_data_251 where name = 'bid status') and a.id="+value);
			 			}
		else if(criteria.equalsIgnoreCase("bName")){
			System.out.println("bname me  hu");
			  		resultSet=statement.executeQuery("select a.id,a.name,a.created_date,a.expiry_date, b.value as status from bid_251 a inner join ref_data_val_251 b on a.status=b.id and b.reference_id = (select id from reference_data_251 where name = 'bid status') and a.name='"+value+"'");
							}
		else if(criteria.equalsIgnoreCase("cdate")){
			 resultSet=statement.executeQuery("select a.id,a.name,a.created_date,a.expiry_date, b.value as status from bid_251 a inner join ref_data_val_251 b on a.status=b.id and b.reference_id = (select id from reference_data_251 where name = 'bid status') and  a.created_date =to_date('"+value+"','yyyy-mm-dd') order by a.name");
								}
		else if(criteria.equalsIgnoreCase("eDate")){
				resultSet=statement.executeQuery("select a.id,a.name,a.created_date,a.expiry_date, b.value as status from bid_251 a inner join ref_data_val_251 b on a.status=b.id and b.reference_id = (select id from reference_data_251 where name = 'bid status') and a.expiry_date=to_date('"+value+"','yyyy-mm-dd') order by a.name" );
		}
		else if(criteria.equalsIgnoreCase("status")){
				resultSet=statement.executeQuery("select a.id,a.name,a.created_date,a.expiry_date, b.value as status from bid_251 a inner join ref_data_val_251 b on a.status=b.id and b.reference_id = (select id from reference_data_251 where name = 'bid status') and a.status="+value+" order by a.name");
		}
		else {
				resultSet=statement.executeQuery("select a.id,a.name,a.created_date,a.expiry_date, b.value as status from bid1_251 a inner join ref_data_val_251 b on a.status=b.id and b.reference_id = (select id from reference_data_251 where name = 'bid status') order by a.created_date desc ");//select a.id,a.name,a.created_date,a.expiry_date, b.value as status from bid_251_try a inner join ref_data_val_251 b on a.status=b.id and b.reference_id = (select id from reference_data_251 where name = 'bid status')
		}
		System.out.println(connection);
		return resultSet;
	}

	public void deleteBid(BidListingBean bidListingBean) throws Exception {
		// TODO Auto-generated method stub
		Connection connection=ConnectionProvider.getConnection();
		Statement statement=connection.createStatement();
		int id=bidListingBean.getBidId();
		System.out.println(id);
		statement.executeQuery("delete from BID_251 where id="+id);
		statement.executeQuery("delete from Bid_Values_251 where bid_id="+id);
	}

}
