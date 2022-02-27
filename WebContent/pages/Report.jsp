<%@ include file="Header.html"%>
<%@page import="java.sql.*"%>
<%@ page import="com.tcs.ilp.util.*"%>
<html lang="en">

<head>
<script type="text/javascript">
function validate(){
	if (document.createReport.reportTypes.selectedIndex == 0) {
		alert("Please select your report types !");
		document.createReport.reportTypes.focus();
		return false;
	}
	if (document.createReport.reportTypes.selectedIndex == 1){
		if(!Date.parse(document.createReport.from.value)){
			alert("please insert  date");
			document.createReport.from.focus();
			return false;
			}
		if(!Date.parse(document.createReport.to.value)){
			alert(" please Insert Date");
			//document.getElementById("tdate");
			document.createReport.to.focus();
			return false;
			}
		}
		
		if (document.createReport.reportTypes.selectedIndex == 2){
			if(document.createReport.hidden_bidName.selectedIndex == 0){
				alert("please insert bid name");
				document.createReport.hidden_bidName.focus();
				return false;
				}	
		}
	else
		return true;
}
</script>
</head>

<body>
<div id="page-wrapper">
<div class="row">
<div class="col-lg-12">
<h1 class="page-header">Create Report</h1>
</div>


<!-- /.col-lg-12 --></div>
<!-- /.row -->
<div class="row">
<div class="col-lg-12">
<div class="panel panel-default">
<!-- /.panel-heading -->
<div class="panel-body">
<div class="dataTable_wrapper">

</div>
<!-- /.table-responsive --></div>
<!-- /.panel-body -->
<%
Connection connection=ConnectionProvider.getConnection();
Statement statement=connection.createStatement();
ResultSet resultSet=null;
resultSet=statement.executeQuery("select a.name from bid_251 a");%>
<div class="panel-body">
<form name="createReport" method="post" action="CreateController" onsubmit="return validate()">
<table height="150px" align="center">
	<tbody>
		<tr>
			<td>Report Type<font color="red">*</font>&nbsp;&nbsp;&nbsp;</td>
			<td>
			
			<select id="reportTypes" name="reportTypes" class="form-control">
				<option value="Selected">----Select Type----</option>
				<option value="bidListing">Bid Listing</option>
				<option value="bidDetails">Bid Details</option>
				
			</select></td>
			
		</tr>
		
		<tr><td></td>
			<td><div id="hide_listCriteria" style="display:none;">
				From<input type="Date" class="form-control" name="from" id="fdate" />				
				To<input type="Date" class="form-control" name="to" id="tdate" />
				</div>
			</td>
		
		</tr>
		<tr> <td></td>
		<td><div id="hide_bidDetails" style="display:none;">
									<select class="form-control" name="hidden_bidName">
									<option value="selected">---Select---</option>
											<%
											if(resultSet!=null)
											while(resultSet.next()){%>
												<option value="<%=resultSet.getString("name")%>"><%=resultSet.getString("name")%></option>
											<%}%>
												
												
										</select>
			
			</div>
			</td>
			
		</tr>
		

		<tr></tr>
		<tr>
			<td></td>
			<td>
			<input type="submit" class="btn btn-default"  value="Generate"/>
						</td>
		</tr>
	</tbody>
</table>
</form>
</div>
</div>

<div class="col-lg-6"></div>


<div class="col-lg-6"><!-- /.panel-body --></div>

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
		$('#dataTables-example').DataTable( {
			responsive : true
		});
	});
</script>


<script>
$('#reportTypes').on('change',function(){
    if( $(this).val()==="bidListing"){
    $("#hide_listCriteria").show();
    }
    else{
    $("#hide_listCriteria").hide();
    }
    if( $(this).val()==="bidDetails"){
        $("#hide_bidDetails").show();
        }
        else{
        $("#hide_bidDetails").hide();
        }
});

</script>

</body>

</html>
