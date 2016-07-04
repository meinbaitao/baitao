/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.sys.utils;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.UnavailableSecurityManagerException;
import org.apache.shiro.session.InvalidSessionException;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;

import com.bt.modules.person.dao.CommonPersonDao;
import com.bt.modules.person.entity.CommonPerson;
import com.bt.modules.supplier.dao.SupplierDao;
import com.bt.modules.supplier.entity.Supplier;
import com.thinkgem.jeesite.common.service.BaseService;
import com.thinkgem.jeesite.common.utils.CacheUtils;
import com.thinkgem.jeesite.common.utils.SpringContextHolder;
import com.thinkgem.jeesite.modules.sys.dao.AreaDao;
import com.thinkgem.jeesite.modules.sys.dao.MenuDao;
import com.thinkgem.jeesite.modules.sys.dao.OfficeDao;
import com.thinkgem.jeesite.modules.sys.dao.RoleDao;
import com.thinkgem.jeesite.modules.sys.dao.UserDao;
import com.thinkgem.jeesite.modules.sys.entity.Area;
import com.thinkgem.jeesite.modules.sys.entity.Menu;
import com.thinkgem.jeesite.modules.sys.entity.Office;
import com.thinkgem.jeesite.modules.sys.entity.Role;
import com.thinkgem.jeesite.modules.sys.entity.User;
import com.thinkgem.jeesite.modules.sys.security.SystemAuthorizingRealm.Principal;

/**
 * 用户工具类
 * @author ThinkGem
 * @version 2013-12-05
 */
public class UserUtils {

	private static UserDao userDao = SpringContextHolder.getBean(UserDao.class);
	private static RoleDao roleDao = SpringContextHolder.getBean(RoleDao.class);
	private static MenuDao menuDao = SpringContextHolder.getBean(MenuDao.class);
	private static AreaDao areaDao = SpringContextHolder.getBean(AreaDao.class);
	private static OfficeDao officeDao = SpringContextHolder.getBean(OfficeDao.class);
	private static SupplierDao supplierDao = SpringContextHolder.getBean(SupplierDao.class);
	private static CommonPersonDao commonPersonDao = SpringContextHolder.getBean(CommonPersonDao.class);
	

	public static final String USER_CACHE = "userCache";
	public static final String USER_CACHE_ID_ = "id_";
	public static final String USER_CACHE_LOGIN_NAME_ = "ln";
	public static final String USER_CACHE_LIST_BY_OFFICE_ID_ = "oid_";

	public static final String CACHE_ROLE_LIST = "roleList";
	public static final String CACHE_MENU_LIST = "menuList";
	public static final String CACHE_AREA_LIST = "areaList";
	public static final String CACHE_OFFICE_LIST = "officeList";
	public static final String CACHE_OFFICE_ALL_LIST = "officeAllList";
	public static final String CACHE_Supp_Type = "suppType";
	public static final String CACHE_Comm_Person = "commPerson";
	
	public static final String CACHE_SEL_BY_CONDITION = "selByCondition";
	
	
	
	/**
	 * 根据ID获取用户
	 * @param id
	 * @return 取不到返回null
	 */
	public static User get(String id){
		User user = (User)CacheUtils.get(USER_CACHE, USER_CACHE_ID_ + id);
		if (user ==  null){
			user = userDao.get(id);
			if (user == null){
				return null;
			}
			user.setRoleList(roleDao.findList(new Role(user)));
			CacheUtils.put(USER_CACHE, USER_CACHE_ID_ + user.getId(), user);
			CacheUtils.put(USER_CACHE, USER_CACHE_LOGIN_NAME_ + user.getLoginName(), user);
		}
		return user;
	}
	
	/**
	 * 根据ID获取用户
	 * 许俊雄
	 * @param id
	 * @return 取不到返回empty对象 
	 */
	public static User getNotNull(String id){
		User user = (User)CacheUtils.get(USER_CACHE, USER_CACHE_ID_ + id);
		if (user ==  null){
			user = userDao.get(id);
			if (user == null){
				//不返回null对象，避免空指针异常！
				return new User();
			}
			user.setRoleList(roleDao.findList(new Role(user)));
			CacheUtils.put(USER_CACHE, USER_CACHE_ID_ + user.getId(), user);
			CacheUtils.put(USER_CACHE, USER_CACHE_LOGIN_NAME_ + user.getLoginName(), user);
		}
		return user;
	}
	
	/**
	 * 根据登录名获取用户
	 * @param loginName
	 * @return 取不到返回null
	 */
	public static User getByLoginName(String loginName){
		User user = (User)CacheUtils.get(USER_CACHE, USER_CACHE_LOGIN_NAME_ + loginName);
		if (user == null){
			user = userDao.getByLoginName(new User(null, loginName));
			if (user == null){
				return null;
			}
			user.setRoleList(roleDao.findList(new Role(user)));
			CacheUtils.put(USER_CACHE, USER_CACHE_ID_ + user.getId(), user);
			CacheUtils.put(USER_CACHE, USER_CACHE_LOGIN_NAME_ + user.getLoginName(), user);
		}
		return user;
	}
	
