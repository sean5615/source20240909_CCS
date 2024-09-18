<%/*
----------------------------------------------------------------------------------
File Name		: ccs010m_03v1
Author			: jeff
Description		: 申請採認-新增編輯 - 顯示頁面
Modification Log	:

Vers		Date       	By            	Notes
----------	----------	--------------	------------------------------------------
1.0.0       097/09/12	poto		    學校類別加入 空大試辦
										FACULTY_CODE ='ZZ'  '空大試辦'
										SUBSTR(CRSNO,3,1) ='8' '推廣'
0.0.2		097/03/21	lin				將「序號」字樣改為「申請序號」
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
	
	 /** 科目名稱，科目代碼03 */	
	session.setAttribute("CCS010M_1_02_BLUR", "NOU#SELECT c.CRSNO, c.CRS_NAME, c.CRD FROM  COUT002 c WHERE c.CRSNO='[CRSNO]' ");	
	session.setAttribute("CCS010M_1_02_WINDOW", "NOU#SELECT c.CRSNO, c.CRS_NAME, c.CRD FROM  COUT002 c WHERE 1=1 ");			
	 /** 本校原修讀科目開窗 */
	session.setAttribute("CCS010M_1_03_BLUR_1", "NOU#SELECT '' as CRSNO, '' as CRS_NAME, '' as CRD  FROM DUAL WHERE 1 = 2 ");
	session.setAttribute("CCS010M_1_03_BLUR_2", "NOU#SELECT CRSNO, CRS_NAME, CRD FROM COUT002 WHERE CRSNO='[CRSNO]' ");
	session.setAttribute("CCS010M_1_03_WINDOW", "NOU#select crsno, crs_name, crd from cout002 where crs_name = [CRS_NAME]");		 
	
	/** 學校類別  -20240909更改為最高學歷等級 */	
	if("1".equals(ASYS)){
		//session.setAttribute("CCS010M_1_01_SELECT", "NOU#SELECT CODE AS SELECT_VALUE, CODE_NAME AS SELECT_TEXT FROM SYST001 WHERE KIND='[KIND]' AND CODE IN ('5','6','7','8') ORDER BY SELECT_VALUE, SELECT_TEXT ");
		session.setAttribute("CCS010M_1_01_SELECT", "NOU#SELECT CODE AS SELECT_VALUE, CODE_NAME AS SELECT_TEXT FROM SYST001 WHERE KIND='[KIND]' AND CODE IN ('1','2','3','4') ORDER BY SELECT_VALUE, SELECT_TEXT ");
	}else if("2".equals(ASYS)){
		session.setAttribute("CCS010M_1_01_SELECT", "NOU#SELECT CODE AS SELECT_VALUE, CODE_NAME AS SELECT_TEXT FROM SYST001 WHERE KIND='[KIND]' AND CODE IN ('1','2','3','4')  ORDER BY SELECT_VALUE, SELECT_TEXT ");
	}
	/** 最高學歷 */		
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
		<p>您的瀏覽器不支援JavaScript語法，但是並不影響您獲取本網站的內容</p>
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
<body background="<%=vr%>images/ap_index_bg.jpg" alt="背景圖" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">

