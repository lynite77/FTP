<%@ page contentType="text/html; charset=UTF-8" %>
<html>
<head>
<title>My Task</title>
<link href="../CSS/styles.css" rel="stylesheet" type="text/css">
<style>
	body{
	padding: 0px;
	margin: 0px;
	}
	.mem input:focus {
  		outline: none;
	}
	.mem input:hover {
		cursor:pointer;
	}
	.mem input {
		border:none;
	}
	a {text-decoration: none;
		color:black;}
	.mt table{ border: 1px solid #444444;
	}
	.mt td {border: 1px solid #D0D0D0;}
</style>
</head>
<body>
	<div class="container-fluid px-4">
		<div class="card mb-4">
       		<div class="card-header">
          		 <i class="fas fa-table me-1"></i>
          		 DataTable Example
       		</div>
       		<div class="card-body">
          		 <table id="datatablesSimple">
             		 <thead>
                 		  <tr>
		                       <th>Name</th>
		                       <th>Position</th>
		                       <th>Office</th>
		                       <th>Age</th>
		                       <th>Start date</th>
		                       <th>Salary</th>
		                   </tr>
		               </thead>
		               <tfoot>
		                   <tr>
		                       <th>Name</th>
		                       <th>Position</th>
		                       <th>Office</th>
		                       <th>Age</th>
		                       <th>Start date</th>
		                       <th>Salary</th>
		                   </tr>
		               </tfoot>
		               <tbody>
		                   <tr>
		                       <td>Michael Bruce</td>
		                       <td>Javascript Developer</td>
		                       <td>Singapore</td>
		                       <td>29</td>
		                       <td>2011/06/27</td>
		                       <td>$183,000</td>
		                   </tr>
		                   <tr>
		                       <td>Donna Snider</td>
		                       <td>Customer Support</td>
		                       <td>New York</td>
		                       <td>27</td>
		                       <td>2011/01/25</td>
		                       <td>$112,000</td>
		                   </tr>
		               	</tbody>
		           	</table>
       	 	 </div>
   		</div>
 	</div>
<script src="../js/datatables-simple-demo.js"></script>


<%-- <div align="center">
	<br/>
	<h1 style="margin-right:800px;">My Task</h1>
	<br/>
	<table class="mt" align="center" width="1000" cellpadding="3">
		<tr>
			<td align="center" colspan="2">
			<%
				  vlist = qMgr.getBoardList(keyField, keyWord, start, end, before, after);
				  listSize = vlist.size();//브라우저 화면에 보여질 게시물 번호
				  if (vlist.isEmpty()) {
					out.println("등록된 작업이 없습니다.");
				  } else {
			%>
				<form name=saveFrm id="employee" method="post" action="saveProc.jsp">		
				  <table width="100%" cellpadding="2" cellspacing="0">
					<tr align="center" bgcolor="#D0D0D0" height="120%">
						 <td><strong>번호</strong></td>
						 <td><strong>품질코드</strong></td>
					     <td><strong>제품명</strong></td>
					     <td><strong>지시일</strong></td>
					     <td><strong>작업자</strong></td>
					     <td><strong>작업일</strong></td>	
					</tr>
					<%
						  for (int i = 0;i<numPerPage; i++) {
							if (i == listSize) break;
							QualityBean bean = vlist.get(i);
							String Q_CODE = bean.getQUALITY_CODE();
							String P_NAME = bean.getPRODUCT_NAME();
							String O_DATE = bean.getORDER_DATE();
							String M_NAME = bean.getMEMBER_NAME();
					%>
					
					<tr>
						<td align="center">
							<%=totalRecord-((nowPage-1)*numPerPage)-i%>
						</td>
						<td align="center" >
							<span align="center"><%=Q_CODE%></span>
						</td>
						<td align="center"><%=P_NAME%></td>
						<td align="center"><%=O_DATE%></td>
						<td align="center"><%=keyWord%></td>
<% 
								if(bean.getQUALITY_DATE()==null){%>
									<td></td>
<%}								else{%>
									<td align="center"><%=bean.getQUALITY_DATE()%></td>
<%}%>
					</tr>
					
					<%}//for%>
				</table>
				</form> <%
 			}//if
 		%>
			</td>
		</tr>
		<table width="1000">
		<br>
		<hr width="1000"/>
		<br>
			<tr>
				<td align="left">
			<!-- 페이징 및 블럭 처리 Start--> 
			<%
   				  int pageStart = (nowBlock - 1) * pagePerBlock + 1 ; // 하단 페이지 시작번호
   				  int pageEnd = ((pageStart + pagePerBlock ) <= totalPage) ?  (pageStart + pagePerBlock): totalPage + 1; 
   				  // 하단 페이지 끝번호
   				  if(totalPage != 0) {
    			  	if (nowBlock > 1) {%>
    			  		<a href="javascript:block('<%=nowBlock-1%>')">[prev]</a><%}%>&nbsp; 
    			  		<%for ( ; pageStart < pageEnd; pageStart++){%>
     			     	<a href="javascript:pageing('<%=pageStart %>')"> 
     					<%if(pageStart==nowPage) {%><font color="blue"> <%}%>
     					[<%=pageStart%>]
     					<%if(pageStart==nowPage) {%></font> <%}%></a> 
    					<%}//for%>&nbsp;
    					<%if (totalBlock > nowBlock ) {%>
    					<a href="javascript:block('<%=nowBlock+1%>')">[next]</a>
    				<%}%>&nbsp; 
    			  <%}%> 
 				<!-- 페이징 및 블럭 처리 End-->
				</td>
				<td align="right">총 <%=totalRecord%> 개(<font color="red">
				<%=nowPage%>/<%=totalPage%> Pages</font>)</td>
			</tr>
		</table>
	</table>
	
	<form name="listFrm" method="post">
		<input type="hidden" name="reload" value="true"> 
		<input type="hidden" name="nowPage" value="1">
	</form>
	<form name="readFrm" method="get"> 
		<input type="hidden" name="nowPage" value="<%=nowPage%>"> 
		<input type="hidden" name="keyField" value="<%=keyField%>"> 
		<input type="hidden" name="keyWord" value="<%=keyWord%>">
	</form>
</div>  --%>
</body>
</html>