package com.graduate.util;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.net.URLEncoder;

import javax.servlet.http.HttpServletResponse;


public class DownloadUtil {

  /**
   * @param byteArrayOutputStream 将文件内容写入ByteArrayOutputStream
   * @param response HttpServletResponse	写入response
   * @param returnName 返回的文件名
   */
  public static void download(ByteArrayOutputStream byteArrayOutputStream, HttpServletResponse response, String returnName) throws IOException{
	  response.setContentType("application/msword");
	  response.setHeader("Content-Disposition", "attachment; filename=" + URLEncoder.encode(returnName, "UTF-8"));
	  response.setContentLength(byteArrayOutputStream.size());
	  OutputStream outputstream = response.getOutputStream();			//取得输出流
	  byteArrayOutputStream.writeTo(outputstream);					//写到输出流
	  byteArrayOutputStream.close();									//关闭
	  outputstream.flush();											//刷数据
	  outputstream.close();
  }
}