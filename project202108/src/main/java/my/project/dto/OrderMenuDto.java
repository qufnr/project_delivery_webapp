package my.project.dto;

import lombok.Data;

@Data
public class OrderMenuDto {
	private int idx;
	private int type;
	private String name;
	private String description;
	private String image;
	private int price;
	private String nutrientInfo;
	private String allergieInfo;
	private int kcal;
	private int isRecommend;
}
