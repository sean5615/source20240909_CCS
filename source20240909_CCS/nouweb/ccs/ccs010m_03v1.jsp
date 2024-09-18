<%/*
----------------------------------------------------------------------------------
File Name		: ccs010m_03v1
Author			: jeff
Description		: �ӽбĻ{-�s�W�s�� - ��ܭ���
Modification Log	:

Vers		Date       	By            	Notes
----------	----------	--------------	------------------------------------------
1.0.0       097/09/12	poto		    �Ǯ����O�[�J �Ťj�տ�
										FACULTY_CODE ='ZZ'  '�Ťj�տ�'
										SUBSTR(CRSNO,3,1) ='8' '���s'
0.0.2		097/03/21	lin				�N�u�Ǹ��v�r�˧אּ�u�ӽЧǸ��v
0.0.1		096/06/06	jeff			Code Generate Create
----------------------------------------------------------------------------------
*/%>
<%@ page contentType="text/html; charset=UTF-8" errorPage="/utility/errorpage.jsp" pageEncoding="MS950"%>
<%@ include file="/utility/header.jsp"%>
<%
	String	ID_TYPE		=	(String)session.getAttribute("ID_TYPE");

	String 	LINK		=	"";

	if (ID_TYPE.equals("1"))
	{
		LINK = "/stu/stu003m_.jsp";
	}
	else
	{
		LINK = "/stu/stu002m_.jsp";
	}
	
	String	ASYS	=	com.acer.util.Utility.checkNull(request.getParameter("ASYS"), "");
	String	AYEAR	=	com.acer.util.Utility.checkNull(request.getParameter("AYEAR"), "");
	String	SMS		=	com.acer.util.Utility.checkNull(request.getParameter("SMS"), "");
	String	STNO	=	com.acer.util.Utility.checkNull(request.getParameter("STNO"), "");
	String	APP_SEQ	=	com.acer.util.Utility.checkNull(request.getParameter("APP_SEQ"), "");
	String	HEDU_TYPE	=	com.acer.util.Utility.checkNull(request.getParameter("HEDU_TYPE"), "");
	String	IS_CONFIRM	=	com.acer.util.Utility.checkNull(request.getParameter("IS_CONFIRM"), "");

	String 	keyValue	=	"STNO|" + STNO + "|APP_SEQ|" + APP_SEQ + "|stno|" + STNO;
	
	 /** ��ئW�١A��إN�X03 */	
	session.setAttribute("CCS010M_1_02_BLUR", "NOU#SELECT c.CRSNO, c.CRS_NAME, c.CRD FROM  COUT002 c WHERE c.CRSNO='[CRSNO]' ");	
	session.setAttribute("CCS010M_1_02_WINDOW", "NOU#SELECT c.CRSNO, c.CRS_NAME, c.CRD FROM  COUT002 c WHERE 1=1 ");			
	 /** ���խ��Ū��ض}�� */
	session.setAttribute("CCS010M_1_03_BLUR_1", "NOU#SELECT '' as CRSNO, '' as CRS_NAME, '' as CRD  FROM DUAL WHERE 1 = 2 ");
	session.setAttribute("CCS010M_1_03_BLUR_2", "NOU#SELECT CRSNO, CRS_NAME, CRD FROM COUT002 WHERE CRSNO='[CRSNO]' ");
	session.setAttribute("CCS010M_1_03_WINDOW", "NOU#select crsno, crs_name, crd from cout002 where crs_name = [CRS_NAME]");		 
	
	/** �Ǯ����O  -20240909��אּ�̰��Ǿ����� */	
	if("1".equals(ASYS)){
		//session.setAttribute("CCS010M_1_01_SELECT", "NOU#SELECT CODE AS SELECT_VALUE, CODE_NAME AS SELECT_TEXT FROM SYST001 WHERE KIND='[KIND]' AND CODE IN ('5','6','7','8') ORDER BY SELECT_VALUE, SELECT_TEXT ");
		session.setAttribute("CCS010M_1_01_SELECT", "NOU#SELECT CODE AS SELECT_VALUE, CODE_NAME AS SELECT_TEXT FROM SYST001 WHERE KIND='[KIND]' AND CODE IN ('1','2','3','4') ORDER BY SELECT_VALUE, SELECT_TEXT ");
	}else if("2".equals(ASYS)){
		session.setAttribute("CCS010M_1_01_SELECT", "NOU#SELECT CODE AS SELECT_VALUE, CODE_NAME AS SELECT_TEXT FROM SYST001 WHERE KIND='[KIND]' AND CODE IN ('1','2','3','4')  ORDER BY SELECT_VALUE, SELECT_TEXT ");
	}
	/** �̰��Ǿ� */		
	session.setAttribute("CCS010M_1_04_SELECT", "NOU#SELECT CODE AS SELECT_VALUE, CODE_NAME AS SELECT_TEXT FROM SYST001 WHERE KIND='[KIND]' AND CODE IN ('" + HEDU_TYPE + "') ORDER BY SELECT_VALUE, SELECT_TEXT ");	
	

	
	String CONTENT = "";
	String MESSAGE_CONTENT = "";
	java.util.Vector dataVt = com.acer.util.DBUtil.getSQLData("ccst003_.jsp", "NOU", "SELECT * FROM CCST015 WHERE CCS_TYPE ='2' ");
	com.acer.db.VtResultSet rs = new com.acer.db.VtResultSet(dataVt);
	if(rs.next()) {
		CONTENT = rs.getString("CONTENT");
		MESSAGE_CONTENT = rs.getString("MESSAGE_CONTENT");
	}
