package com.hzyc.intstudio.entity;

/**
 * @author asus
 *
 */
public class Orders {
    private String id;

    private String userid;

    private String stockid;

    private String amount;

    private String times;

    private String total;

    private String price;

    private String status;

    private Users users;

    private String name;
	public Users getUsers() {
		return users;
	}

	public void setUsers(Users users) {
		this.users = users;
	}

	public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id == null ? null : id.trim();
    }

    public String getUserid() {
        return userid;
    }

    public void setUserid(String userid) {
        this.userid = userid == null ? null : userid.trim();
    }


    public String getStockid() {
		return stockid;
	}

	public void setStockid(String stockid) {
		this.stockid = stockid;
	}

	public String getAmount() {
        return amount;
    }

    public void setAmount(String amount) {
        this.amount = amount == null ? null : amount.trim();
    }

    public String getTimes() {
        return times;
    }

    public void setTimes(String times) {
        this.times = times == null ? null : times.trim();
    }

	public String getTotal() {
		return total;
	}

	public void setTotal(String total) {
		this.total = total;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

}