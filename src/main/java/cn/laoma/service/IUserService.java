package cn.laoma.service;

import cn.laoma.domain.User;

/**
 * Created by laoma on 2017/12/15.
 */
public interface IUserService{


    /*
    * 保存用户
    * */
    public Boolean save(User user);

    /*
    *
    * 根据用户Id获取用户
    * */
    public User getUserById(Integer id);


}
