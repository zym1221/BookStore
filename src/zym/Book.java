package zym;

import java.util.ArrayList;

public class Book {
  

	public Book(Integer bookId, String bookName, String bookType, String bookAuthor, String bookPublish,
			Integer bookCount, String bookImg, Double bookPrice, String bookInfo) {
		super();
		this.bookId = bookId;
		this.bookName = bookName;
		this.bookType = bookType;
		this.bookAuthor = bookAuthor;
		this.bookPublish = bookPublish;
		this.bookCount = bookCount;
		this.bookImg = bookImg;
		this.bookPrice = bookPrice;
		this.bookInfo = bookInfo;
	}

	public Book() {
		super();
		// TODO Auto-generated constructor stub
	}

	private Integer bookId;
    private String bookName;
    private String bookType;
    private String bookAuthor;
    private String bookPublish;
    private Integer bookCount;
    private String bookImg;
    private Double bookPrice;
    private String bookInfo;
    private int bookNum;
    
    public Integer getBookId() {
		return bookId;
	}

	public void setBookId(Integer bookId) {
		this.bookId = bookId;
	}

	public String getBookName() {
		return bookName;
	}

	public void setBookName(String bookName) {
		this.bookName = bookName;
	}

	public String getBookType() {
		return bookType;
	}

	public void setBookType(String bookType) {
		this.bookType = bookType;
	}

	public String getBookAuthor() {
		return bookAuthor;
	}

	public void setBookAuthor(String bookAuthor) {
		this.bookAuthor = bookAuthor;
	}

	public String getBookPublish() {
		return bookPublish;
	}

	public void setBookPublish(String bookPublish) {
		this.bookPublish = bookPublish;
	}

	public Integer getBookCount() {
		return bookCount;
	}

	public void setBookCount(Integer bookCount) {
		this.bookCount = bookCount;
	}

	public String getBookImg() {
		return bookImg;
	}

	public void setBookImg(String bookImg) {
		this.bookImg = bookImg;
	}

	public Double getBookPrice() {
		return bookPrice;
	}

	public void setBookPrice(Double bookPrice) {
		this.bookPrice = bookPrice;
	}
	
	

	@Override
	public String toString() {
		return "Book [bookId=" + bookId + ", bookName=" + bookName + ", bookType=" + bookType + ", bookAuthor="
				+ bookAuthor + ", bookPublish=" + bookPublish + ", bookCount=" + bookCount + ", bookImg=" + bookImg
				+ ", bookPrice=" + bookPrice + ", bookInfo=" + bookInfo + "]";
	}



	public String getBookInfo() {
		return bookInfo;
	}

	public void setBookInfo(String bookInfo) {
		this.bookInfo = bookInfo;
	}

	public int getBookNum() {
		return bookNum;
	}

	public void setBookNum(int bookNum) {
		this.bookNum = bookNum;
	}
	private ArrayList<Book> booksList = new ArrayList<Book>();

    public ArrayList<Book> getBookList(){
        return this.booksList;
    }
    public Book findBook(int i) {
        return booksList.get(i);
    }
    public void addBooks(Book bk) {
        this.booksList.add(bk);
    }
    public void removeBoks(Book bk) {
        int index = booksList.indexOf(bk);
        this.booksList.remove(index);
    }
    public void clearBooks() {
        this.booksList.clear();
    }
 
    
 

	
}

