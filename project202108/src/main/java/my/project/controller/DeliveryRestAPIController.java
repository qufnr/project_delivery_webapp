package my.project.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import my.project.dto.OrderMenuDto;
import my.project.service.OrderMenuService;

@RestController
public class DeliveryRestAPIController {
	
	@Autowired
	private OrderMenuService orderMenuService;
	
	@RequestMapping(value="/mydelivery/api/GetOrderMenu", method=RequestMethod.GET)
	public Object getOrderMenu(@RequestParam("type") int type) throws Exception {
		List<OrderMenuDto> orderMenu = orderMenuService.selectOrderMenuList(type);
		return orderMenu;
	}
	
	@RequestMapping(value="/mydelivery/api/GetRecommendOrderMenu", method=RequestMethod.GET)
	public Object getRecommendOrderMenu() throws Exception {
		List<OrderMenuDto> orderMenu = orderMenuService.selectRecommendOrderMenuList();
		return orderMenu;
	}
	
	@RequestMapping(value="/mydelivery/api/GetOrderMenuInfo", method=RequestMethod.GET)
	public Object getOrderMenuInfo(@RequestParam("idx") int idx) throws Exception {
		OrderMenuDto orderMenu = orderMenuService.selectOrderMenuInfo(idx);
		return orderMenu;
	}
}
