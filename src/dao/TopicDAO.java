package dao;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import entity.PageBean;
import entity.Topic;

public interface TopicDAO {
	/**
	 * 根据id查找专题
	 * 
	 * @param id
	 * @return
	 */
	Topic findTopicById(int id);

	/**
	 * 通过用户id找到收藏的专题
	 * 
	 * @param userid
	 * @return
	 */
	List<Topic> findTopicByUserId(int userid);

	/**
	 * 查找到所有的专题
	 */
	@Select("select * from topic ")
	List<Topic> findAllForAdmin();
	
	/**
	 * 为用户查询所有的专题，不查询出状态为删除的
	 * @return
	 */
	@Select("select * from topic where stats !=0")
	List<Topic> findAllForUser();

	/**
	 * 更新专题
	 * 
	 * @param topic
	 * @return
	 */
	int updateTopic(Topic topic);

	/**
	 * 根据id删除专题
	 * 
	 * @param id
	 * @return
	 */
	@Update("update topic set stats=0 where id = #{id}")//0表示这条数据是删除状态
	int deleteTopicById(int id);
	
	/**
	 * 添加一条专题
	 * @param topic
	 * @return
	 */
	@Insert("insert into topic (name,article_num,pic_path,is_suggest,stats) values(#{name},#{article_num},#{pic_path},#{is_suggest},1)")
	int insertTopic(Topic topic);
	
	/**
	 * 获取数据的总数
	 * @return
	 */
	@Select("select count(*) from topic")
	long findTotalCount();
	
	/**
	 * 分页查询
	 * @param page
	 * @return
	 */
	List<Topic> findByPageBean(PageBean<Topic> page);
	
	@Select("select * from topic where name like concat(concat('%',#{name}),'%')")
	List<Topic> findByName(String name);
	
	/**
	 * 根据用户的id查询收藏的专题
	 * @param id
	 * @return
	 */
	@Select("select * from topic where id in ( select topic_id from attention_topic where user_id = #{id}) ")
	public List<Topic> findByUserId(int id);

	@Select("select * from topic where is_suggest = true and stats != 0")
	public List<Topic> findSuggestTopic();

}
