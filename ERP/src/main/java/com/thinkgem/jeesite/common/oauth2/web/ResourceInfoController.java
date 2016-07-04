/*package com.thinkgem.jeesite.common.oauth2.web;

import java.net.URISyntaxException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.oltu.oauth2.common.OAuth;
import org.apache.oltu.oauth2.common.error.OAuthError;
import org.apache.oltu.oauth2.common.exception.OAuthProblemException;
import org.apache.oltu.oauth2.common.exception.OAuthSystemException;
import org.apache.oltu.oauth2.common.message.OAuthResponse;
import org.apache.oltu.oauth2.common.message.types.ParameterStyle;
import org.apache.oltu.oauth2.common.utils.OAuthUtils;
import org.apache.oltu.oauth2.rs.request.OAuthAccessResourceRequest;
import org.apache.oltu.oauth2.rs.response.OAuthRSResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.oauth2.service.OAuthService;
import com.thinkgem.jeesite.common.web.BaseController;

*//**
 * 资源控制器
 * 
 * @author JunXiongXu
 * @version 2015-07-10
 *//*
@Controller
@RequestMapping(value = "/open")
public class ResourceInfoController extends BaseController {

	@Autowired
	private OAuthService oAuthService;

	@RequestMapping(value = "/resourceInfo")
	public Object resourceInfo(Model model, HttpServletRequest request)
			throws URISyntaxException, OAuthSystemException {

		try {

			// 构建OAuth资源请求
			OAuthAccessResourceRequest oauthRequest = new OAuthAccessResourceRequest(
					request, ParameterStyle.QUERY);
			// 获取Access Token
			String accessToken = oauthRequest.getAccessToken();

			// 验证Access Token
			if (!oAuthService.checkAccessToken(accessToken)) {
				// 如果不存在/过期了，返回未验证错误，需重新验证
				OAuthResponse oauthResponse = OAuthRSResponse
						.errorResponse(HttpServletResponse.SC_UNAUTHORIZED)
						.setRealm(Global.getConfig("oauth2.serverName"))
						.setError(OAuthError.ResourceResponse.INVALID_TOKEN)
						.buildHeaderMessage();

				HttpHeaders headers = new HttpHeaders();
				headers.add(OAuth.HeaderType.WWW_AUTHENTICATE, oauthResponse
						.getHeader(OAuth.HeaderType.WWW_AUTHENTICATE));
				return new ResponseEntity<String>(headers,
						HttpStatus.UNAUTHORIZED);
			}
			// 返回用户名
			String username = oAuthService
					.getUsernameByAccessToken(accessToken);
			return new ResponseEntity<String>(username, HttpStatus.OK);
		} catch (OAuthProblemException e) {
			// 检查是否设置了错误码
			String errorCode = e.getError();
			if (OAuthUtils.isEmpty(errorCode)) {
				OAuthResponse oauthResponse = OAuthRSResponse
						.errorResponse(HttpServletResponse.SC_UNAUTHORIZED)
						.setRealm(Global.getConfig("oauth2.serverName"))
						.buildHeaderMessage();

				HttpHeaders headers = new HttpHeaders();
				headers.add(OAuth.HeaderType.WWW_AUTHENTICATE, oauthResponse
						.getHeader(OAuth.HeaderType.WWW_AUTHENTICATE));
				return new ResponseEntity<String>(headers,
						HttpStatus.UNAUTHORIZED);
			}

			OAuthResponse oauthResponse = OAuthRSResponse
					.errorResponse(HttpServletResponse.SC_UNAUTHORIZED)
					.setRealm(Global.getConfig("oauth2.serverName"))
					.setError(e.getError())
					.setErrorDescription(e.getDescription())
					.setErrorUri(e.getUri()).buildHeaderMessage();

			HttpHeaders headers = new HttpHeaders();
			headers.add(OAuth.HeaderType.WWW_AUTHENTICATE,
					oauthResponse.getHeader(OAuth.HeaderType.WWW_AUTHENTICATE));
			return new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
		}
	}

}
*/