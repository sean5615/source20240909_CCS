<%/*
----------------------------------------------------------------------------------
File Name		: ccs110m_01v1
Author			: poto
Description		: �Ļ{��ض}�� - ��ܭ���
Modification Log	:

Vers		Date       	By            	Notes
--------------	--------------	--------------	----------------------------------
0.0.1		099/01/07	poto    	Code Generate Create
----------------------------------------------------------------------------------
*/%>
<%@ page contentType="text/html; charset=UTF-8" errorPage="/utility/errorpage.jsp" pageEncoding="MS950"%>
<%@ include file="/utility/header.jsp"%>
<%
	/** �Ǯ����O */	
	String	ASYS = (String)session.getAttribute("ASYS");
	if("1".equals(ASYS)){
		session.setAttribute("CCS110M_1_01_SELECT", "NOU#SELECT CODE AS SELECT_VALUE, CODE_NAME AS SELECT_TEXT FROM SYST001 WHERE KIND='[KIND]' AND CODE IN ('5','6','7','8','10','11') ORDER BY TO_NUMBER(SELECT_VALUE), SELECT_TEXT ");
	}else if("2".equals(ASYS)){
		session.setAttribute("CCS110M_1_01_SELECT", "NOU#SELECT CODE AS SELECT_VALUE, CODE_NAME AS SELECT_TEXT FROM SYST001 WHERE KIND='[KIND]' AND CODE IN ('6','7','8','10','11') ORDER BY TO_NUMBER(SELECT_VALUE), SELECT_TEXT ");
	}
%>
<html>
<head>
	<%@ include file="/utility/viewpageinit.jsp"%>
	<script src="<%=vr%>script/framework/query1_1_0_2.jsp"></script>
	<script src="ccs110m_01c1.jsp"></script>
	<noscript>
		<p>�z���s�������䴩JavaScript�y�k�A���O�ä��v�T�z��������������e</p>
	</noscript>
</head>
<body background="<%=vr%>images/ap_index_bg.jpg" alt="�I����" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">

