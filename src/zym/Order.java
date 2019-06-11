package zym;

public class Order {
	public Order(Integer orderId, Integer bookId, String name, String address, String salesDate, String express,
			Double total, String status, String telephone) {
		super();
		this.orderId = orderId;
		this.bookId = bookId;
		this.name = name;
		this.address = address;
		SalesDate = salesDate;
		this.express = express;
		this.total = total;
		this.status = status;
		this.telephone = telephone;
	}

	public Order() {
		super();
		// TODO Auto-generated constructor stub
	}
	private Integer orderId;
	private Integer bookId;
    private String name;
    private String address;
    private String SalesDate;
    private String express;
    private Double total;
    private String status;
    private String telephone;
	public Integer getOrderId() {
		return orderId;
	}
	public void setOrderId(Integer orderId) {
		this.orderId = orderId;
	}
	public Integer getBookId() {
		return bookId;
	}
	public void setBookId(Integer bookId) {
		this.bookId = bookId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getSalesDate() {
		return SalesDate;
	}
	public void setSalesDate(String salesDate) {
		SalesDate = salesDate;
	}
	public String getExpress() {
		return express;
	}
	public void setExpress(String express) {
		this.express = express;
	}
	public Double getTotal() {
		return total;
	}
	public void setTotal(Double total) {
		this.total = total;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getTelephone() {
		return telephone;
	}
	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}

}