%>
<html>
<head>
	<%@ include file="/utility/viewpageinit.jsp"%>
	<script src="<%=vr%>script/framework/query1_2_0_2.jsp"></script>
	<script src="ccs010m_03c1.jsp"></script>
	<noscript>
		<p>�z���s�������䴩JavaScript�y�k�A���O�ä��v�T�z��������������e</p>
	</noscript>
</head>
<style type="text/css">
input.btn1{
	font-size: 10pt;
	font-weight :bold;
	color:#2F83CF;
	background-color:#fed;
	border:1px solid;
	border-top-color:#D18226;
	border-left-color:#D18226;
	border-right-color:#A2641B;
	border-bottom-color:#A2641B;
   filter:progid:DXImageTransform.Microsoft.Gradient
      (GradientType=0,StartColorStr='#FCF4CF',EndColorStr='#F8D562');		vertical-align: middle;
	height: 20px;	line-height: 15pt;
}
</style>
<body background="<%=vr%>images/ap_index_bg.jpg" alt="�I����" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">

<!-- �w�q�d�ߪ� Form �_�l -->
<form name="QUERY" method="post" onsubmit="doQuery();" style="margin:0,0,5,0;">
	<input type=hidden name="control_type">
	<input type=hidden name="pageSize">
	<input type=hidden name="pageNo">
	<input type=hidden name="EXPORT_FILE_NAME">
	<input type=hidden name="EXPORT_COLUMN_FILTER">
	<input type=hidden name="CENTER_CODE">
	<input type=hidden name="AYEAR">
	<input type=hidden name="SMS">
	<input type=hidden name="MESSAGE_CONTENT" value="<%=MESSAGE_CONTENT%>">	
	<input type=hidden name="IS_CONFIRM" value="<%=IS_CONFIRM%>">

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
								<input type=button class="btn" value='��' name="hidden" onkeypress="doHiddenEdit();" onclick="doHiddenEdit();">
								<input type=button class="btn" value='��' name="show" onkeypress="doShowEdit();" onclick="doShowEdit();" style='display:none'>							
								<!--<input type=button class="btn" value='�^�d�߭�' onkeypress='doBack();top.mainFrame.iniGrid();'onclick='doBack();top.mainFrame.iniGrid();'>-->
								<input type=button class="btn" value='�^�d�߭�' onkeypress='doBack();'onclick='doBack();'>
								<input type=button class="btn" value='�ק�ǥͰ򥻸��' name='STU_BTN' onkeypress="doOpen('<%=keyValue%>',1280,1024,'<%=LINK%>');"onclick="doOpen('<%=keyValue%>',1280,1024,'<%=LINK%>');">
							</div>
						</td>
					</tr>
				</table>
				<!-- ���s�e������ -->

				<span id='QUERY_TABLE_SPAN'>
				<!-- �d�ߵe���_�l -->
				<table id="table1" width="100%" border="0" align="center" cellpadding="2" cellspacing="1" summary="�ƪ��Ϊ��">
					<tr>
						<td align='right'>���ߧO�G</td>
						<td><input type=text name='CENTER_NAME'></td>	
						<td align='right'>�ӽЧǸ��G</td>
						<td colspan><input type=text name='APP_SEQ'></td>	
						<td align='right'>�̰��Ǿ��G</td>
						<td colspan>
							<select name="HEDU_TYPE">								
								<script>Form.getSelectFromPhrase("CCS010M_1_04_SELECT", "KIND", "HEDU_TYPE");</script>
							</select>
						</td>						
					</tr>
					<tr>
						<td align='right'>�Ǹ��G</td>
						<td><input type=text name='STNO'></td>	
						<td align='right'>�m�W�G</td>
						<td><input type=text name='NAME'></td>
						<td align='right'>�����Ҧr���G</td>
						<td><input type=text name='IDNO'></td>						
					</tr>
					<tr>
						<td align='right'>�p���q�ܡG</td>
						<td><input type=text name='TEL'></td>	
						<td align='right'>�q�T�a�}�G</td>
						<td colspan=3>
							<input type=text name='CRRSADDR_ZIP'>
							<input type=text name='CRRSADDR'>
						</td>							
					</tr>
				</table>
				<!-- �d�ߵe������ -->
				</span>
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
<!--
<table width="96%" border="0" align="center" cellpadding="4" cellspacing="0" summary="�ƪ��Ϊ��">
	<tr>
		<td>
			<table width="500" height="27" border="0" cellpadding="0" cellspacing="0">
				<tr>
					<td background="<%=vr%>images/ap_index_title.jpg" alt="�ƪ��ιϥ�">
						�@�@<span class="title">�ӽбĻ{-�s�W�s��</span>
					</td>
				</tr>
			</table>
		</td>
	</tr>
</table>
-->
<!-- ���D�e������ -->

<span id='EDIT_SPAN'>
<!-- �w�q�s�誺 Form �_�l -->
<form name="EDIT" method="post" onsubmit="doSave();" style="margin:5,0,0,0;">
	<input type=hidden name="control_type">
	<input type=hidden name="ROWSTAMP">
	<input type=hidden name="ASYS">
	<input type=hidden name="APP_SEQ">
	<input type=hidden name="AYEAR">
	<input type=hidden name="SMS">
	<input type=hidden name="STNO">
	<input type=hidden name="IDNO">
	<input type=hidden name="HEDU_TYPE" value="<%=HEDU_TYPE %>">
	<input type=hidden name="IS_CONFIRM" value="<%=IS_CONFIRM%>">
	<input type=hidden name="CRSNO_TYPE"><!-- ��׬�ت�������ƪ��覡--BLUR/WINDOW -->
	
	<!-- �s����e���_�l -->
	<TABLE id="EDIT_DIV" width="96%" border="0" align="center" cellpadding="0" cellspacing="0" summary="�ƪ��Ϊ��">
		<tr>
			<td width="13"><img src="<%=vr%>images/ap_index_mtb_01.gif" alt="�ƪ��ιϥ�" width="13" height="14"></td>
			<td width="100%"><img src="<%=vr%>images/ap_index_mtb_02.gif" alt="�ƪ��ιϥ�" width="100%" height="14"></td>
			<td width="13"><img src="<%=vr%>images/ap_index_mtb_03.gif" alt="�ƪ��ιϥ�" width="13" height="14"></td>
		</tr>
		<tr>
			<td width="13" background="<%=vr%>images/ap_index_mtb_04.gif" alt="�ƪ��ιϥ�">&nbsp;</td>
			<td width="100%" valign="top" bgcolor="#FFFFFF">
				<!-- ���s�e���_�l -->
				<table width="100%" border="0" align="center" cellpadding="2" cellspacing="0" summary="�ƪ��Ϊ��">
					<tr class="mtbGreenBg">
						<td align=left>�ӽбĻ{- <span id='EditStatus'>�s�W</span></td>
						<td align=right>
							<div id="edit_btn">
								<input type=button class="btn" value='�a�X�Ļ{���' name="OPEN_WIN_BTN" onkeypress="doOpenCrsno();" onclick="doOpenCrsno();">
								<input type=button class="btn" value='�C�L�ӽЪ�' name="PRT_BTN1" onkeypress="doPrint1();" onclick="doPrint1();">
								<input type=button class="btn" value='�C�L�Ǩt�ӽЪ�' name="PRT_BTN2" onkeypress="doPrint2();" onclick="doPrint2();" style='display:none'>							
								<input type=button name="SEND_BTN" class="btn1" value='�T�{�e�X' onkeypress='doSend();'onclick='doSend();'>							
								<input type=button name="ADD_BTN" class="btn" value='�s  �W' onkeypress='doAdd();'onclick='doAdd();' style='display:none'>
								<input type=button class="btn" value='�M  ��' onkeypress='doClear();'onclick='doClear();' style='display:none'>
								<input type=submit name="SAVE_BTN" class="btn1" value='�s  ��' style='display:none'>
							</div>
						</td>
					</tr>
				</table>
				<!-- ���s�e������ -->

				<!-- �s��e���_�l -->
				<table id="table2" width="100%" border="0" align="center" cellpadding="2" cellspacing="0" summary="�ƪ��Ϊ��" style='display:none'>
					<tr>
						<td align='right' class='tdgl1'>�u������<font color=red>��</font>�G</td>
						<td colspan='3' class='tdGrayLight'><input type=text name='PRIORITY'></td>	
						<td align='right' class='tdgl1'>�Ǯ����O<font color=red>��</font>�G</td>
						<td colspan='3'>
							<select name="SCHOOL_TYPE" onchange="resetColumn()" disabled>		
								<option value=''>�п��</option>						
								<script>Form.getSelectFromPhrase("CCS010M_1_01_SELECT", "KIND", "HEDU_TYPE");</script>
							</select>
						</td>							
					</tr>
					<tr>
						<td align='right' class='tdgl2'>�Ļ{���<font color=red>��</font>�G</td>
						<td colspan='7' class='tdGrayLight'>												
							<input type='text' Column='CRSNO' name='CRSNO' id='CRSNO_ID' onblur='executeCrsno();' readonly >
							<img id='IMG' src='/images/select.gif' alt='�}�����' style='cursor:hand' onkeypress='getCrsno();' onclick='getCrsno();' >
							<input type=text Column='CRS_NAME' name='CRS_NAME' readonly>							
							&nbsp;&nbsp;�Ǥ��ơG&nbsp;&nbsp;
							<input type=text Column='CRD' name='CRD' readonly>
						</td>				
					</tr>
					<tr>
						<td align='right' class='tdgl1'>���խ��Ū���<font color=red>��</font>�G</td>
						<td colspan='7' class='tdGrayLight'>														
							<input type='text' Column='CRSNO_UNIV' name='CRSNO_UNIV' id='CRSNO_UNIV_ID' readonly>
							<img id='IMG1' src='/images/select.gif' alt='�}�����' style='cursor:hand' onkeypress="getPassCrs('WINDOW');" onclick="getPassCrs('WINDOW');">
							<input type=text Column='CRS_NAME_UNIV' name='CRS_NAME_UNIV' id='CRS_NAME_UNIV_ID' readonly>	
							&nbsp;&nbsp;�Ǥ��ơG&nbsp;&nbsp;
							<input type=text Column='CRD_UNIV' name='CRD_UNIV' id='CRD_UNIV_ID'>																																																				
						</td>	
						</td>				
					</tr>
					<tr>
						<td align='right' class='tdgl2'>���Ū�Ǧ~<font color=red>��</font>�G</td>
						<td class='tdGrayLight'><input type=text name='GRADE_OLD'  Column='GRADE_OLD' readonly></td>
						<td align='right' class='tdgl2'>���Ū�Ǵ�<font color=red>��</font>�G</td>
						<td class='tdGrayLight'>
							<select name='SMS_OLD' Column='SMS_OLD' disabled>
								<option value=''>�п��</option>
								<option value='1'>�W�U�Ǵ�</option>
								<option value='2'>�W�Ǵ�</option>
								<option value='3'>�U�Ǵ�</option>
								<option value='4'>����</option>
							</select>
						</td>
						<td align='right' class='tdgl2'>��/�w�~<font color=red>��</font>�G</td>
						<td class='tdGrayLight' colspan="3">		
							<input type=hidden name='GRAD_TYPE_1' Column='GRAD_TYPE_1'onchange='getGRAD_TYPE()'   >���~												
							<input type=radio name='GRAD_TYPE' value="1" checked  readonly>���~												
							<input type=radio name='GRAD_TYPE' value="0" readonly>�w�~
						</td>
											
					</tr>
				</table>
				<table id="table2" width="100%" border="0" align="center" cellpadding="2" cellspacing="0" summary="�ƪ��Ϊ��" >
					<tr>
						<td align='right' class='tdgl1'>�`�N�ƶ��G</td>
						<td colspan='7' class='tdGrayLight'>
							<font color=red>
								<!--���p�q�ܡB�q�T�a�}�Bemail���~�A���I��"�ק�ǥͰ򥻸��"<BR>
								���n��������A�ЦC�L�ӽЪ�A�ܫ��ɤ��߿�zú�O.....<BR>
								���p��ú�O�A��...<BR>
								����K�B�Ļ{�B���Ъ`�N�ƶ��вQ������
								-->
							<%=CONTENT%>		
							</font>
						</td>
					</tr>				
				</table>
				<!-- �s��e������ -->
			</td>
			<td width="13" background="<%=vr%>images/ap_index_mtb_06.gif" alt="�ƪ��ιϥ�">&nbsp;</td>
		</tr>
		<tr>
			<td width="13"><img src="<%=vr%>images/ap_index_mtb_07.gif" alt="�ƪ��ιϥ�" width="13" height="15"></td>
			<td width="100%"><img src="<%=vr%>images/ap_index_mtb_08.gif" alt="�ƪ��ιϥ�" width="100%" height="15"></td>
			<td width="13"><img src="<%=vr%>images/ap_index_mtb_09.gif" alt="�ƪ��ιϥ�" width="13" height="15"></td>
		</tr>
	</table>
	<!-- �s����e������ -->
</form>
<!-- �w�q�s�誺 Form ���� -->
</span>

<!-- �w�q�d�ߵ��G�� Form �_�l -->
<form name="RESULT" method="post" style="margin:10,0,0,0;">
	<input type=hidden name="control_type">
	<input type=hidden keyColumn="Y" name="APP_SEQ">
	<input type=hidden keyColumn="Y" name="CRSNO">
	<input type=hidden keyColumn="Y" name="AYEAR">
	<input type=hidden keyColumn="Y" name="SMS">
	<input type=hidden keyColumn="Y" name="STNO">
	<input type=hidden keyColumn="Y" name="PRIORITY">
	
	<input type=hidden name="IS_CONFIRM" value="<%=IS_CONFIRM%>">

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
							<input type=button class="btn" value='�R    ��' name="DEL_BTN" onkeypress="doDelete('multi');"onclick="doDelete('multi');">
							<input type=button class="btn" value='�վ��u������' name="ORDER_BTN" onkeypress="doOpen('<%=keyValue%>',800,500,'/ccs/ccs010m_04.jsp');iniGrid();"onclick="doOpen('<%=keyValue%>',800,500,'/ccs/ccs010m_04.jsp');iniGrid();">
							
						</td>
						<!-- �d�ߵ��G���s���� -->

						<!-- �����r��_�l -->
						<td align=right nowrap>
							<div id="page">
								<b>
									<span id="pageStr"></span>
									�i<input type='text' name='_scrollSize' size=2 value='10' style="text-align:center">
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
				<!-- �d�ߵ��G�\��e���_�l -->
				<div id="grid-scroll" style="overflow:auto;width:100%;height:300;"></div>
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

<form name="PRINT" method="post">
	<input type=hidden name="AYEAR" value="<%=AYEAR%>">
	<input type=hidden name="SMS" value="<%=SMS%>">
	<input type=hidden name="STNO" value="<%=STNO%>">
	<input type=hidden name="APP_SEQ" value="<%=APP_SEQ%>">
	<input type=hidden name="APP_TYPE" value="2">
	<input type=hidden name="CALLER" value="CCS003M">
</form>

<form name="SEND" method="post">
	<input type=hidden name="control_type">
	<input type=hidden name="AYEAR" value="<%=AYEAR%>">
	<input type=hidden name="SMS" value="<%=SMS%>">
	<input type=hidden name="STNO" value="<%=STNO%>">
	<input type=hidden name="ASYS" value="<%=ASYS%>">
	<input type=hidden name="APP_TYPE" value="2">
</form>

<script>
	document.write ("<font color=\"white\">" + document.lastModified + "</font>");
	window.attachEvent("onload", page_init);
	window.attachEvent("onload", onloadEvent);
</script>
</body>
</html>