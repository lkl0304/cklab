package action.file;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;

import ck.lab.biz.article.ArticleBiz;
import ck.lab.biz.article.impl.ArticleImpl;
import ck.lab.util.SessionUtil;

public class FileAction extends ActionSupport {
	/**
	 * 文件上传
	 */
	private static final long serialVersionUID = 1L;
	
	private HttpServletRequest  request  = ServletActionContext.getRequest();
	private HttpServletResponse response = ServletActionContext.getResponse();
	
	
	private SessionUtil sUtil = new SessionUtil(request, response);
	private ArticleBiz  atBiz = new ArticleImpl();
	
	private int  id;
	private File file; // 文件
	private String fileFileName; // 文件名 
	private String fileContentType; // 文件类型
	private String destPath;  // 保存路径
	

	public void upload() throws IOException{
		System.out.println("文件是否存在 "+ fileFileName  + " session " + sUtil.CheckA());
		if (sUtil.CheckA()) {
			
			if (id <= 0) { // 第一次上传  通过数据库id生成文件相对路径
				String path = null;
				if (file != null && file.exists()) {  // 判断文件是否存在 不存在就使用默认图片 logo
					path = "article/" + (atBiz.getEndId() + 1) + "/img" + fileFileName.substring(fileFileName.lastIndexOf("."));
				} else {
					path = "article/" + (atBiz.getEndId() + 1) + "/img.png";
					file = new File(request.getServletContext().getRealPath("images/logo.png"));
				}
				
				destPath = request.getServletContext().getRealPath(path);
				File newfile = new File(destPath);
				this.ClearFolder(newfile.getParentFile());  // 清理并生成用于保存文件的目录
				
				FileUtils.copyFile(file, newfile);
				this.print(SUCCESS);
			} else {
				String photopath = atBiz.getArt(id).getPhoto();  // 修改时从数据库中获取文件路径
				if (file != null && file.exists()) {
					destPath = request.getServletContext().getRealPath(photopath.substring(0, photopath.lastIndexOf(".")) + fileFileName.substring(fileFileName.lastIndexOf("."))); 
//					System.out.println(destPath);
					File newfile = new File(destPath);
					this.ClearFolder(newfile.getParentFile());  // 清理并生成用于保存文件的目录
					FileUtils.copyFile(file, newfile);
				}
				this.print(SUCCESS);
			}
			
		}
	}

	private void print(String s) {
		response.setCharacterEncoding("utf-8");
		PrintWriter w = null;
		try {
			w = response.getWriter();
			w.println(s);
		} catch (IOException e) {
			e.printStackTrace();
		}
		w.close();
	}
	
	// 删除该目录下所有文件 并创建目录
	private void ClearFolder(File folder){
		if (folder.exists()) {
			for (File file : folder.listFiles()) {
				file.delete();
			}
		} else {
			folder.mkdirs();
		}
	}
	
	public File getFile() {
		return file;
	}
	public void setFile(File file) {
		this.file = file;
	}

	public String getFileFileName() {
		return fileFileName;
	}
	public void setFileFileName(String fileFileName) {
		this.fileFileName = fileFileName;
	}

	public String getFileContentType() {
		return fileContentType;
	}
	public void setFileContentType(String fileContentType) {
		this.fileContentType = fileContentType;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}
}
