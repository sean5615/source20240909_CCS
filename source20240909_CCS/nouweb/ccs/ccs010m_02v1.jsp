<%/*
----------------------------------------------------------------------------------
File Name		: ccs010m_02v1
Author			: jeff
Description		: �ӽбĻ{ - �s����ܭ���
Modification Log	:

Vers		Date       	By            	Notes
--------------	--------------	--------------	----------------------------------
0.0.1		096/06/04	jeff    	Code Generate Create
----------------------------------------------------------------------------------
*/%>
<%@ page contentType="text/html; charset=UTF-8" errorPage="/utility/errorpage.jsp" pageEncoding="MS950"%>
<%@ include file="/utility/header.jsp"%>
<%
	/**  */
	session.setAttribute("CCS010M_10_SELECT", "NOU#SELECT CENTER_CODE AS SELECT_VALUE, CENTER_NAME AS SELECT_TEXT FROM SYST002 WHERE CENTER_CODE <> '00' ORDER BY SELECT_VALUE, SELECT_TEXT ");

	
	/** �̰��Ǿ� */
	String	ASYS	 	=	(String)session.getAttribute("ASYS");
	if("1".equals(ASYS)){
		session.setAttribute("CCS010M_1_01_SELECT", "NOU#SELECT '' AS SELECT_VALUE, '�п��' AS SELECT_TEXT, 0 AS O FROM DUAL UNION SELECT TO_CHAR(CODE) AS SELECT_VALUE, TO_CHAR(CODE_NAME) AS SELECT_TEXT, 1 AS O FROM SYST001 WHERE KIND='[KIND]' AND CODE IN ('1','2','3','4')  ORDER BY O, SELECT_VALUE, SELECT_TEXT ");
	}else if("2".equals(ASYS)){
		session.setAttribute("CCS010M_1_01_SELECT", "NOU#SELECT '' AS SELECT_VALUE, '�п��' AS SELECT_TEXT, 0 AS O FROM DUAL UNION SELECT TO_CHAR(CODE) AS SELECT_VALUE, TO_CHAR(CODE_NAME) AS SELECT_TEXT, 1 AS O FROM SYST001 WHERE KIND='[KIND]' AND CODE IN ('1','2','3','4')  ORDER BY O, SELECT_VALUE, SELECT_TEXT ");
	}
%>
<html>
<head>
	<%@ include file="/utility/viewpageinit.jsp"%>
	<script src="<%=vr%>script/framework/query1_2_0_2.jsp"></script>
	<script src="ccs010m_02c1.jsp"></script>
	<noscript>
		<p>�z���s�������䴩JavaScript�y�k�A���O�ä��v�T�z��������������e</p>
	</noscript>
</head>
<body background="<%=vr%>images/ap_index_bg.jpg" alt="�I����" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">

<!-- �w�q�s�誺 Form �_�l -->
<form name="EDIT" method="post" onsubmit="doSave();" style="margin:5,0,0,0;">
	<input type=hidden name="control_type">
	<input type=hidden name="ROWSTAMP">
	<input type=hidden name="ASYS">
	<input type=hidden name="AYEAR">
	<input type=hidden name="SMS">
	<input type=hidden name="APP_TYPE">
	<input type=hidden name="STTYPE">
	<input type=hidden name="ENROLL_STATUS">
	<input type=hidden name="CENTER_CODE_TEMP">

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
						<td align=left>�i�s��e���j- <span id='EditStatus'>�s�W</span></td>
						<td align=right>
							<div id="edit_btn">
								<input type=button class="btn" value='�^�d�߭�' onkeypress='doBack();'onclick='doBack();'>
								<input type=button class="btn" name="CLS_BTN" value='�M  ��' onkeypress='doClear();'onclick='doClear();'>
								<input type=submit name="SAVE_BTN" class="btn" value='�s  ��'>
							</div>
						</td>
					</tr>
				</table>
				<!-- ���s�e������ -->

				<!-- �s��e���_�l -->
				<table id="table2" width="100%" border="0" align="center" cellpadding="2" cellspacing="0" summary="�ƪ��Ϊ��">
					<tr>
						<td align='right' class='tdgl1'>�Ǹ��G</td>
						<td class='tdGrayLight'>
							<input type=text name='STNO'>
							<input type=button class="btn" id='findD' value='�a�X�򥻸��' onkeypress='findData();'onclick='findData();'>
						</td>
						<td align='right' class='tdgl1'>�m�W�G</td>
						<td class='tdGrayLight'><input type=text name='NAME'></td>		
					</tr>
					<tr>						
						<td align='right' class='tdgl1'>���ߧO�G</td>
						<td class='tdGrayLight'>
							<select name='CENTER_CODE'>
								<option value=''>�п��</option>
								<script>Form.getSelectFromPhrase("CCS010M_10_SELECT", "", "");</script>
							</select>							
						</td>
						<td align='right' class='tdgl1'>�̰��Ǿ��G</td>
						<td class='tdGrayLight'>
							<select name='HEDU_TYPE'>
								<script>Form.getSelectFromPhrase("CCS010M_1_01_SELECT", "KIND", "HEDU_TYPE");</script>
							</select>
							<font color=red>�п���̰��Ǿ��A�T�{��Ы��s�ɫ��s</font>	
						</td>						
					</tr>
					<tr>
						<td align='right' class='tdgl2'>�p���q�ܡG</td>
						<td class='tdGrayLight'><input type=text name='TEL'></td>
						<td align='right' class='tdgl2'>�q�T�a�}�G</td>
						<td class='tdGrayLight' colspan=3>
							<input type=text name='CRRSADDR_ZIP'>
							<input type=text name='CRRSADDR'>
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

<!-- ���D�e���_�l -->
<table width="96%" border="0" align="center" cellpadding="4" cellspacing="0" summary="�ƪ��Ϊ��">
	<tr>
		<td>
			<table width="500" height="27" border="0" cellpadding="0" cellspacing="0">
				<tr>
					<td background="<%=vr%>images/ap_index_title.jpg" alt="�ƪ��ιϥ�">
						�@�@<span class="title">CCS010M_�ӽЮդ��Ǥ��Ļ{</span>
					</td>
				</tr>
			</table>
		</td>
	</tr>
</table>
<!-- ���D�e������ -->

<script>
	document.write ("<font color=\"white\">" + document.lastModified + "</font>");
	window.attachEvent("onload", page_init);
	window.attachEvent("onload", onloadEvent);
</script>
</body>
</html>