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
	 * �ļ��ϴ�
	 */
	private static final long serialVersionUID = 1L;
	
	private HttpServletRequest  request  = ServletActionContext.getRequest();
	private HttpServletResponse response = ServletActionContext.getResponse();
	
	
	private SessionUtil sUtil = new SessionUtil(request, response);
	private ArticleBiz  atBiz = new ArticleImpl();
	
	private int  id;
	private File file; // �ļ�
	private String fileFileName; // �ļ��� 
	private String fileContentType; // �ļ�����
	private String destPath;  // ����·��
	

	public void upload() throws IOException{
		System.out.println("�ļ��Ƿ���� "+ fileFileName  + " session " + sUtil.CheckA());
		if (sUtil.CheckA()) {
			
			if (id <= 0) { // ��һ���ϴ�  ͨ�����ݿ�id�����ļ����·��
				String path = null;
				if (file != null && file.exists()) {  // �ж��ļ��Ƿ���� �����ھ�ʹ��Ĭ��ͼƬ logo
					path = "article/" + (atBiz.getEndId() + 1) + "/img" + fileFileName.substring(fileFileName.lastIndexOf("."));
				} else {
					path = "article/" + (atBiz.getEndId() + 1) + "/img.png";
					file = new File(request.getServletContext().getRealPath("images/logo.png"));
				}
				
				destPath = request.getServletContext().getRealPath(path);
				File newfile = new File(destPath);
				this.ClearFolder(newfile.getParentFile());  // �����������ڱ����ļ���Ŀ¼
				
				FileUtils.copyFile(file, newfile);
				this.print(SUCCESS);
			} else {
				String photopath = atBiz.getArt(id).getPhoto();  // �޸�ʱ�����ݿ��л�ȡ�ļ�·��
				if (file != null && file.exists()) {
					destPath = request.getServletContext().getRealPath(photopath.substring(0, photopath.lastIndexOf(".")) + fileFileName.substring(fileFileName.lastIndexOf("."))); 
//					System.out.println(destPath);
					File newfile = new File(destPath);
					this.ClearFolder(newfile.getParentFile());  // �����������ڱ����ļ���Ŀ¼
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
	
	// ɾ����Ŀ¼�������ļ� ������Ŀ¼
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
