package com.tcs.ilp.controller;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.jasperreports.engine.JasperCompileManager;
import net.sf.jasperreports.engine.JasperExportManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperReport;

import com.tcs.ilp.util.ConnectionProvider;


public class ReportController extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		JasperPrint jasperPrint=null;
		Connection con = null;
					
			String from=request.getParameter("from");
			
			System.out.println(from);
			//System.out.println(formatter.format(fromDate)+"");
			
			String to=request.getParameter("to");
			System.out.println(to);
			String hidden_bidName=request.getParameter("hidden_bidName");
			System.out.println(hidden_bidName);
			Map parameters = new HashMap();
			if(!from.isEmpty()){
				try {
			    parameters.put("from",from);
			    parameters.put("to",to);
				
			    con=ConnectionProvider.getConnection();
				//Statement statement=connection.createStatement();
				String reportFileName="CreateReport.jrxml";
				ServletContext servletContext = getServletContext();
				String contextPath = servletContext.getRealPath(File.separator);
				String reportPath=contextPath+"/"+reportFileName;
				String targetFileName=reportFileName.replace(".jrxml", ".pdf");
				JasperReport jasperReport = JasperCompileManager.compileReport(reportPath); 
				jasperPrint = JasperFillManager.fillReport(jasperReport, parameters, con);//null
				ServletOutputStream outputstream = response.getOutputStream();
				ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
				JasperExportManager.exportReportToPdfStream(jasperPrint, byteArrayOutputStream);
				response.setContentType("application/pdf");
				outputstream.write(byteArrayOutputStream.toByteArray());
				response.setHeader("Cache-Control", "max-age=0");
				response.setHeader("Content-Disposition", "attachment; filename=" + targetFileName); 
				outputstream.flush();
				outputstream.close(); 
			} catch (Exception e) {
				e.printStackTrace();
			}
			}
			//HttpSession session=request.getSession();  
	        //session.setAttribute("fromDate",fromDate);
			else{
				try {
				    parameters.put("hidden_bidName",hidden_bidName);
				 				System.out.println("else m");
					//<![CDATA[select a.id,a.name,a.created_date,a.expiry_date, b.value as status from bid_251_try a inner join ref_data_val_251 b on a.status=b.id and b.reference_id = 3 and  created_date  between  '$P!{from}'and '$P!{to}']]>
				    con=ConnectionProvider.getConnection();
					//Statement statement=connection.createStatement();
					String reportFileName="CreateReport1.jrxml";
					ServletContext servletContext = getServletContext();
					String contextPath = servletContext.getRealPath(File.separator);
					String reportPath=contextPath+"/"+reportFileName;
					String targetFileName=reportFileName.replace(".jrxml", ".pdf");
					JasperReport jasperReport = JasperCompileManager.compileReport(reportPath); 
					jasperPrint = JasperFillManager.fillReport(jasperReport, parameters, con);//null
					ServletOutputStream outputstream = response.getOutputStream();
					ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
					JasperExportManager.exportReportToPdfStream(jasperPrint, byteArrayOutputStream);
					response.setContentType("application/pdf");
					outputstream.write(byteArrayOutputStream.toByteArray());
					response.setHeader("Cache-Control", "max-age=0");
					response.setHeader("Content-Disposition", "attachment; filename=" + targetFileName); 
					outputstream.flush();
					outputstream.close(); 
				} catch (Exception e) {
					e.printStackTrace();
				}
			}

	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}
}
