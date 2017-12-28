package cn.laoma.dao;

import cn.laoma.domain.User;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

/**
 * Created by laoma on 2017/12/15.
 */
@Repository
public interface IUserDao {

     int insert(User user);

     User getUserById(@Param(value = "id")Integer id);

    int updateUserById(User user);



}
