package com.hzyc.intstudio.dao;

import java.util.List;

import com.hzyc.intstudio.entity.Orders;

public interface OrdersMapper {
    int insert(Orders record);

    int insertSelective(Orders record);
    
    List<Orders> queryAll(String uid,String status);
}