/**
 * Created by laoma on 2017/12/15.
 */

import cn.laoma.domain.User;
import cn.laoma.service.IUserService;
import org.apache.log4j.Logger;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.annotation.Resource;

/**
 * 测试后台逻辑
 *
 * @author
 * @create 2017-12-15 12:03
 **/

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:applicationContext.xml"})
public class TestSpringMybatis {

    @Resource
    private IUserService userServiceImpl;
    private static Logger logger = Logger.getLogger(TestSpringMybatis.class);

    @Test
    public  void testSaveUser(){

        User u = new User();
        u.setUsername("李白");
        u.setPassword("123456");
        u.setGender(Short.valueOf("-1"));
        Boolean flag = userServiceImpl.save(u);
        if(!flag){
            logger.error("保存用户失败！");
        }
    }

    @Test
    public void testGetUserById(){

        User user = userServiceImpl.getUserById(Integer.valueOf("1"));
        System.out.println(user.getUsername()+"  "+user.getPassword()+"  "+user.getGender());
        //haha

    }






}
