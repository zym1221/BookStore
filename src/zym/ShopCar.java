package zym;

import java.util.ArrayList;
import zym.Book;

public class ShopCar {
	private ArrayList<Book> buylist = new ArrayList<Book>();
	//private ArrayList buylist = new ArrayList();

	public ArrayList getBuylist() {
		return buylist;
	}

	/*
	 * @功能 向购物车中添加商品
	 * @参数 single为GoodsSingle类对象，封装了要添加的商品信息
	 */
	public void addItem(Book book) {
		if (book != null) {
			if (buylist.size() == 0) { // 如果buylist中不存在任何商品
				Book temp = new Book();
				temp.setBookId(book.getBookId());
				temp.setBookType(book.getBookType());
				temp.setBookName(book.getBookName());
				temp.setBookAuthor(book.getBookAuthor());
				temp.setBookPublish(book.getBookPublish());
				temp.setBookImg(book.getBookImg());
				temp.setBookPrice(book.getBookPrice());
				temp.setBookNum(book.getBookNum());
				buylist.add(temp); // 存储商品
			} else { // 如果buylist中存在商品
				int i = 0;
				for (; i < buylist.size(); i++) { // 遍历buylist集合对象，判断该集合中是否已经存在当前要添加的商品
					Book temp = (Book) buylist.get(i); // 获取buylist集合中当前元素
					if (temp.getBookId().equals(book.getBookId())) { // 判断从buylist集合中获取的当前商品的名称是否与要添加的商品的名称相同
						temp.setBookNum(temp.getBookNum() + 1); // 如果相同，说明已经购买了该商品，只需要将商品的购买数量加1
						break; // 结束for循环
					}
				}
				if (i >= buylist.size()) { // 说明buylist中不存在要添加的商品
					Book temp = new Book();
					temp.setBookId(book.getBookId());
					temp.setBookType(book.getBookType());
					temp.setBookName(book.getBookName());
					temp.setBookAuthor(book.getBookAuthor());
					temp.setBookPublish(book.getBookPublish());
					temp.setBookImg(book.getBookImg());
					temp.setBookPrice(book.getBookPrice());
					temp.setBookNum(book.getBookNum());
					buylist.add(temp); // 存储商品
				}
			}
		}
	}

	/**
	 * @功能 从购物车中移除指定名称的商品
	 * @参数 name表示商品名称
	 */
	public void removeItem(int id) {
		for (int i = 0; i < buylist.size(); i++) { // 遍历buylist集合，查找指定名称的商品
			Book temp = (Book) buylist.get(i); // 获取集合中当前位置的商品
			// 如果商品的名称为name参数指定的名称
			if (temp.getBookId().equals(id)) {
				if (temp.getBookNum() > 1) { // 如果商品的购买数量大于1
					temp.setBookNum(temp.getBookNum() - 1); // 则将购买数量减1
					break; // 结束for循环
				} else if (temp.getBookNum() == 1) { // 如果商品的购买数量为1
					buylist.remove(i); // 从buylist集合对象中移除该商品
				}
			}
		}
	}

	/**
	 * @功能 清空购物车
	 */
	public void clearCar() {
		buylist.clear(); // 清空buylist集合对象
	}
}
