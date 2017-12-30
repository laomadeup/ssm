package cn.laoma.serviceImpl;/**
 * Created by laoma on 2017/12/15.
 */

import cn.laoma.dao.IUserDao;
import cn.laoma.domain.User;
import cn.laoma.service.IUserService;
import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Date;

/**
 * 用户业务逻辑实现类
 *
 * @author
 * @create 2017-12-15 10:19
 **/
@Service("userServiceImpl")
public class UserServiceImpl implements IUserService{

    private static final Logger logger = Logger.getLogger(UserServiceImpl.class);

    @Resource
    private IUserDao userDao;

    public Boolean save(User user){

        if (user == null) {
            logger.error("传入参数为空!");
            return false;
        }

        if(StringUtils.isEmpty(user.getUsername() )){
            logger.error("用户名称为空!");
            return false;
        }

        if(StringUtils.isEmpty(user.getPassword())){
            logger.error("用户密码为空!");
            return false;
        }

        /*
        * 对user类进行处理，例如状态，创建时间等
        * */
        if(user.getStatus() == null){
            user.setStatus(Short.valueOf("1"));
        }
        user.setCreatTime(new Date().getTime());
        Integer count = this.userDao.insert(user);

        if(count < 0){
            logger.error("用户注册失败！请联系管理员");
            return false;
        }

        return true;
    }

    public User getUserById(Integer id){

        if (id == null) {
            logger.error("传入参数为空!");
            return null;
        }
        User user = userDao.getUserById(id);
        if (user == null ) {
            logger.error("用户不存在!");
            return null;
        }
        return user;
    }


    public boolean updateUserByid(User user) {

        if(user == null){
            throw new RuntimeException("传入参数为空!");
        }
        if(user.getId() == null){
            throw new RuntimeException("用户id为空!");
        }
        if(StringUtils.isEmpty(user.getUsername())){
            throw new RuntimeException("用户姓名为空!");
        }
        if(StringUtils.isEmpty(user.getPassword())){
            throw new RuntimeException("用户密码为空!");
        }
        if(user.getGender() == null){
            throw new RuntimeException("用户性别为空!");
        }
        if(user.getStatus() == null){
            user.setStatus(Short.parseShort("1"));
        }

        int result = userDao.updateUserById(user);
        if(result >0){
            return true;
        }
        return false;
    }
}
