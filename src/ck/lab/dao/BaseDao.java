package ck.lab.dao;

import java.sql.SQLException;
import javax.sql.DataSource;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.ResultSetHandler;

import com.mchange.v2.c3p0.ComboPooledDataSource;

public class BaseDao {
	private static DataSource dSource = null;
	private QueryRunner       qRunner = null;
	
	static {
		// ����Ĭ������
		ComboPooledDataSource cpds = new ComboPooledDataSource();
		BaseDao.dSource = cpds;
	}
	
	public boolean SqlUpdate(String sql, Object... obj) {  // ���ݸ���
		qRunner = new QueryRunner(dSource);
		try {
			if (qRunner.update(sql, obj) > 0){
				return true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}
	
	public <T> T SqlQuery(String sql, ResultSetHandler<T> res, Object... obj) {  // ���ݲ�ѯ
		qRunner = new QueryRunner(dSource);
		try {
			return qRunner.query(sql, res, obj);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
}