	/**
	 * 根据项目id获取质安员
	 * @param loginName
	 * @return 取不到返回null
	 */
	public static User getUserByProjectId(String projectid){
		User user = userDao.getUserByProjectId(projectid);
		if (user == null){
			return null;
		}
		return user;
	}
	
	
	/**
	 * 清除当前用户缓存
	 */
	public static void clearCache(){
		removeCache(CACHE_ROLE_LIST);
		removeCache(CACHE_MENU_LIST);
		removeCache(CACHE_AREA_LIST);
		removeCache(CACHE_OFFICE_LIST);
		removeCache(CACHE_OFFICE_ALL_LIST);
		UserUtils.clearCache(getUser());
	}
	
	/**
	 * 清除指定用户缓存
	 * @param user
	 */
	public static void clearCache(User user){
		CacheUtils.remove(USER_CACHE, USER_CACHE_ID_ + user.getId());
		CacheUtils.remove(USER_CACHE, USER_CACHE_LOGIN_NAME_ + user.getLoginName());
		CacheUtils.remove(USER_CACHE, USER_CACHE_LOGIN_NAME_ + user.getOldLoginName());
		if (user.getOffice() != null && user.getOffice().getId() != null){
			CacheUtils.remove(USER_CACHE, USER_CACHE_LIST_BY_OFFICE_ID_ + user.getOffice().getId());
		}
	}
	
	/**
	 * 获取当前用户
	 * @return 取不到返回 new User()
	 */
	public static User getUser(){
		Principal principal = getPrincipal();
		if (principal!=null){
			User user = get(principal.getId());
			if (user != null){
				return user;
			}
			return new User();
		}
		// 如果没有登录，则返回实例化空的User对象。
		return new User();
	}
	/**
	 * 获取当前用户的Id
	 * @return 取不到返回 “”
	 * xiaocai	2016-4-8
	 */
	public static String getUserId(){
		Principal principal = getPrincipal();
		if (principal!=null){
			User user = get(principal.getId());
			if (user != null){
				return user.getId();
			}
			return "";
		}
		// 如果没有登录，则返回实例化空的User对象。
		return "";
	}

	/**
	 * 获取当前用户角色列表
	 * @return
	 */
	public static List<Role> getRoleList(){
		@SuppressWarnings("unchecked")
		List<Role> roleList = (List<Role>)getCache(CACHE_ROLE_LIST);
		if (roleList == null){
			User user = getUser();
			if (user.isAdmin()){
				roleList = roleDao.findAllList(new Role());
			}else{
				Role role = new Role();
				role.getSqlMap().put("dsf", BaseService.dataScopeFilter(user.getCurrentUser(), "o", "u"));
				roleList = roleDao.findList(role);
			}
			putCache(CACHE_ROLE_LIST, roleList);
		}
		return roleList;
	}
	
	/**
	 * 获取当前用户授权菜单
	 * @return
	 */
	public static List<Menu> getMenuList(){
		@SuppressWarnings("unchecked")
		List<Menu> menuList = (List<Menu>)getCache(CACHE_MENU_LIST);
		if (menuList == null){
			User user = getUser();
			if (user.isAdmin()){
				menuList = menuDao.findAllList(new Menu());
			}else{
				Menu m = new Menu();
				m.setUserId(user.getId());
				menuList = menuDao.findByUserId(m);
			}
			putCache(CACHE_MENU_LIST, menuList);
		}
		return menuList;
	}
	
	/**
	 * 获取当前用户授权的区域
	 * @return
	 */
	public static List<Area> getAreaList(){
		@SuppressWarnings("unchecked")
		List<Area> areaList = (List<Area>)getCache(CACHE_AREA_LIST);
		if (areaList == null){
			areaList = areaDao.findAllList(new Area());
			putCache(CACHE_AREA_LIST, areaList);
		}
		return areaList;
	}
	
	/**
	 * 获取所有部门
	 * @return
	 */
	public static List<Office> findAllOffice(){
		Office office = new Office();
		List<Office> list = officeDao.findAllOffice(office);
		return list;
	}
	
	/**
	 * 获取当前用户有权限访问的部门
	 * @return
	 */
	public static List<Office> getOfficeList(){
		@SuppressWarnings("unchecked")
		List<Office> officeList = (List<Office>)getCache(CACHE_OFFICE_LIST);
		if (officeList == null){
			User user = getUser();
			if (user.isAdmin()){
				officeList = officeDao.findAllList(new Office());
			}else{
				Office office = new Office();
				office.getSqlMap().put("dsf", BaseService.dataScopeFilter(user, "a", ""));
				officeList = officeDao.findList(office);
			}
			putCache(CACHE_OFFICE_LIST, officeList);
		}
		return officeList;
	}

	/**
	 * 获取当前用户有权限访问的部门
	 * @return
	 */
	public static List<Office> getOfficeAllList(){
		@SuppressWarnings("unchecked")
		List<Office> officeList = (List<Office>)getCache(CACHE_OFFICE_ALL_LIST);
		if (officeList == null){
			officeList = officeDao.findAllList(new Office());
		}
		return officeList;
	}
	
