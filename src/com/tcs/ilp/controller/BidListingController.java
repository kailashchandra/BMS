package com.tcs.ilp.controller;

import java.io.IOException;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tcs.ilp.bean.BidListingBean;
import com.tcs.ilp.service.BidListingService;


public class BidListingController extends HttpServlet {
	
	private static final long serialVersionUID = 1L;

    public BidListingController() {
        // TODO Auto-generated constructor stub
    	System.out.println("Constructor");
    	
    }

    BidListingBean bidlistingbean=new BidListingBean();
    BidListingService bidListingService=new BidListingService();
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int id=Integer.parseInt(request.getParameter("id"));
		bidlistingbean.setBidId(id);
		try {
			bidListingService.deleteBid(bidlistingbean);
			response.sendRedirect("BidListing.jsp");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		String action=request.getParameter("listing");
//		if(action.equalsIgnoreCase("list")){
		System.out.println("dopost");
		
		String criteria=request.getParameter("criteria");
		
		String id=request.getParameter("id");
		System.out.println(id);
		String name=request.getParameter("name");
		System.out.println(name);
		String cdate=request.getParameter("cdate");
		String edate=request.getParameter("edate");
		String status=request.getParameter("status");
		//System.out.println(name+""+edate+""+cdate+""+status);
		String value="";
		if(id!=""){
			System.out.println("in if");
			value=id;
			System.out.println(id+"  "+value);}
		else if(name!=""){
			System.out.println("in else");
			value=name;
			System.out.println(name+"  "+value);
			}
		else if(cdate!="")
			value=cdate;
		else if(edate!="")
			value=edate;
		else if(status!="")
			value=status;
		System.out.println(criteria+" "+value);
		bidlistingbean.setCriteria(criteria);
		bidlistingbean.setValue(value);
//		}
		try {
			ResultSet resultSet=bidListingService.bidList(bidlistingbean);			
			
			request.setAttribute("resultSet",resultSet);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
			request.getRequestDispatcher("BidListing.jsp").forward(request, response);  
			
		
		
		
	}

}
