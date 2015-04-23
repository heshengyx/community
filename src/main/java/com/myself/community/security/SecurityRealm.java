package com.myself.community.security;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.apache.commons.lang.builder.ReflectionToStringBuilder;
import org.apache.commons.lang.builder.ToStringStyle;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.CollectionUtils;

import com.myself.community.dao.PermissionDao;
import com.myself.community.dao.RoleDao;
import com.myself.community.dao.UserDao;
import com.myself.community.entity.Permission;
import com.myself.community.entity.Role;
import com.myself.community.entity.User;

public class SecurityRealm extends AuthorizingRealm {

	@Autowired
	private UserDao userDao;
	
	@Autowired
	private RoleDao roleDao;
	
	@Autowired
	private PermissionDao permissionDao;

	/**
	 * Ϊ��ǰ��¼��Subject�����ɫ��Ȩ��
	 * 
	 * @see ������:�����и÷����ĵ���ʱ��Ϊ����Ȩ��Դ������ʱ
	 * @see ������:����ÿ�η�������Ȩ��Դʱ����ִ�и÷����е��߼�,�����������Ĭ�ϲ�δ����AuthorizationCache
	 * @see ���˸о���ʹ����Spring3
	 *      .1��ʼ�ṩ��ConcurrentMapCache֧��,����������Ƿ�����AuthorizationCache
	 * @see ����˵��������ݿ��ȡȨ����Ϣʱ,��ȥ����Spring3.1�ṩ�Ļ���,����ʹ��Shior�ṩ��AuthorizationCache
	 */
	@Override
	protected AuthorizationInfo doGetAuthorizationInfo(
			PrincipalCollection principals) {
		// Ϊ��ǰ�û����ý�ɫ��Ȩ��
		SimpleAuthorizationInfo simpleAuthorInfo = null;
		// ��ȡ��ǰ��¼���û���
		/*String currentUsername = (String) super
				.getAvailablePrincipal(principals);*/
		User user = (User) super
				.getAvailablePrincipal(principals);
		List<String> roleList = new ArrayList<String>();
		List<String> permissionList = new ArrayList<String>();

		//User user = userService.getByUserName(currentUsername);
		if (null != user) {
			List<Role> roles = roleDao.queryRolesByUserId(user.getId());
			// ʵ����User�а������û���ɫ��ʵ������Ϣ
			if (!CollectionUtils.isEmpty(roles)) {
				for (Role role : roles) {
					roleList.add(role.getName());
					List<Permission> permissions = permissionDao.queryPermissionsByRoleId(role.getId());
					if (!CollectionUtils.isEmpty(permissions)) {
						for (Permission permission : permissions) {
							if (!StringUtils.isEmpty(permission.getName())) {
								permissionList.add(permission.getName());
							}
						}
					}
				}
				simpleAuthorInfo = new SimpleAuthorizationInfo();
				simpleAuthorInfo.addRoles(roleList);
				simpleAuthorInfo.addStringPermissions(permissionList);
			}
		}
		return simpleAuthorInfo;
	}

	/**
	 * ��֤��ǰ��¼��Subject
	 * 
	 * @see ������:�����и÷����ĵ���ʱ��ΪLoginController.login()������ִ��Subject.login()ʱ
	 */
	@Override
	protected AuthenticationInfo doGetAuthenticationInfo(
			AuthenticationToken authcToken) throws AuthenticationException {
		AuthenticationInfo authcInfo = null;
		UsernamePasswordToken token = (UsernamePasswordToken) authcToken;
		System.out.println("��֤��ǰSubjectʱ��ȡ��tokenΪ"
				+ ReflectionToStringBuilder.toString(token,
						ToStringStyle.MULTI_LINE_STYLE));
		User user = userDao.getUserByAccount(token.getUsername());
		if (null != user) {
			authcInfo = new SimpleAuthenticationInfo(user,
					user.getPassword(), user.getName());
			this.setSession("currentUser", user);
		}
		return authcInfo;
	}

	private void setSession(Object key, Object value) {
		Subject currentUser = SecurityUtils.getSubject();
		if (null != currentUser) {
			Session session = currentUser.getSession();
			System.out
					.println("SessionĬ�ϳ�ʱʱ��Ϊ[" + session.getTimeout() + "]����");
			if (null != session) {
				session.setAttribute(key, value);
			}
		}
	}
}