	/**
	 * 获取授权主要对象
	 */
	public static Subject getSubject(){
		return SecurityUtils.getSubject();
	}
	
	/**
	 * 获取当前登录者对象
	 */
	public static Principal getPrincipal(){
		try{
			Subject subject = SecurityUtils.getSubject();
			Principal principal = (Principal)subject.getPrincipal();
			if (principal != null){
				return principal;
			}
//			subject.logout();
		}catch (UnavailableSecurityManagerException e) {
			
		}catch (InvalidSessionException e){
			
		}
		return null;
	}
	
	public static Session getSession(){
		try{
			Subject subject = SecurityUtils.getSubject();
			Session session = subject.getSession(false);
			if (session == null){
				session = subject.getSession();
			}
			if (session != null){
				return session;
			}
//			subject.logout();
		}catch (InvalidSessionException e){
			
		}
		return null;
	}
	
	// ============== User Cache ==============
	
	public static Object getCache(String key) {
		return getCache(key, null);
	}
	
	public static Object getCache(String key, Object defaultValue) {
//		Object obj = getCacheMap().get(key);
		Object obj = getSession().getAttribute(key);
		return obj==null?defaultValue:obj;
	}

	public static void putCache(String key, Object value) {
//		getCacheMap().put(key, value);
		getSession().setAttribute(key, value);
	}

	public static void removeCache(String key) {
//		getCacheMap().remove(key);
		getSession().removeAttribute(key);
	}
	
//	public static Map<String, Object> getCacheMap(){
//		Principal principal = getPrincipal();
//		if(principal!=null){
//			return principal.getCacheMap();
//		}
//		return new HashMap<String, Object>();
//	}
	
	/**
	 * 根据角色名称查询人员
	 * @param role
	 * @return
	 */
	public static List<Map<String,Object>> selByCondition(String roleEnname){
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("roleEnname",roleEnname);
		map.put("delFlag",User.DEL_FLAG_NORMAL);
		@SuppressWarnings("unchecked")
		List<Map<String,Object>> roleNameList = (List<Map<String,Object>>)getCache(CACHE_SEL_BY_CONDITION+"_"+roleEnname);
		if(roleNameList ==null){
			roleNameList =userDao.selByCondition(map);
			putCache(CACHE_SEL_BY_CONDITION+"_"+roleEnname, roleNameList);
		}
		return roleNameList;
	}
	
	/**
	 * 根据供应的类型获取供应商的列表数据
	 * @param type
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public static List<Supplier> getSuppByType(String type){
		List<Supplier> listSupp = (List<Supplier>) getCache(CACHE_Supp_Type);
		if(listSupp==null){
			listSupp = supplierDao.getByType(type);
			putCache(CACHE_Supp_Type, listSupp);
		}
		return listSupp;
	}
	
	/**
	 * 获取常用联系地址列表数据
	 * @param commonPerson
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public static List<CommonPerson> getCommPerson(String type) {
		List<CommonPerson> listCP = (List<CommonPerson>) getCache(CACHE_Comm_Person);
		if(listCP==null){
			listCP = commonPersonDao.findList(null);
			putCache(CACHE_Comm_Person, listCP);
		}
		return listCP;
	}
	/**
	 * 判断当前用户是否为送进来的角色		
	 * 是 true	否 false
	 * @param enName 英文名
	 * @return
	 */
//	public static boolean verificationRole(String enName){
//		List<Role> roleList = UserUtils.getUser().getRoleList();
//		//循环验证是否拥有权限
//		for(Role role :roleList){
//			if(role.getEnname().equals(enName))
//				return true;
//		}
//		return false;
//	}
	public static boolean verificationRole(String... enName){
		List<Role> roleList = UserUtils.getUser().getRoleList();
		//循环验证是否拥有权限
		for(String n:enName){
			for(Role role :roleList){
				if(role.getEnname().equals(n))
					return true;
			}
		}
		return false;
	}
	/**
	 * 用于流程用户id参数值
	 * @return
	 */
	public static String getActUserID(){
		return UserUtils.getUser().getLoginName();
	}
	
	public static List<User> findUserByOfficeId(String deptId){
		Office office = new Office();
		office.setId(deptId);
		User user = new  User();
		user.setOffice(office);
		return userDao.findUserByOfficeId(user);
	}
	/**
	 * 根据用户id获取用户信息
	 * @param ids
	 * @return
	 */
	public static String getUserNameById(String ids){
		StringBuffer info = new StringBuffer();
		String [] userId = null;
		if(ids != null){
			if(ids.lastIndexOf(",") != -1){
				userId = ids.split(",");
			}else{
				userId = new String[]{ids};
			}
			if(userId !=null && userId.length>0){
				for(int i=0;i<userId.length;i++){
					User user = userDao.get(userId[i]);
					if(user != null){
						info.append(user.getName()+"-"+user.getPhone()+" ");
					}
				}
			}
		}
		return info.toString();
	}
}
