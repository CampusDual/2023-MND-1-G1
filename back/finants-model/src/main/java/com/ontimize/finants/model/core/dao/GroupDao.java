package com.ontimize.finants.model.core.dao;

import com.ontimize.jee.server.dao.common.ConfigurationFile;
import com.ontimize.jee.server.dao.jdbc.OntimizeJdbcDaoSupport;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Repository;

@Lazy
@Repository("GroupDao")
@ConfigurationFile(configurationFile = "dao/GroupDao.xml", configurationFilePlaceholder = "dao/placeholders.properties")
public class GroupDao extends OntimizeJdbcDaoSupport {
    public static final String ATTR_GR_ID = "GR_ID";
    public static final String ATTR_GR_NAME = "GR_NAME";
    public static final String ATTR_GR_CREATION_DATE = "GR_CREATION_DATE";
}
