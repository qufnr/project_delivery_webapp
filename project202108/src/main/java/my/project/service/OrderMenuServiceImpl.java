package my.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import my.project.dto.OrderMenuDto;
import my.project.mapper.OrderMenuMapper;

@Service
public class OrderMenuServiceImpl implements OrderMenuService {

	@Autowired
	private OrderMenuMapper orderMenuMapper;
	
	@Override
	public List<OrderMenuDto> selectOrderMenuList(int type) {
		return orderMenuMapper.selectOrderMenuList(type);
	}

	@Override
	public List<OrderMenuDto> selectRecommendOrderMenuList() {
		return orderMenuMapper.selectRecommendOrderMenuList();
	}
	
	@Override
	public OrderMenuDto selectOrderMenuInfo(int idx) {
		return orderMenuMapper.selectOrderMenuInfo(idx);
	}
	
}
