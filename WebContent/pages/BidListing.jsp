<%@page import="java.sql.*"%>
<%@ include file="Header.html"%>
<%@ page import="com.tcs.ilp.controller.*"%>
<%@ page import="com.tcs.ilp.util.*"%>
<html>
<head>
<script type="text/javascript">
	function ChangeColor(tableRow, highLight) {
		if (highLight) {
			tableRow.style.backgroundColor = '#c0c0c0';
		} else {
			tableRow.style.backgroundColor = 'white';
		}
	}
	function DoNav(theUrl) {
		document.location.href = theUrl;
	}
</script>
</head>
<body>
	<div id="page-wrapper">
		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">Bid Listing</h1>
			</div>


			<!-- /.col-lg-12 -->
			
		</div>
		<!-- /.row -->
		<div class="row">
			<div class="col-lg-12">
				<div class="panel panel-default">
					<div class="panel-heading" id="panel-heading">
						<%
				Connection connection = ConnectionProvider.getConnection();
				Statement statement = connection.createStatement();
				
							ResultSet rsid = null;
							rsid = statement.executeQuery("select a.id from bid_251 a");
						%>
						<form name="bidList" method='POST' action="BidListingController" onsubmit="return validate()">
							<table style="height: 50px">
								<tbody>
									<tr>
										<td><label>Search Criteria &nbsp&nbsp</label></td>
										<td><select class="form-control" name="criteria"
											id="criteria">

												<option value="selected">---Select---</option>

												<option value="bidId">Bid ID</option>
												<option value="bName">Bid Name</option>
												<option value="cdate">Created Date</option>
												<option value="eDate">Expiry Date</option>
												<option value="status">Status</option>
										</select></td>

										<td><label> &nbsp;&nbsp; Search Value
												&nbsp;&nbsp;</label></td>
										<td><div id="hide_id" style="display: none;">
												<select class="form-control" name="id" id="id">
													<option value="">---Select---</option>
													<%
														if (rsid != null)
															while (rsid.next()) {
													%>
													<option value="<%=rsid.getInt("id")%>"><%=rsid.getInt("id")%></option>
													<%
														}rsid.close();
														statement.close();
														connection.close();
														
													%>


												</select>
											</div></td>

										<%
				Connection connection1 = ConnectionProvider.getConnection();
				Statement statement1 = connection1.createStatement();
											ResultSet rsname = null;
											rsname = statement1.executeQuery("select a.name from bid_251 a");
										%>
										<td><div id="hide_name" style="display: none;">

												<select class="form-control" name="name" id="name">
													<option value="">---Select---</option>
													<%
														if (rsname != null)
															while (rsname.next()) {
													%>
													<option value="<%=rsname.getString("name")%>"><%=rsname.getString("name")%></option>
													<%
														}rsname.close();
														statement1.close();
														connection1.close();
													%>


												</select>
											</div></td>

										<td><div id="hide_cdate" style="display: none;">
												<input type="Date" class="form-control" name="cdate"
													id="cdate" />

											</div></td>

										<td><div id="hide_edate" style="display: none;">
												<input type="Date" class="form-control" name="edate"
													id="edate" />

											</div></td>

										<td><div id="hide_status" style="display: none;">
												<select class="form-control" name="status" id="status">

													<option value="">---Select---</option>

													<option value="1">Work in Progress</option>
													<option value="2">On Hold</option>
													<option value="3">No Go</option>
													<option value="4">Submitted</option>

												</select>


											</div></td>


										<td>&nbsp;&nbsp;&nbsp;&nbsp;<input
											class="btn btn-default" type="submit" value="Find"></td>

									</tr>
								</tbody>
							</table>
						</form>

					</div>
					<!-- /.panel-heading -->
					<div class="panel-body" id="panel-body">
						<div class="dataTable_wrapper">
							<div style="overflow: auto; height: 200px">
								<table class="table table-striped table-bordered table-hover"
									id="dataTables-example">
									<thead>
										<tr>
											<th>Bid ID</th>
											<th>Bid Name</th>
											<th>Created Date</th>
											<th>Expiry Date</th>
											<th>Status</th>
											<th>Operation</th>
										</tr>
									</thead>
									<tbody>

										<%
											Connection connection2 = ConnectionProvider.getConnection();
											Statement statement2= connection2.createStatement();
											ResultSet resultSet2 = null;
											resultSet2 = statement2.executeQuery("select a.id,a.name,a.created_date,a.expiry_date, b.value as status from bid_251 a inner join ref_data_val_251 b on a.status=b.id and b.reference_id = (select id from reference_data_251 where name = 'bid status') order by a.created_date desc ");
											ResultSet resultSet = (ResultSet) request.getAttribute("resultSet");
											if (resultSet != null) {
												while (resultSet.next()) {
										%>

										<tr onmouseover="ChangeColor(this, true);"
											onmouseout="ChangeColor(this, false);"
											onclick="DoNav('http://172.26.52.86:8063/BMS_Final/pages/BidCreation.jsp?id=<%=resultSet.getInt(1)%>')"
											class='odd gradeA'>
											<td><%=resultSet.getInt("id")%></td>
											<td><%=resultSet.getString("name")%></td>
											<td><%=resultSet.getDate("created_date")%></td>
											<td><%=resultSet.getDate("expiry_date")%></td>
											<td><%=resultSet.getString("status")%></td>
											<td><a
												href="BidListingController?id=<%=resultSet.getInt(1)%>">Delete</a></td>
										</tr>

										<%
											}
												resultSet.close();
												statement.close();
												connection.close();
											} else if (resultSet2 != null) {
												while (resultSet2.next()) {
										%>

										<tr onmouseover="ChangeColor(this, true);"
											onmouseout="ChangeColor(this, false);"
											onclick="DoNav('http://172.26.52.86:8063/BMS_Final/pages/BidCreation.jsp?id=<%=resultSet2.getInt(1)%>')"
											class='odd gradeA'>
											<td><%=resultSet2.getInt("id")%></td>
											<td><%=resultSet2.getString("name")%></td>
											<td><%=resultSet2.getDate("created_date")%></td>
											<td><%=resultSet2.getDate("expiry_date")%></td>
											<td><%=resultSet2.getString("status")%></td>
											<td><a onclick="return validate2()" id="hyper" name="hyper"
												href="BidListingController?id=<%=resultSet2.getInt(1)%>">Delete</a></td>
										</tr>


										<%
											}
												resultSet2.close();
												statement2.close();
												connection2.close();} else {
										%>
										<tr class='odd gradeA'>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
										</tr>
										<%
											}
										%>
									</tbody>
								</table>
							</div>
						</div>
						<!-- /.table-responsive -->

					</div>
					<!-- /.panel-body -->
				</div>
				<!-- /.panel -->
			</div>
			<!-- /.col-lg-12 -->
		</div>
		
	</div>
	<!-- /.col-lg-6 -->
	<div class="col-lg-6">
		<div class="panel panel-default">

			<!-- /.panel-heading -->

			<!-- /.table-responsive -->

			<!-- /.panel-heading -->

			<!-- /.table-responsive -->
		</div>
		<!-- /.panel-body -->
	</div>
	<!-- /.panel -->
	</div>
	<!-- /.col-lg-6 -->
	<div class="col-lg-6">

		<!-- /.panel-body -->
	</div>
	<!-- /.panel -->
	</div>
	<!-- /.col-lg-6 -->
	</div>
	<!-- /.row -->

	<!-- /.row -->
	</div>
	<!-- /#page-wrapper -->

	</div>
	<!-- /#wrapper -->

	<!-- jQuery -->
	<script src="../bower_components/jquery/dist/jquery.min.js"></script>

	<!-- Bootstrap Core JavaScript -->
	<script src="../bower_components/bootstrap/dist/js/bootstrap.min.js"></script>

	<!-- Metis Menu Plugin JavaScript -->
	<script src="../bower_components/metisMenu/dist/metisMenu.min.js"></script>

	<!-- DataTables JavaScript -->
	<script
		src="../bower_components/DataTables/media/js/jquery.dataTables.min.js"></script>
	<script
		src="../bower_components/datatables-plugins/integration/bootstrap/3/dataTables.bootstrap.min.js"></script>

	<!-- Custom Theme JavaScript -->
	<script src="../dist/js/sb-admin-2.js"></script>

	<!-- Page-Level Demo Scripts - Tables - Use for reference -->
	<script>
		$(document).ready(function() {
			$('#dataTables-example').DataTable({
				responsive : true
			});
		});
	</script>
	<script>
		$('#criteria').on('change', function() {
			if ($(this).val() === "bidId") {
				$("#hide_id").show();
			} else {
				$("#hide_id").hide();
			}
			if ($(this).val() === "bName") {
				$("#hide_name").show();
			} else {
				$("#hide_name").hide();
			}
			if ($(this).val() === "cdate") {
				$("#hide_cdate").show();
			} else {
				$("#hide_cdate").hide();
			}
			if ($(this).val() === "eDate") {
				$("#hide_edate").show();
			} else {
				$("#hide_edate").hide();
			}
			if ($(this).val() === "status") {
				$("#hide_status").show();
			} else {
				$("#hide_status").hide();
			}
		});
	</script>
