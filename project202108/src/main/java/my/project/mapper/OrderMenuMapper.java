package my.project.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import my.project.dto.OrderMenuDto;

@Mapper
public interface OrderMenuMapper {
	public List<OrderMenuDto> selectOrderMenuList(int type);
	public List<OrderMenuDto> selectRecommendOrderMenuList();
	public OrderMenuDto selectOrderMenuInfo(int idx);
}
