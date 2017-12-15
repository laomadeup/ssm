package cn.laoma.dao;

import cn.laoma.domain.User;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

/**
 * Created by laoma on 2017/12/15.
 */
@Repository
public interface IUserDao {

    public int insert(User user);

    public User getUserById(@Param(value = "id")Integer id);


}
