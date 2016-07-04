package com.thinkgem.jeesite.modules.sys.security;

import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.credential.HashedCredentialsMatcher;

/**
 * author fanjinyuan.
 */
public class CustomCredentialsMatcher extends HashedCredentialsMatcher {

    public CustomCredentialsMatcher(String hashAlgorithmName){
        super(hashAlgorithmName);
    }

    @Override
    public boolean doCredentialsMatch(AuthenticationToken authcToken, AuthenticationInfo info) {
        UsernamePasswordToken custoken = (UsernamePasswordToken)authcToken;
        if(custoken.isSso()){
            return true;
        }else{
            return super.doCredentialsMatch(authcToken, info);
        }
    }



}
