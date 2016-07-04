/*package com.thinkgem.jeesite.common.oauth2.web;

import java.net.URI;
import java.net.URISyntaxException;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.oltu.oauth2.as.issuer.MD5Generator;
import org.apache.oltu.oauth2.as.issuer.OAuthIssuerImpl;
import org.apache.oltu.oauth2.as.request.OAuthAuthzRequest;
import org.apache.oltu.oauth2.as.response.OAuthASResponse;
import org.apache.oltu.oauth2.common.OAuth;
import org.apache.oltu.oauth2.common.error.OAuthError;
import org.apache.oltu.oauth2.common.exception.OAuthProblemException;
import org.apache.oltu.oauth2.common.exception.OAuthSystemException;
import org.apache.oltu.oauth2.common.message.OAuthResponse;
import org.apache.oltu.oauth2.common.message.types.ResponseType;
import org.apache.oltu.oauth2.common.utils.OAuthUtils;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.subject.Subject;
import org.apache.shiro.web.util.WebUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.google.common.collect.Maps;
import com.thinkgem.jeesite.common.oauth2.service.ClientService;
import com.thinkgem.jeesite.common.oauth2.service.OAuthService;
import com.thinkgem.jeesite.common.utils.CacheUtils;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.modules.sys.security.FormAuthenticationFilter;
import com.thinkgem.jeesite.modules.sys.security.UsernamePasswordToken;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;

*//**
 * 授权控制器
 * 
 * @author JunXiongXu
 * @version 2015-07-08
 *//*
@Controller
@RequestMapping(value = "/open")
public class AuthorizeController extends BaseController {

	@Autowired
	private OAuthService oAuthService;

	@Autowired
	private ClientService clientService;

	@RequestMapping(value = "/authorize")
	public Object authorize(Model model, HttpServletRequest request)
			throws URISyntaxException, OAuthSystemException {

		try {
			// 构建OAuth 授权请求
			OAuthAuthzRequest oauthRequest = new OAuthAuthzRequest(request);

			// 检查传入的客户端id是否正确
			if (!oAuthService.checkClientId(oauthRequest.getClientId())) {
				OAuthResponse response = OAuthASResponse
						.errorResponse(HttpServletResponse.SC_BAD_REQUEST)
						.setError(OAuthError.TokenResponse.INVALID_CLIENT)
						.setErrorDescription(
								"客户端验证失败，如错误的client_id/client_secret。")
						.buildJSONMessage();
				return new ResponseEntity<String>(response.getBody(),
						HttpStatus.valueOf(response.getResponseStatus()));
			}

			Subject subject = UserUtils.getSubject();
			// 如果用户没有登录，跳转到登陆页面
			if (!subject.isAuthenticated()) {
				if (!login(model, subject, request)) {
					model.addAttribute("client", clientService
							.findByClientId(oauthRequest.getClientId()));
					// 跳转到系统登录页面
					return "modules/oauth2/oauth2Login";
				}
			}
			String username = UserUtils.getPrincipal().getLoginName();

			// 通过用户ID和应用ID去查询是否 该应用已经授权给该用户
			String clientId = oAuthService.getIdByClientId(oauthRequest
					.getClientId());
			String userId = UserUtils.getPrincipal().getId();

			// 未授权，提示无权限访问该应用，调回登陆页面
			if (!oAuthService.checkClientAuthorization(clientId, userId)) {
				String message = String.format("对不起！用户%s无权访问系统%s", username,
						clientService
								.findByClientId(oauthRequest.getClientId())
								.getClientName());
				model.addAttribute("client", clientService
						.findByClientId(oauthRequest.getClientId()));
				model.addAttribute(
						FormAuthenticationFilter.DEFAULT_MESSAGE_PARAM, message);
				// 跳转到系统登录页面
				return "modules/oauth2/oauth2Login";
			}
			;

			// 生成授权码
			String authorizationCode = null;
			// responseType目前仅支持CODE，另外还有TOKEN
			String responseType = oauthRequest
					.getParam(OAuth.OAUTH_RESPONSE_TYPE);
			if (responseType.equals(ResponseType.CODE.toString())) {
				OAuthIssuerImpl oauthIssuerImpl = new OAuthIssuerImpl(
						new MD5Generator());
				authorizationCode = oauthIssuerImpl.authorizationCode();
				oAuthService.addAuthCode(authorizationCode, username);
			}

			// 进行OAuth响应构建
			OAuthASResponse.OAuthAuthorizationResponseBuilder builder = OAuthASResponse
					.authorizationResponse(request,
							HttpServletResponse.SC_FOUND);
			// 设置授权码
			builder.setCode(authorizationCode);
			// 得到到客户端重定向地址
			String redirectURI = oauthRequest
					.getParam(OAuth.OAUTH_REDIRECT_URI);

			// 构建响应
			final OAuthResponse response = builder.location(redirectURI)
					.buildQueryMessage();

			// 根据OAuthResponse返回ResponseEntity响应
			HttpHeaders headers = new HttpHeaders();
			headers.setLocation(new URI(response.getLocationUri()));
			return new ResponseEntity<String>(headers,
					HttpStatus.valueOf(response.getResponseStatus()));

		} catch (OAuthProblemException e) {
			// 出错处理
			String redirectUri = e.getRedirectUri();
			if (OAuthUtils.isEmpty(redirectUri)) {
				// 告诉客户端没有传入redirectUri直接报错
				return new ResponseEntity<String>(
						"OAuth callback url needs to be provided by client!!!",
						HttpStatus.NOT_FOUND);
			}

			// 返回错误消息（如?error=）
			final OAuthResponse response = OAuthASResponse
					.errorResponse(HttpServletResponse.SC_FOUND).error(e)
					.location(redirectUri).buildQueryMessage();
			HttpHeaders headers = new HttpHeaders();
			headers.setLocation(new URI(response.getLocationUri()));
			return new ResponseEntity<String>(headers,
					HttpStatus.valueOf(response.getResponseStatus()));
		}
	}

	private boolean login(Model model, Subject subject,
			HttpServletRequest request) {
		if ("get".equalsIgnoreCase(request.getMethod())) {
			return false;
		}
		String username = request.getParameter("username");
		String password = request.getParameter("password");

		boolean rememberMe = false;
		String host = StringUtils.getRemoteAddr((HttpServletRequest) request);
		// 验证码
		String captcha = WebUtils.getCleanParam(request,
				FormAuthenticationFilter.DEFAULT_CAPTCHA_PARAM);
		boolean mobile = WebUtils.isTrue(request, "mobileLogin");
		// 构建本系统的UsernamePasswordToken
		UsernamePasswordToken token = new UsernamePasswordToken(username,
				password.toCharArray(), rememberMe, host, captcha, mobile);

		try {
			subject.login(token);
			return true;
		} catch (Exception e) {
			String message = "";
			if (e instanceof IncorrectCredentialsException
					|| e instanceof UnknownAccountException) {
				model.addAttribute("isValidateCodeLogin",
						isValidateCodeLogin(username, true, false));
				message = "用户或密码错误, 请重试.";
			} else if (e.getMessage() != null
					&& StringUtils.startsWith(e.getMessage(), "msg:")) {
				message = StringUtils.replace(e.getMessage(), "msg:", "");
			} else {
				message = "系统出错，请稍后再试！";
				e.printStackTrace(); // 输出到控制台
			}
			model.addAttribute(FormAuthenticationFilter.DEFAULT_MESSAGE_PARAM,
					message);
			return false;
		}
	}

	*//**
	 * 是否是验证码登录
	 * 
	 * @param useruame
	 *            用户名
	 * @param isFail
	 *            计数加1
	 * @param clean
	 *            计数清零
	 * @return
	 *//*
	@SuppressWarnings("unchecked")
	public static boolean isValidateCodeLogin(String useruame, boolean isFail,
			boolean clean) {
		Map<String, Integer> loginFailMap = (Map<String, Integer>) CacheUtils
				.get("loginFailMap");
		if (loginFailMap == null) {
			loginFailMap = Maps.newHashMap();
			CacheUtils.put("loginFailMap", loginFailMap);
		}
		Integer loginFailNum = loginFailMap.get(useruame);
		if (loginFailNum == null) {
			loginFailNum = 0;
		}
		if (isFail) {
			loginFailNum++;
			loginFailMap.put(useruame, loginFailNum);
		}
		if (clean) {
			loginFailMap.remove(useruame);
		}
		return loginFailNum >= 3;
	}
}
*/