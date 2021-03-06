--
-- 表的结构 `t_tgks_cgms_lovelive`
--
DROP TABLE IF EXISTS `t_tgks_cgms_lovelive`;
CREATE TABLE IF NOT EXISTS `t_tgks_cgms_lovelive` (
  `id` varchar(30) NOT NULL COMMENT '表唯一主键',
  `cardid` varchar(30) NOT NULL COMMENT '卡牌ID',
  `girl` varchar(30) default NULL COMMENT '角色',
  `rarity` varchar(30) default NULL COMMENT '稀有度（r sr ur）',
  `type` varchar(30) default NULL COMMENT '类型（smile pure cool all）',
  `imageurl` varchar(200) default NULL COMMENT '图片URL',
  `imageturl` varchar(200) default NULL COMMENT '外网小图URL',
  `maxlevel` varchar(10) default NULL COMMENT '最大等级',
  `minhp` varchar(10) default NULL COMMENT '一级HP',
  `minsmile` varchar(10) default NULL COMMENT '一级Smile',
  `minpure` varchar(10) default NULL COMMENT '一级Pure',
  `mincool` varchar(10) default NULL COMMENT '一级Cool',
  `maxhp` varchar(10) default NULL COMMENT '满级HP',
  `maxsmile` varchar(10) default NULL COMMENT '满级Smile',
  `maxpure` varchar(10) default NULL COMMENT '满级Pure',
  `maxcool` varchar(10) default NULL COMMENT '满级Cool',
  `appeal` varchar(30) default NULL COMMENT '特效',
  `appealinfo` varchar(200) default NULL COMMENT '特效描述',
  `centerskill` varchar(30) default NULL COMMENT 'Center技能',
  `centerskillinfo` varchar(200) default NULL COMMENT 'Center技能描述',
  `createtime` timestamp NOT NULL default CURRENT_TIMESTAMP COMMENT '创建时间',
  `remark` varchar(500) default NULL COMMENT '备注',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `cardid` (`cardid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Lovelive卡牌信息表';



--
-- 表的结构 `t_tgks_cgms_cardorder`
--
DROP TABLE IF EXISTS `t_tgks_cgms_cardorder`;
CREATE TABLE IF NOT EXISTS `t_tgks_cgms_cardorder` (
  `id` varchar(30) NOT NULL COMMENT '表唯一主键',
  `uid` varchar(30) NOT NULL COMMENT '用户ID',
  `username` varchar(30) NOT NULL COMMENT '用户名',
  `alww` varchar(30) NOT NULL COMMENT '旺旺ID',
  `type` varchar(3) NOT NULL COMMENT '订单类型（1 LoveLive；2 KSSMA）',
  `status` varchar(3) NOT NULL COMMENT '状态（0 预定；1 完成）',
  `cardid` varchar(5000) default NULL COMMENT '卡片ID',
  `createtime` timestamp NOT NULL default CURRENT_TIMESTAMP COMMENT '创建时间',
  `remark` varchar(500) default NULL COMMENT '备注',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='卡牌订单表';



--
-- 表的结构 `t_tgks_cgms_kssma`
--
DROP TABLE IF EXISTS `t_tgks_cgms_kssma`;
CREATE TABLE IF NOT EXISTS `t_tgks_cgms_kssma` (
  `id` varchar(30) NOT NULL COMMENT '表唯一主键',
  `cardid` varchar(30) NOT NULL COMMENT '卡牌ID',
  `name` varchar(100) default NULL COMMENT '名字',
  `rarity` varchar(30) default NULL COMMENT '稀有度',
  `type` varchar(30) default NULL COMMENT '类型（1 剑术之城；2 技巧之场；3 魔法之派；4 妖精）',
  `imageurl` varchar(200) default NULL COMMENT '图片URL',
  `imageturl` varchar(200) default NULL COMMENT '外网小图URL',
  `createtime` timestamp NOT NULL default CURRENT_TIMESTAMP COMMENT '创建时间',
  `remark` varchar(500) default NULL COMMENT '备注',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `cardid` (`cardid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='扩散性MA卡牌信息表';