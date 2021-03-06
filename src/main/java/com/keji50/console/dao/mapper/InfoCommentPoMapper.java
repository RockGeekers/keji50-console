package com.keji50.console.dao.mapper;

import com.keji50.console.dao.po.InfoCommentPo;
import java.util.List;
import java.util.Map;

public interface InfoCommentPoMapper {

	/**
	 * 查询文章评论信息
	 * 
	 * @param infoId
	 *            文章id 必须
	 * @param authorId
	 *            评论人id，默认传0。 当存在评论人id时， 返回该文章下所有审核通过的评论信息和该评论人的等待审核的评论信息
	 * @return
	 */
	List<InfoCommentPo> selectByCondition(Map<String, Object> condition);
	
	InfoCommentPo selectById(int id);
	
	
	int insert(InfoCommentPo comment);

}
