package com.keji50.console.dao.po;

import com.keji50.console.common.utils.constants.Constants;
import lombok.Data;
import org.apache.commons.lang.StringUtils;

/**
 * 客户信息对象
 * 
 * @author chao.li
 * @version
 * @since Ver 1.1
 * @Date 2015年12月8日 下午3:50:54
 * 
 * @see
 */
@Data
public class AccountPo {

    /**
     * 用户id
     */
    private int id;

    /**
     * 用户登录名
     */
    private String realname;

    private String phone;
    
    /**
     * 用户邮箱
     */
    private String email;

    /**
     * 用户昵称
     */
    private String nickname;

    /**
     * 用户头像
     */
    private String image;

    /**
     * 用户状态
     */
    private String status;

    public String getImage() {
        return StringUtils.isEmpty(image) ? Constants.DEFAULT_ACCOUNT_IMAGE : image;
    }

    public String getNickname() {
        if (StringUtils.isNotEmpty(nickname)) {
            return nickname;
        }

        if (StringUtils.isNotEmpty(realname)) {
            return realname;
        }
        
        if (StringUtils.isNotEmpty(phone)) {
            return phone;
        }
        
        if (StringUtils.isNotEmpty(email)) {
            return email;
        }

        return String.valueOf(id);
    }
}