<!-- 定義查詢的 Form 起始 -->
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

	<!-- 查詢全畫面起始 -->
	<TABLE id="QUERY_DIV" width="96%" border="0" align="center" cellpadding="0" cellspacing="0" summary="排版用表格">
		<tr>
			<td width="13"><img src="<%=vr%>images/ap_search_01.jpg" alt="排版用圖示" width="13" height="12"></td>
			<td width="100%"><img src="<%=vr%>images/ap_search_02.jpg" alt="排版用圖示" width="100%" height="12"></td>
			<td width="13"><img src="<%=vr%>images/ap_search_03.jpg" alt="排版用圖示" width="13" height="12"></td>
		</tr>
		<tr>
			<td width="13" background="<%=vr%>images/ap_search_04.jpg" alt="排版用圖示">&nbsp;</td>
			<td width="100%" valign="top" bgcolor="#C5E2C3">
				<!-- 按鈕畫面起始 -->
				<table width="100%" border="0" align="center" cellpadding="2" cellspacing="0" summary="排版用表格">
					<tr class="mtbGreenBg">
						<td align=left>【查詢畫面】</td>
						<td align=right>
							<div id="serach_btn">
								<input type=button class="btn" value='▲' name="hidden" onkeypress="doHiddenEdit();" onclick="doHiddenEdit();">
								<input type=button class="btn" value='▼' name="show" onkeypress="doShowEdit();" onclick="doShowEdit();" style='display:none'>							
								<!--<input type=button class="btn" value='回查詢頁' onkeypress='doBack();top.mainFrame.iniGrid();'onclick='doBack();top.mainFrame.iniGrid();'>-->
								<input type=button class="btn" value='回查詢頁' onkeypress='doBack();'onclick='doBack();'>
								<input type=button class="btn" value='修改學生基本資料' name='STU_BTN' onkeypress="doOpen('<%=keyValue%>',1280,1024,'<%=LINK%>');"onclick="doOpen('<%=keyValue%>',1280,1024,'<%=LINK%>');">
							</div>
						</td>
					</tr>
				</table>
				<!-- 按鈕畫面結束 -->

				<span id='QUERY_TABLE_SPAN'>
				<!-- 查詢畫面起始 -->
				<table id="table1" width="100%" border="0" align="center" cellpadding="2" cellspacing="1" summary="排版用表格">
					<tr>
						<td align='right'>中心別：</td>
						<td><input type=text name='CENTER_NAME'></td>	
						<td align='right'>申請序號：</td>
						<td colspan><input type=text name='APP_SEQ'></td>	
						<td align='right'>最高學歷：</td>
						<td colspan>
							<select name="HEDU_TYPE">								
								<script>Form.getSelectFromPhrase("CCS010M_1_04_SELECT", "KIND", "HEDU_TYPE");</script>
							</select>
						</td>						
					</tr>
					<tr>
						<td align='right'>學號：</td>
						<td><input type=text name='STNO'></td>	
						<td align='right'>姓名：</td>
						<td><input type=text name='NAME'></td>
						<td align='right'>身分證字號：</td>
						<td><input type=text name='IDNO'></td>						
					</tr>
					<tr>
						<td align='right'>聯絡電話：</td>
						<td><input type=text name='TEL'></td>	
						<td align='right'>通訊地址：</td>
						<td colspan=3>
							<input type=text name='CRRSADDR_ZIP'>
							<input type=text name='CRRSADDR'>
						</td>							
					</tr>
				</table>
				<!-- 查詢畫面結束 -->
				</span>
			</td>
			<td width="13" background="<%=vr%>images/ap_search_06.jpg" alt="排版用圖示">&nbsp;</td>
		</tr>
		<tr>
			<td width="13"><img src="<%=vr%>images/ap_search_07.jpg" alt="排版用圖示" width="13" height="13"></td>
			<td width="100%"><img src="<%=vr%>images/ap_search_08.jpg" alt="排版用圖示" width="100%" height="13"></td>
			<td width="13"><img src="<%=vr%>images/ap_search_09.jpg" alt="排版用圖示" width="13" height="13"></td>
		</tr>
	</table>
	<!-- 查詢全畫面結束 -->
</form>
<!-- 定義查詢的 Form 結束 -->

<!-- 標題畫面起始 -->
<!--
<table width="96%" border="0" align="center" cellpadding="4" cellspacing="0" summary="排版用表格">
	<tr>
		<td>
			<table width="500" height="27" border="0" cellpadding="0" cellspacing="0">
				<tr>
					<td background="<%=vr%>images/ap_index_title.jpg" alt="排版用圖示">
						　　<span class="title">申請採認-新增編輯</span>
					</td>
				</tr>
			</table>
		</td>
	</tr>
</table>
-->
<!-- 標題畫面結束 -->

