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
	 * @���� ���ﳵ�������Ʒ
	 * @���� singleΪGoodsSingle����󣬷�װ��Ҫ��ӵ���Ʒ��Ϣ
	 */
	public void addItem(Book book) {
		if (book != null) {
			if (buylist.size() == 0) { // ���buylist�в������κ���Ʒ
				Book temp = new Book();
				temp.setBookId(book.getBookId());
				temp.setBookType(book.getBookType());
				temp.setBookName(book.getBookName());
				temp.setBookAuthor(book.getBookAuthor());
				temp.setBookPublish(book.getBookPublish());
				temp.setBookImg(book.getBookImg());
				temp.setBookPrice(book.getBookPrice());
				temp.setBookNum(book.getBookNum());
				buylist.add(temp); // �洢��Ʒ
			} else { // ���buylist�д�����Ʒ
				int i = 0;
				for (; i < buylist.size(); i++) { // ����buylist���϶����жϸü������Ƿ��Ѿ����ڵ�ǰҪ��ӵ���Ʒ
					Book temp = (Book) buylist.get(i); // ��ȡbuylist�����е�ǰԪ��
					if (temp.getBookId().equals(book.getBookId())) { // �жϴ�buylist�����л�ȡ�ĵ�ǰ��Ʒ�������Ƿ���Ҫ��ӵ���Ʒ��������ͬ
						temp.setBookNum(temp.getBookNum() + 1); // �����ͬ��˵���Ѿ������˸���Ʒ��ֻ��Ҫ����Ʒ�Ĺ���������1
						break; // ����forѭ��
					}
				}
				if (i >= buylist.size()) { // ˵��buylist�в�����Ҫ��ӵ���Ʒ
					Book temp = new Book();
					temp.setBookId(book.getBookId());
					temp.setBookType(book.getBookType());
					temp.setBookName(book.getBookName());
					temp.setBookAuthor(book.getBookAuthor());
					temp.setBookPublish(book.getBookPublish());
					temp.setBookImg(book.getBookImg());
					temp.setBookPrice(book.getBookPrice());
					temp.setBookNum(book.getBookNum());
					buylist.add(temp); // �洢��Ʒ
				}
			}
		}
	}

	/**
	 * @���� �ӹ��ﳵ���Ƴ�ָ�����Ƶ���Ʒ
	 * @���� name��ʾ��Ʒ����
	 */
	public void removeItem(int id) {
		for (int i = 0; i < buylist.size(); i++) { // ����buylist���ϣ�����ָ�����Ƶ���Ʒ
			Book temp = (Book) buylist.get(i); // ��ȡ�����е�ǰλ�õ���Ʒ
			// �����Ʒ������Ϊname����ָ��������
			if (temp.getBookId().equals(id)) {
				if (temp.getBookNum() > 1) { // �����Ʒ�Ĺ�����������1
					temp.setBookNum(temp.getBookNum() - 1); // �򽫹���������1
					break; // ����forѭ��
				} else if (temp.getBookNum() == 1) { // �����Ʒ�Ĺ�������Ϊ1
					buylist.remove(i); // ��buylist���϶������Ƴ�����Ʒ
				}
			}
		}
	}

	/**
	 * @���� ��չ��ﳵ
	 */
	public void clearCar() {
		buylist.clear(); // ���buylist���϶���
	}
}
