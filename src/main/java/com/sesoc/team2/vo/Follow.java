package com.sesoc.team2.vo;

public class Follow {
	private String id;
	private String follow_ing_id;
	private String follow_ed_id;
	
	public Follow () {		
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getFollow_ing_id() {
		return follow_ing_id;
	}

	public void setFollow_ing_id(String follow_ing_id) {
		this.follow_ing_id = follow_ing_id;
	}

	public String getFollow_ed_id() {
		return follow_ed_id;
	}

	public void setFollow_ed_id(String follow_ed_id) {
		this.follow_ed_id = follow_ed_id;
	}

	@Override
	public String toString() {
		return "Follow [id=" + id + ", follow_ing_id=" + follow_ing_id + ", follow_ed_id=" + follow_ed_id + "]";
	}	
}