package cn.laoma.domain;/**
 * Created by laoma on 2017/12/15.
 */

/**
 * 用户
 *
 * @author laoma
 * @create 2017-12-15 10:00
 **/
public class User {

    private Integer id;
    private String username;
    private String password;
    /*
    * -1：保密；0：女；1：男
    * */
    private Short gender;
    /*
    * 用户状态：-1：冻结，1：开通
    * */
    private Short status;
    private Long creatTime;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Short getGender() {
        return gender;
    }

    public void setGender(Short gender) {
        this.gender = gender;
    }

    public Short getStatus() {
        return status;
    }

    public void setStatus(Short status) {
        this.status = status;
    }

    public Long getCreatTime() {
        return creatTime;
    }

    public void setCreatTime(Long creatTime) {
        this.creatTime = creatTime;
    }
}
