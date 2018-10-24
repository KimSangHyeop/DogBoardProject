<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="java.io.File"%>
<%@page import="java.util.Date"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>

<%
String returnUrl = "";
try{
    String imgExt = "jpg,png,bmp,gif";
	String uploadTempPath = "/webhome/tomcat/webapps/wiz/contents/board/editor/upload/";
	String uploadTempSrc = "/wiz/contents/board/editor/upload/";
	int sizeLimit = 1024*1024*30;          //30MB제한

    //업로드 경로, 파일 최대 크기, 한글처리, 파일 중복처리
    MultipartRequest multi = new MultipartRequest(request, uploadTempPath, sizeLimit, "utf-8", new DefaultFileRenamePolicy());
    returnUrl += multi.getParameter("callback")+"?callback_func="+multi.getParameter("callback_func");
   
    String key = (String) (multi.getFileNames()).nextElement();
	String fileName = multi.getFilesystemName(key);
	
    if(fileName != null){
    	long nowTime = System.currentTimeMillis();
    	SimpleDateFormat sdfDate = new SimpleDateFormat("yyyyMMdd");
    	SimpleDateFormat sdfNow = new SimpleDateFormat("yyyyMMddHHmmss");
    	String strNow = sdfNow.format(new Date(nowTime));
    	String strDate = sdfDate.format(new Date(nowTime));
    	String fileExt = fileName.substring(fileName.lastIndexOf(".")+1);
    	String reFileName = strNow+"."+fileExt;
    	if(imgExt.indexOf(fileExt) >=0){
    		File directory = new File(uploadTempPath+"/"+strDate+"/");
			if(!directory.exists()){
				directory.mkdir();
			}
    		File upfile1 = new File(uploadTempPath+fileName);
            File upfile2 = new File(uploadTempPath+"/"+strDate+"/"+reFileName);
            if(upfile1.renameTo(upfile2)){
          		returnUrl += "&bNewLine=true";
    			returnUrl += "&sFileName="+ URLEncoder.encode(reFileName);
    			returnUrl += "&sFileURL="+uploadTempSrc+strDate+"/"+URLEncoder.encode(reFileName);
            }else{
            	returnUrl += "&errstr="+reFileName;
            }
    	}else{
    		returnUrl += "&errstr="+reFileName;
    	}
    }else{
    	returnUrl += "&errstr=error";
    }     
 }catch(Exception e){
	 returnUrl += "&errstr=error";
 }
response.sendRedirect(returnUrl);	
%>