<span id='EDIT_SPAN'>
<!-- 定義編輯的 Form 起始 -->
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
	<input type=hidden name="CRSNO_TYPE"><!-- 原修科目的相關資料的方式--BLUR/WINDOW -->
	
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
						<td align=left>申請採認- <span id='EditStatus'>新增</span></td>
						<td align=right>
							<div id="edit_btn">
								<input type=button class="btn" value='帶出採認科目' name="OPEN_WIN_BTN" onkeypress="doOpenCrsno();" onclick="doOpenCrsno();">
								<input type=button class="btn" value='列印申請表' name="PRT_BTN1" onkeypress="doPrint1();" onclick="doPrint1();">
								<input type=button class="btn" value='列印學系申請表' name="PRT_BTN2" onkeypress="doPrint2();" onclick="doPrint2();" style='display:none'>							
								<input type=button name="SEND_BTN" class="btn1" value='確認送出' onkeypress='doSend();'onclick='doSend();'>							
								<input type=button name="ADD_BTN" class="btn" value='新  增' onkeypress='doAdd();'onclick='doAdd();' style='display:none'>
								<input type=button class="btn" value='清  除' onkeypress='doClear();'onclick='doClear();' style='display:none'>
								<input type=submit name="SAVE_BTN" class="btn1" value='存  檔' style='display:none'>
							</div>
						</td>
					</tr>
				</table>
				<!-- 按鈕畫面結束 -->

				<!-- 編輯畫面起始 -->
				<table id="table2" width="100%" border="0" align="center" cellpadding="2" cellspacing="0" summary="排版用表格" style='display:none'>
					<tr>
						<td align='right' class='tdgl1'>優先順序<font color=red>＊</font>：</td>
						<td colspan='3' class='tdGrayLight'><input type=text name='PRIORITY'></td>	
						<td align='right' class='tdgl1'>學校類別<font color=red>＊</font>：</td>
						<td colspan='3'>
							<select name="SCHOOL_TYPE" onchange="resetColumn()" disabled>		
								<option value=''>請選擇</option>						
								<script>Form.getSelectFromPhrase("CCS010M_1_01_SELECT", "KIND", "HEDU_TYPE");</script>
							</select>
						</td>							
					</tr>
					<tr>
						<td align='right' class='tdgl2'>採認科目<font color=red>＊</font>：</td>
						<td colspan='7' class='tdGrayLight'>												
							<input type='text' Column='CRSNO' name='CRSNO' id='CRSNO_ID' onblur='executeCrsno();' readonly >
							<img id='IMG' src='/images/select.gif' alt='開窗選取' style='cursor:hand' onkeypress='getCrsno();' onclick='getCrsno();' >
							<input type=text Column='CRS_NAME' name='CRS_NAME' readonly>							
							&nbsp;&nbsp;學分數：&nbsp;&nbsp;
							<input type=text Column='CRD' name='CRD' readonly>
						</td>				
					</tr>
					<tr>
						<td align='right' class='tdgl1'>本校原修讀科目<font color=red>＊</font>：</td>
						<td colspan='7' class='tdGrayLight'>														
							<input type='text' Column='CRSNO_UNIV' name='CRSNO_UNIV' id='CRSNO_UNIV_ID' readonly>
							<img id='IMG1' src='/images/select.gif' alt='開窗選取' style='cursor:hand' onkeypress="getPassCrs('WINDOW');" onclick="getPassCrs('WINDOW');">
							<input type=text Column='CRS_NAME_UNIV' name='CRS_NAME_UNIV' id='CRS_NAME_UNIV_ID' readonly>	
							&nbsp;&nbsp;學分數：&nbsp;&nbsp;
							<input type=text Column='CRD_UNIV' name='CRD_UNIV' id='CRD_UNIV_ID'>																																																				
						</td>	
						</td>				
					</tr>
					<tr>
						<td align='right' class='tdgl2'>原修讀學年<font color=red>＊</font>：</td>
						<td class='tdGrayLight'><input type=text name='GRADE_OLD'  Column='GRADE_OLD' readonly></td>
						<td align='right' class='tdgl2'>原修讀學期<font color=red>＊</font>：</td>
						<td class='tdGrayLight'>
							<select name='SMS_OLD' Column='SMS_OLD' disabled>
								<option value=''>請選擇</option>
								<option value='1'>上下學期</option>
								<option value='2'>上學期</option>
								<option value='3'>下學期</option>
								<option value='4'>暑修</option>
							</select>
						</td>
						<td align='right' class='tdgl2'>畢/肄業<font color=red>＊</font>：</td>
						<td class='tdGrayLight' colspan="3">		
							<input type=hidden name='GRAD_TYPE_1' Column='GRAD_TYPE_1'onchange='getGRAD_TYPE()'   >畢業												
							<input type=radio name='GRAD_TYPE' value="1" checked  readonly>畢業												
							<input type=radio name='GRAD_TYPE' value="0" readonly>肄業
						</td>
											
					</tr>
				</table>
				<table id="table2" width="100%" border="0" align="center" cellpadding="2" cellspacing="0" summary="排版用表格" >
					<tr>
						<td align='right' class='tdgl1'>注意事項：</td>
						<td colspan='7' class='tdGrayLight'>
							<font color=red>
								<!--※如電話、通訊地址、email有誤，請點選"修改學生基本資料"<BR>
								※登錄完畢後，請列印申請表，至指導中心辦理繳費.....<BR>
								※如需繳費，請...<BR>
								※抵免、採認、申覆注意事項請淑儀提供
								-->
							<%=CONTENT%>		
							</font>
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
</span>

