<%@ page contentType="text/html;charset=GBK" %>
<%	String appmap = request.getContextPath();
	String printImage = "<img src='" + appmap + "/report/images/print.gif' border=no >";
	String excelImage = "<img src='" + appmap + "/report/images/excel.gif' border=no >";
	String pdfImage = "<img src='" + appmap + "/report/images/pdf.gif' border=no >";
    String wordImage = "<img src='" + appmap + "/report/images/doc.gif' border=no >";
	String firstPageImage = "<img src='" + appmap + "/report/images/firstpage.gif' border=no >";
	String lastPageImage = "<img src='" + appmap + "/report/images/lastpage.gif' border=no >";
	String nextPageImage = "<img src='" + appmap + "/report/images/nextpage.gif' border=no >";
	String prevPageImage = "<img src='" + appmap + "/report/images/prevpage.gif' border=no >";
	String submitImage = "<img src='" + appmap + "/report/images/savedata.gif' border=no >";
%>

<table id=titleTable width=100% cellspacing=0 cellpadding=0 border=0 ><tr>
	<td height="25" width=100% valign="middle"  style="font-size:13px" background="../images/toolbar-bg.gif">
		<table width="100%">
			<tr >
				
				<td width="100%" align="right" valign="middle"   style="font-size:12px; line-height:12px; margin:3px 0 0 0 ;" >&nbsp;
				<span style=" margin:0 10px 0 0 ; padding:5px 0 0 0 ; background: url(../images/toolbar-line.gif) no-repeat right top;">
				<a id="printAppletDiv" style=""></a>
				<a href="#" onClick="report1_print();return false;" title="��ӡԤ��"><%=printImage%></a>
				<a href="#" onClick="report1_saveAsExcel();return false;" title="����Excel"><%=excelImage%></a>
				<a href="#" onClick="report1_saveAsPdf();return false;" title="����PDF"><%=pdfImage%></a>
				<a href="#" onClick="report1_saveAsWord();return false;" title="����Word"><%=wordImage%></a>
				</span>
				<a href="#" onClick="try{report1_toPage( 1 );}catch(e){}return false;"><%=firstPageImage%></a>
				<a href="#" onClick="try{report1_toPage(report1_getCurrPage()-1);}catch(e){}return false;"><%=prevPageImage%></a>
				<a href="#" onClick="try{report1_toPage(report1_getCurrPage()+1);}catch(e){}return false;"><%=nextPageImage%></a>
				<a href="#" onClick="try{report1_toPage(report1_getTotalPage());}catch(e){}return false;"><%=lastPageImage%></a>&nbsp;&nbsp;��<span id="c_page_span"></span>ҳ/��<span id="t_page_span"></span>ҳ		  </td>
			</tr>
	  </table>
	</td>
</table>