<!-- �w�q�d�ߪ� Form �_�l -->
<form name="QUERY" method="post" onsubmit="doQuery();" style="margin:0,0,5,0;">
	<input type=hidden name="control_type">
	<input type=hidden name="pageSize">
	<input type=hidden name="pageNo">
	<input type=hidden name="EXPORT_FILE_NAME">
	<input type=hidden name="EXPORT_COLUMN_FILTER">
	<input type=hidden name="IDNO">
	<input type=hidden name="APP_SEQ">
	<input type=hidden name="HEDU_TYPE">
	<input type=hidden name="NOW_AYEAR">
	<input type=hidden name="NOW_SMS">	

	<!-- �d�ߥ��e���_�l -->
	<TABLE id="QUERY_DIV" width="96%" border="0" align="center" cellpadding="0" cellspacing="0" summary="�ƪ��Ϊ��">
		<tr>
			<td width="13"><img src="<%=vr%>images/ap_search_01.jpg" alt="�ƪ��ιϥ�" width="13" height="12"></td>
			<td width="100%"><img src="<%=vr%>images/ap_search_02.jpg" alt="�ƪ��ιϥ�" width="100%" height="12"></td>
			<td width="13"><img src="<%=vr%>images/ap_search_03.jpg" alt="�ƪ��ιϥ�" width="13" height="12"></td>
		</tr>
		<tr>
			<td width="13" background="<%=vr%>images/ap_search_04.jpg" alt="�ƪ��ιϥ�">&nbsp;</td>
			<td width="100%" valign="top" bgcolor="#C5E2C3">
				<!-- ���s�e���_�l -->
				<table width="100%" border="0" align="center" cellpadding="2" cellspacing="0" summary="�ƪ��Ϊ��">
					<tr class="mtbGreenBg">
						<td align=left>�i�d�ߵe���j</td>
						<td align=right>
							<div id="serach_btn">
								<input type=button class="btn" value='�M  ��' onkeypress="doReset();"onclick="doReset();">
								<input type=submit class="btn" value='�d  ��' name='QUERY_BTN'>
							</div>
						</td>
					</tr>
				</table>
				<!-- ���s�e������ -->

				<!-- �d�ߵe���_�l -->
				<table id="table1" width="100%" border="0" align="center" cellpadding="2" cellspacing="1" summary="�ƪ��Ϊ��">
					<tr>						
						<td align=right>�Ǹ��G</td>
						<td align=left>
						    <input type=text name='STNO' value ="">					
						</td>			
						<td align='right' class='tdgl1'>�Ļ{�ҵ{���o�ӷ�<font color=red>��</font>�G</td>
						<td colspan='3'>
							<select name="SCHOOL_TYPE" onchange="iniGrid();" >		
								<option value=''>�п��</option>						
								<script>Form.getSelectFromPhrase("CCS110M_1_01_SELECT", "KIND", "HEDU_TYPE");</script>
							</select>
						</td>
					</tr>		
				</table>
				<!-- �d�ߵe������ -->
			</td>
			<td width="13" background="<%=vr%>images/ap_search_06.jpg" alt="�ƪ��ιϥ�">&nbsp;</td>
		</tr>
		<tr>
			<td width="13"><img src="<%=vr%>images/ap_search_07.jpg" alt="�ƪ��ιϥ�" width="13" height="13"></td>
			<td width="100%"><img src="<%=vr%>images/ap_search_08.jpg" alt="�ƪ��ιϥ�" width="100%" height="13"></td>
			<td width="13"><img src="<%=vr%>images/ap_search_09.jpg" alt="�ƪ��ιϥ�" width="13" height="13"></td>
		</tr>
	</table>
	<!-- �d�ߥ��e������ -->
</form>
<!-- �w�q�d�ߪ� Form ���� -->

<!-- ���D�e���_�l -->
<table width="96%" border="0" align="center" cellpadding="4" cellspacing="0" summary="�ƪ��Ϊ��">
	<tr>
		<td>
			<table width="500" height="27" border="0" cellpadding="0" cellspacing="0">
				<tr>
					<td background="<%=vr%>images/ap_index_title.jpg" alt="�ƪ��ιϥ�">
						�@�@<span class="title">CCS110M_�Ļ{���</span>
					</td>
				</tr>
			</table>
		</td>
	</tr>
</table>
<!-- ���D�e������ -->

<!-- �w�q�d�ߵ��G�� Form �_�l -->
<form name="RESULT" method="post" style="margin:10,0,0,0;">
	<input type=hidden name="control_type">	
	<input type=hidden keyColumn="Y" name="NOW_AYEAR">
	<input type=hidden keyColumn="Y" name="NOW_SMS">		
	<input type=hidden keyColumn="Y" name="NOW_STNO">
	<input type=hidden keyColumn="Y" name="ASYS">
	<input type=hidden keyColumn="Y" name="AYEAR">
	<input type=hidden keyColumn="Y" name="SMS">	
	<input type=hidden keyColumn="Y" name="STNO">
	<input type=hidden keyColumn="Y" name="APP_SEQ">
	<input type=hidden keyColumn="Y" name="CRSNO">
	<input type=hidden keyColumn="Y" name="CRD">
	<input type=hidden keyColumn="Y" name="CRSNO_UNIV">
	<input type=hidden keyColumn="Y" name="CRD_UNIV">
	<input type=hidden keyColumn="Y" name="HEDU_TYPE">
	<input type=hidden keyColumn="Y" name="SCHOOL_TYPE">
	<input type=hidden keyColumn="Y" name="GRADE_OLD">
	<input type=hidden keyColumn="Y" name="SMS_OLD">
	<input type=hidden keyColumn="Y" name="GRAD_TYPE">
	<input type=hidden keyColumn="Y" name="GRAD_GRADE">
	<!-- �d�ߵ��G�e���_�l -->
	<table width="96%" border="0" align="center" cellpadding="0" cellspacing="0" summary="�ƪ��Ϊ��">
		<tr>
			<td width="13"><img src="<%=vr%>images/ap_index_mtb_01.gif" alt="�ƪ��ιϥ�" width="13" height="14"></td>
			<td width="100%"><img src="<%=vr%>images/ap_index_mtb_02.gif" alt="�ƪ��ιϥ�" width="100%" height="14"></td>
			<td width="13"><img src="<%=vr%>images/ap_index_mtb_03.gif" alt="�ƪ��ιϥ�" width="13" height="14"></td>
		</tr>
		<tr>
			<td width="13" background="<%=vr%>images/ap_index_mtb_04.gif" alt="�ƪ��ιϥ�">&nbsp;</td>
			<td width="100%" bgcolor="#FFFFFF">
				<table width="100%" border="0" cellspacing="0" cellpadding="2" summary="�ƪ��Ϊ��">
					<tr>
						<!-- �d�ߵ��G���s�_�l -->
						<td align=left>
							<input type=button class="btn" value='��    ��' name="SELALL_BTN" onkeypress="Form.setCheckBox(1, 'RESULT');"onclick="Form.setCheckBox(1, 'RESULT');">
							<input type=button class="btn" value='�� �� ��' name="SELNONE_BTN" onkeypress="Form.setCheckBox(0, 'RESULT');"onclick="Form.setCheckBox(0, 'RESULT');">
							<input type=button class="btn" name='SAVE' value='�x  �s' onkeypress="doSave();"onclick="doSave();" style="display:none">
						</td>
						<!-- �d�ߵ��G���s���� -->

						<!-- �����r��_�l -->						
						<td align=right nowrap>
							<div id="page">
								<b>
									<span id="pageStr"></span>
									�i<input type='text' name='_scrollSize' size=2 value='1000' style="text-align:center">
									<input type=button value='��' onkeypress="setPageSize();"onclick="setPageSize();">
									<input type='text' name='_goToPage' size=2 value='1' style="text-align:right">
									/ <span id="totalPage"></span> <input type=button value='��' onkeypress='gotoPage(null)'onclick='gotoPage(null)'>
									<span id="totalRow">0</span> ���j
								</b>
							</div>							
						</td>						
						<!-- �����r�굲�� -->
					</tr>
				</table>
				<!-- <font color=red>���u102�Ǧ~��(�t)�H�᥻�ժŤj�űM���~��A�J�Ǿǥ͡A�L�k�Ŀ蠟��ج�101(�t)�Ǧ~�ץH�e�ҭױo���@�P�ҵ{�]�|���k�ݾǨt�A���Ǵ��Ȥ����z�Ļ{�ӽСC�v</font> -->
				<!-- �d�ߵ��G�\��e���_�l -->
				<div id="grid-scroll" style="overflow:auto;width:100%;height:350;"></div>
				<input type=hidden name='EXPORT_FILE_NAME'>
				<textarea name='EXPORT_CONTENT' cols=80 rows=3 style='display:none'></textarea>
				<textarea name='ALL_CONTENT' cols=80 rows=3 style='display:none'></textarea>
				<!-- �d�ߵ��G�\��e������ -->
			</td>
			<td width="13" background="<%=vr%>images/ap_index_mtb_06.gif" alt="�ƪ��ιϥ�">&nbsp;</td>
		</tr>
		<tr>
			<td width="13"><img src="<%=vr%>images/ap_index_mtb_07.gif" alt="�ƪ��ιϥ�" width="13" height="15"></td>
			<td width="100%"><img src="<%=vr%>images/ap_index_mtb_08.gif" alt="�ƪ��ιϥ�" width="100%" height="15"></td>
			<td width="13"><img src="<%=vr%>images/ap_index_mtb_09.gif" alt="�ƪ��ιϥ�" width="13" height="15"></td>
		</tr>
	</table>
	<!-- �d�ߵ��G�e������ -->
</form>
<!-- �w�q�d�ߵ��G�� Form ���� -->

<script>
	document.write ("<font color=\"white\">" + document.lastModified + "</font>");
	window.attachEvent("onload", page_init);
	window.attachEvent("onload", onloadEvent);
</script>
</body>
</html>