<!-- 定義查詢結果的 Form 起始 -->
<form name="RESULT" method="post" style="margin:10,0,0,0;">
	<input type=hidden name="control_type">
	<input type=hidden keyColumn="Y" name="APP_SEQ">
	<input type=hidden keyColumn="Y" name="CRSNO">
	<input type=hidden keyColumn="Y" name="AYEAR">
	<input type=hidden keyColumn="Y" name="SMS">
	<input type=hidden keyColumn="Y" name="STNO">
	<input type=hidden keyColumn="Y" name="PRIORITY">
	
	<input type=hidden name="IS_CONFIRM" value="<%=IS_CONFIRM%>">

	<!-- 查詢結果畫面起始 -->
	<table width="96%" border="0" align="center" cellpadding="0" cellspacing="0" summary="排版用表格">
		<tr>
			<td width="13"><img src="<%=vr%>images/ap_index_mtb_01.gif" alt="排版用圖示" width="13" height="14"></td>
			<td width="100%"><img src="<%=vr%>images/ap_index_mtb_02.gif" alt="排版用圖示" width="100%" height="14"></td>
			<td width="13"><img src="<%=vr%>images/ap_index_mtb_03.gif" alt="排版用圖示" width="13" height="14"></td>
		</tr>
		<tr>
			<td width="13" background="<%=vr%>images/ap_index_mtb_04.gif" alt="排版用圖示">&nbsp;</td>
			<td width="100%" bgcolor="#FFFFFF">
				<table width="100%" border="0" cellspacing="0" cellpadding="2" summary="排版用表格">
					<tr>
						<!-- 查詢結果按鈕起始 -->
						<td align=left>
							<input type=button class="btn" value='全    選' name="SELALL_BTN" onkeypress="Form.setCheckBox(1, 'RESULT');"onclick="Form.setCheckBox(1, 'RESULT');">
							<input type=button class="btn" value='全 不 選' name="SELNONE_BTN" onkeypress="Form.setCheckBox(0, 'RESULT');"onclick="Form.setCheckBox(0, 'RESULT');">
							<input type=button class="btn" value='刪    除' name="DEL_BTN" onkeypress="doDelete('multi');"onclick="doDelete('multi');">
							<input type=button class="btn" value='調整優先順序' name="ORDER_BTN" onkeypress="doOpen('<%=keyValue%>',800,500,'/ccs/ccs010m_04.jsp');iniGrid();"onclick="doOpen('<%=keyValue%>',800,500,'/ccs/ccs010m_04.jsp');iniGrid();">
							
						</td>
						<!-- 查詢結果按鈕結束 -->

						<!-- 分頁字串起始 -->
						<td align=right nowrap>
							<div id="page">
								<b>
									<span id="pageStr"></span>
									【<input type='text' name='_scrollSize' size=2 value='10' style="text-align:center">
									<input type=button value='筆' onkeypress="setPageSize();"onclick="setPageSize();">
									<input type='text' name='_goToPage' size=2 value='1' style="text-align:right">
									/ <span id="totalPage"></span> <input type=button value='頁' onkeypress='gotoPage(null)'onclick='gotoPage(null)'>
									<span id="totalRow">0</span> 筆】

								</b>
							</div>
						</td>
						<!-- 分頁字串結束 -->
					</tr>
				</table>
				<!-- 查詢結果功能畫面起始 -->
				<div id="grid-scroll" style="overflow:auto;width:100%;height:300;"></div>
				<input type=hidden name='EXPORT_FILE_NAME'>
				<textarea name='EXPORT_CONTENT' cols=80 rows=3 style='display:none'></textarea>
				<textarea name='ALL_CONTENT' cols=80 rows=3 style='display:none'></textarea>
				<!-- 查詢結果功能畫面結束 -->
			</td>
			<td width="13" background="<%=vr%>images/ap_index_mtb_06.gif" alt="排版用圖示">&nbsp;</td>
		</tr>
		<tr>
			<td width="13"><img src="<%=vr%>images/ap_index_mtb_07.gif" alt="排版用圖示" width="13" height="15"></td>
			<td width="100%"><img src="<%=vr%>images/ap_index_mtb_08.gif" alt="排版用圖示" width="100%" height="15"></td>
			<td width="13"><img src="<%=vr%>images/ap_index_mtb_09.gif" alt="排版用圖示" width="13" height="15"></td>
		</tr>
	</table>
	<!-- 查詢結果畫面結束 -->
</form>
<!-- 定義查詢結果的 Form 結束 -->

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