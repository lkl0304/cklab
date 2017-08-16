package upload;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;


public class ServletFile extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html; charset=UTF-8");
		PrintWriter w = resp.getWriter();
		
		DiskFileItemFactory factory = new DiskFileItemFactory();
		ServletFileUpload upload = new ServletFileUpload(factory);
		upload.setSizeMax(204800);
		try {
			List<FileItem> items = upload.parseRequest(req);
			
			System.out.println(items.size());
			
			for (FileItem fileItem : items) {
				if (fileItem.isFormField()) {
					w.print(fileItem.getFieldName() + " 上传者: " + fileItem.getString());
				} else {
					String name = fileItem.getName(); // 文件路径名
					name = name.substring(name.lastIndexOf(File.separator) + 1);
					w.print("<br>文件名: " + name);
					
					String filepath = getServletContext().getRealPath("upload/1_" + name);
					
					System.out.println(filepath);
					
					File file = new File(filepath); // 根据文件路径创建文件
					
					if (!file.exists()) {
						file.getParentFile().mkdirs();
						file.createNewFile();
					}
					
					System.err.println(file.getAbsolutePath());
					
					System.out.println(" path --> " +req.getServletPath());
					
					fileItem.write(file);
					fileItem.delete();
				}
			}
		} catch (FileUploadException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		this.doGet(req, resp);
	}
	
}
