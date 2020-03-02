package com.youxiu326.dao;

import com.youxiu326.entity.GatewayRoute;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface GatewayRouteMapper {
    int deleteByPrimaryKey(Long id);

    int insert(GatewayRoute record);

    int insertSelective(GatewayRoute record);

    GatewayRoute selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(GatewayRoute record);

    int updateByPrimaryKey(GatewayRoute record);

    List<GatewayRoute> queryAllRoutes();
}