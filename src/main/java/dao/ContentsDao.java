package dao;

import model.Buy;
import model.Contents;

public interface ContentsDao {

	int getC_coin(String c_id);
	Contents getContents(String c_id);

}
