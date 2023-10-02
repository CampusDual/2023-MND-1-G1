package com.ontimize.finants.model.core.dao;

import com.ontimize.jee.server.dao.common.ConfigurationFile;
import com.ontimize.jee.server.dao.jdbc.OntimizeJdbcDaoSupport;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Repository;

@Lazy
@Repository("ExpenseDao")
@ConfigurationFile(configurationFile = "dao/ExpenseDao.xml", configurationFilePlaceholder = "dao/placeholders.properties")
public class ExpenseDao extends OntimizeJdbcDaoSupport {

    public static final String ATTR_EX_ID = "EX_ID";
    public static final String ATTR_EX_CONCEPT = "EX_CONCEPT";
    public static final String ATTR_EX_AMOUNT = "EX_AMOUNT";
    public static final String ATTR_EX_DATE = "EX_DATE";
    public static final String ATTR_CA_EX_ID = "CA_EX_ID";
}