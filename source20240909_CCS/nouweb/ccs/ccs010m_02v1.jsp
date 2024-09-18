<%/*
----------------------------------------------------------------------------------
File Name		: ccs010m_02v1
Author			: jeff
Description		: 申請採認 - 編輯顯示頁面
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

	
	/** 最高學歷 */
	String	ASYS	 	=	(String)session.getAttribute("ASYS");
	if("1".equals(ASYS)){
		session.setAttribute("CCS010M_1_01_SELECT", "NOU#SELECT '' AS SELECT_VALUE, '請選擇' AS SELECT_TEXT, 0 AS O FROM DUAL UNION SELECT TO_CHAR(CODE) AS SELECT_VALUE, TO_CHAR(CODE_NAME) AS SELECT_TEXT, 1 AS O FROM SYST001 WHERE KIND='[KIND]' AND CODE IN ('1','2','3','4')  ORDER BY O, SELECT_VALUE, SELECT_TEXT ");
	}else if("2".equals(ASYS)){
		session.setAttribute("CCS010M_1_01_SELECT", "NOU#SELECT '' AS SELECT_VALUE, '請選擇' AS SELECT_TEXT, 0 AS O FROM DUAL UNION SELECT TO_CHAR(CODE) AS SELECT_VALUE, TO_CHAR(CODE_NAME) AS SELECT_TEXT, 1 AS O FROM SYST001 WHERE KIND='[KIND]' AND CODE IN ('1','2','3','4')  ORDER BY O, SELECT_VALUE, SELECT_TEXT ");
	}
%>
<html>
<head>
	<%@ include file="/utility/viewpageinit.jsp"%>
	<script src="<%=vr%>script/framework/query1_2_0_2.jsp"></script>
	<script src="ccs010m_02c1.jsp"></script>
	<noscript>
		<p>您的瀏覽器不支援JavaScript語法，但是並不影響您獲取本網站的內容</p>
	</noscript>
</head>
<body background="<%=vr%>images/ap_index_bg.jpg" alt="背景圖" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">

<!-- 定義編輯的 Form 起始 -->
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

	<!-- 編輯全畫面起始 -->
	<TABLE id="EDIT_DIV" width="96%" border="0" align="center" cellpadding="0" cellspacing="0" summary="排版用表格">
		<tr>
			<td width="13"><img src="<%=vr%>images/ap_index_mtb_01.gif" alt="排版用圖示" width="13" height="14"></td>
			<td width="100%"><img src="<%=vr%>images/ap_index_mtb_02.gif" alt="排版用圖示" width="100%" height="14"></td>
			<td width="13"><img src="<%=vr%>images/ap_index_mtb_03.gif" alt="排版用圖示" width="13" height="14"></td>
		</tr>
		<tr>
			<td width="13" background="<%=vr%>images/ap_index_mtb_04.gif" alt="排版用圖示">&nbsp;</td>
			<td width="100%" valign="top" bgcolor="#FFFFFF">
				<!-- 按鈕畫面起始 -->
				<table width="100%" border="0" align="center" cellpadding="2" cellspacing="0" summary="排版用表格">
					<tr class="mtbGreenBg">
						<td align=left>【編輯畫面】- <span id='EditStatus'>新增</span></td>
						<td align=right>
							<div id="edit_btn">
								<input type=button class="btn" value='回查詢頁' onkeypress='doBack();'onclick='doBack();'>
								<input type=button class="btn" name="CLS_BTN" value='清  除' onkeypress='doClear();'onclick='doClear();'>
								<input type=submit name="SAVE_BTN" class="btn" value='存  檔'>
							</div>
						</td>
					</tr>
				</table>
				<!-- 按鈕畫面結束 -->

				<!-- 編輯畫面起始 -->
				<table id="table2" width="100%" border="0" align="center" cellpadding="2" cellspacing="0" summary="排版用表格">
					<tr>
						<td align='right' class='tdgl1'>學號：</td>
						<td class='tdGrayLight'>
							<input type=text name='STNO'>
							<input type=button class="btn" id='findD' value='帶出基本資料' onkeypress='findData();'onclick='findData();'>
						</td>
						<td align='right' class='tdgl1'>姓名：</td>
						<td class='tdGrayLight'><input type=text name='NAME'></td>		
					</tr>
					<tr>						
						<td align='right' class='tdgl1'>中心別：</td>
						<td class='tdGrayLight'>
							<select name='CENTER_CODE'>
								<option value=''>請選擇</option>
								<script>Form.getSelectFromPhrase("CCS010M_10_SELECT", "", "");</script>
							</select>							
						</td>
						<td align='right' class='tdgl1'>最高學歷：</td>
						<td class='tdGrayLight'>
							<select name='HEDU_TYPE'>
								<script>Form.getSelectFromPhrase("CCS010M_1_01_SELECT", "KIND", "HEDU_TYPE");</script>
							</select>
							<font color=red>請選取最高學歷，確認後請按存檔按鈕</font>	
						</td>						
					</tr>
					<tr>
						<td align='right' class='tdgl2'>聯絡電話：</td>
						<td class='tdGrayLight'><input type=text name='TEL'></td>
						<td align='right' class='tdgl2'>通訊地址：</td>
						<td class='tdGrayLight' colspan=3>
							<input type=text name='CRRSADDR_ZIP'>
							<input type=text name='CRRSADDR'>
						</td>					
					</tr>															
				</table>
				<!-- 編輯畫面結束 -->
			</td>
			<td width="13" background="<%=vr%>images/ap_index_mtb_06.gif" alt="排版用圖示">&nbsp;</td>
		</tr>
		<tr>
			<td width="13"><img src="<%=vr%>images/ap_index_mtb_07.gif" alt="排版用圖示" width="13" height="15"></td>
			<td width="100%"><img src="<%=vr%>images/ap_index_mtb_08.gif" alt="排版用圖示" width="100%" height="15"></td>
			<td width="13"><img src="<%=vr%>images/ap_index_mtb_09.gif" alt="排版用圖示" width="13" height="15"></td>
		</tr>
	</table>
	<!-- 編輯全畫面結束 -->
</form>
<!-- 定義編輯的 Form 結束 -->

<!-- 標題畫面起始 -->
<table width="96%" border="0" align="center" cellpadding="4" cellspacing="0" summary="排版用表格">
	<tr>
		<td>
			<table width="500" height="27" border="0" cellpadding="0" cellspacing="0">
				<tr>
					<td background="<%=vr%>images/ap_index_title.jpg" alt="排版用圖示">
						　　<span class="title">CCS010M_申請校內學分採認</span>
					</td>
				</tr>
			</table>
		</td>
	</tr>
</table>
<!-- 標題畫面結束 -->

<script>
	document.write ("<font color=\"white\">" + document.lastModified + "</font>");
	window.attachEvent("onload", page_init);
	window.attachEvent("onload", onloadEvent);
</script>
</body>
</html>