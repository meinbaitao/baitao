package com.thinkgem.jeesite.modules.sys.web;

import com.thinkgem.jeesite.common.utils.DESEncryptionUtil;
import com.thinkgem.jeesite.modules.sys.entity.User;
import com.thinkgem.jeesite.modules.sys.security.UsernamePasswordToken;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * author fanjinyuan.
 */
@Controller
public class SSOInterfaceController {

    /**
     * 管理基础路径
     */
    @Value("${adminPath}")
    protected String adminPath;

    @Value("#{APP_PROP['wanfang.des.encryption.key']}")
    private String encryptionKey;



    @RequestMapping(value = "/m/sso/extLogin", method = RequestMethod.GET)
    public String ssoLogin(HttpServletRequest request, HttpServletResponse response, Model model) throws Exception {
        String loginName =request.getParameter("loginName");
        String explainTextLoginName = DESEncryptionUtil.decrypt(loginName, encryptionKey);
        // 校验用户名密码
        User user = UserUtils.getByLoginName(explainTextLoginName);
        if (user != null) {
            //创建Token
            UsernamePasswordToken token =new UsernamePasswordToken(user.getLoginName(), user.getPassword().toCharArray(), false, "", "", false);
            token.setSso(true);
            //获取一个证书实例，将token放入实例中登录
            Subject currentUser = SecurityUtils.getSubject();
            currentUser.login(token);
            return "redirect:" + adminPath;
        }
        model.addAttribute("message", "用户或密码错误, 请重试.");
        return "modules/sys/sysLogin";
    }




}
