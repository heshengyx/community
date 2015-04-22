package com.myself.community.security;

import java.text.MessageFormat;
import java.util.Iterator;
import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.apache.shiro.config.Ini;
import org.apache.shiro.config.Ini.Section;
import org.springframework.beans.factory.FactoryBean;
import org.springframework.beans.factory.annotation.Autowired;

import com.my.shiro.dao.ResourceDao;
import com.myself.community.entity.Resource;

public class ChainDefinitionSectionMetaSource implements
		FactoryBean<Ini.Section> {

	@Autowired  
    private ResourceDao resourceDao;
	
	private String filterChainDefinitions;

	/**
	 * 默认premission字符串
	 */
	public static final String PREMISSION_STRING = "perms[\"{0}\"]";

	/**
	 * 通过filterChainDefinitions对默认的url过滤定义
	 * 
	 * @param filterChainDefinitions
	 *            默认的url过滤定义
	 */
	public void setFilterChainDefinitions(String filterChainDefinitions) {
		this.filterChainDefinitions = filterChainDefinitions;
	}

	public Section getObject() throws Exception {
		//获取所有Resource  
        List<Resource> list = resourceDao.getResources();  
  
        Ini ini = new Ini();  
        //加载默认的url  
        ini.load(filterChainDefinitions);  
        Ini.Section section = ini.getSection(Ini.DEFAULT_SECTION_NAME);  
        //循环Resource的url,逐个添加到section中。section就是filterChainDefinitionMap,  
        //里面的键就是链接URL,值就是存在什么条件才能访问该链接  
        for (Iterator<Resource> it = list.iterator(); it.hasNext();) {  
  
            Resource resource = it.next();  
            //如果不为空值添加到section中  
            if(StringUtils.isNotEmpty(resource.getValue()) && StringUtils.isNotEmpty(resource.getPermission())) {  
                section.put(resource.getValue(),  MessageFormat.format(PREMISSION_STRING,resource.getPermission()));  
            }
        }
		return section;
	}

	public Class<?> getObjectType() {
		return this.getClass();
	}

	public boolean isSingleton() {
		return false;
	}

}
