package com.web.controller.util;

import java.util.List;

import com.web.controller.entity.User;

public class Page {
	private int total;
	private List<User> rows;
	public int getTotal() {
		return total;
	}
	public List<User> getRows() {
		return rows;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	public void setRows(List<User> rows) {
		this.rows = rows;
	}

}
