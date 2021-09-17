package my.project.service;

import java.util.List;

import my.project.dto.OrderMenuDto;

public interface OrderMenuService {
	public List<OrderMenuDto> selectOrderMenuList(int type);
	public List<OrderMenuDto> selectRecommendOrderMenuList();
	public OrderMenuDto selectOrderMenuInfo(int idx);
}
