package com.moemao.tgks.cgms.kssma.entity;

public class KssmaReq extends KssmaEvt
{

/**
 * 排序字段
 */
private String sortSql;

/**
 * @return 返回 排序字段
 */
public String getSortSql()
{
    return this.sortSql;
}

/**
 * @param 对排序字段进行赋值
 */
public void setSortSql(String sortSql)
{
    this.sortSql = sortSql;
}

}