<script type="text/javascript">
function validate(){
	if (document.bidList.criteria.selectedIndex == 0) {
		alert("Please select criteria !");
		document.bidList.criteria.focus();
		return false;
	}
	if (document.bidList.criteria.selectedIndex == 1){
		if(document.bidList.id.selectedIndex == 0){
			alert("please insert id");
			document.bidList.id.focus();
			return false;
			}
		
		}
		
	if (document.bidList.criteria.selectedIndex == 2){
			if(document.bidList.name.selectedIndex == 0){
				alert("please insert bid name");
				document.bidList.name.focus();
				return false;
				}	
		}
	if (document.bidList.criteria.selectedIndex == 3){
		if(!Date.parse(document.bidList.criteria.value)){
			alert("please insert  Created Date");
			document.bidList.criteria.focus();
			return false;
			}
	}
		if (document.bidList.criteria.selectedIndex == 4){
			if(!Date.parse(document.bidList.criteria.value)){
				alert("please insert Expiry Date");
				document.bidList.criteria.focus();
				return false;
				}		
		}
		if (document.bidList.criteria.selectedIndex == 5) {
			alert("Please select Status !");
			document.bidList.criteria.focus();
			return false;
		}
	else
		return true;
}
</script>
<script type="text/javascript">
	function validate2(){
		var x=document.getElementById("hyper").value;
		if(x==""){
		alert('Are you sure you want to delete this bid?');
		return false;
		}
		else
			return true;
	}
</script>
</body>

</html>
