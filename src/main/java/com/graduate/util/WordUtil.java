package com.graduate.util;
import java.io.BufferedWriter;
import java.io.ByteArrayOutputStream;
import java.io.OutputStreamWriter;
import java.io.Writer;
import java.util.Map;

import freemarker.template.Configuration;
import freemarker.template.Template;

public final class WordUtil {
  private static Configuration configuration = null;

  private WordUtil() {
	throw new AssertionError();
  }

  /**
   * 根据模板生成相应的文件
   * @param root 保存数据的map
   * @param template 模板文件的地址
   * @param path 生成的word文档输出地址
   * @return
   */
  public static synchronized ByteArrayOutputStream process(Map<?, ?> root, String template) {

	if (null == root ) {
	  throw new RuntimeException("数据不能为空");
	}

	if (null == template) {
	  throw new RuntimeException("模板文件不能为空");
	}

	ByteArrayOutputStream outputStream = new ByteArrayOutputStream();

	if (null == configuration) {
	  configuration = new Configuration();  // 这里Configurantion对象不能有两个，否则多线程访问会报错
	  configuration.setDefaultEncoding("utf-8");
	  configuration.setClassicCompatible(true);
	}
	configuration.setClassForTemplateLoading(WordUtil.class, "/");

	Template t = null;
	try {
	  t = configuration.getTemplate(template);
	  Writer w = new BufferedWriter(new OutputStreamWriter(outputStream, "utf-8"));
	  t.process(root, w);  // 这里w是一个输出地址，可以输出到任何位置，如控制台，网页等
	  w.close();
	} catch (Exception e) {
	  throw new RuntimeException(e);
	}
	return outputStream;
  }

}