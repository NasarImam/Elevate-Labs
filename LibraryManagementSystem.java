import java.util.ArrayList;
import java.util.Scanner;

// Book class
class Book {
    private int id;
    private String title;
    private String author;
    private boolean isIssued;

    public Book(int id, String title, String author) {
        this.id = id;
        this.title = title;
        this.author = author;
        this.isIssued = false;
    }

    public int getId() { return id; }
    public String getTitle() { return title; }
    public String getAuthor() { return author; }
    public boolean isIssued() { return isIssued; }
    public void setIssued(boolean issued) { isIssued = issued; }

    @Override
    public String toString() {
        return "ID: " + id + " | Title: " + title + " | Author: " + author + " | Issued: " + isIssued;
    }
}

// User class
class User {
    private int id;
    private String name;
    private ArrayList<Book> issuedBooks;

    public User(int id, String name) {
        this.id = id;
        this.name = name;
        this.issuedBooks = new ArrayList<>();
    }

    public int getId() { return id; }
    public String getName() { return name; }
    public ArrayList<Book> getIssuedBooks() { return issuedBooks; }

    public void issueBook(Book book) { issuedBooks.add(book); }
    public void returnBook(Book book) { issuedBooks.remove(book); }

    @Override
    public String toString() {
        return "ID: " + id + " | Name: " + name + " | Issued Books: " + issuedBooks.size();
    }
}

// Library class
class Library {
    private ArrayList<Book> books;
    private ArrayList<User> users;

    public Library() {
        books = new ArrayList<>();
        users = new ArrayList<>();
    }

    public void addBook(Book book) { books.add(book); }
    public void addUser(User user) { users.add(user); }

    public Book findBook(int id) {
        for (Book b : books) if (b.getId() == id) return b;
        return null;
    }

    public User findUser(int id) {
        for (User u : users) if (u.getId() == id) return u;
        return null;
    }

    public void issueBook(int userId, int bookId) {
        User user = findUser(userId);
        Book book = findBook(bookId);
        if (user != null && book != null && !book.isIssued()) {
            book.setIssued(true);
            user.issueBook(book);
            System.out.println("Book issued successfully.");
        } else {
            System.out.println("Cannot issue book. Check user/book ID or availability.");
        }
    }

    public void returnBook(int userId, int bookId) {
        User user = findUser(userId);
        Book book = findBook(bookId);
        if (user != null && book != null && book.isIssued()) {
            book.setIssued(false);
            user.returnBook(book);
            System.out.println("Book returned successfully.");
        } else {
            System.out.println("Cannot return book. Check user/book ID.");
        }
    }

    public void viewBooks() {
        if (books.isEmpty()) System.out.println("No books found.");
        else books.forEach(System.out::println);
    }

    public void viewUsers() {
        if (users.isEmpty()) System.out.println("No users found.");
        else users.forEach(System.out::println);
    }
}

// Main class
public class LibraryManagementSystem {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        Library library = new Library();

        while (true) {
            System.out.println("\n--- Library Management ---");
            System.out.println("1. Add Book");
            System.out.println("2. Add User");
            System.out.println("3. Issue Book");
            System.out.println("4. Return Book");
            System.out.println("5. View Books");
            System.out.println("6. View Users");
            System.out.println("7. Exit");
            System.out.print("Enter choice: ");
            int choice = sc.nextInt();

            switch (choice) {
                case 1:
                    System.out.print("Book ID: "); int bid = sc.nextInt(); sc.nextLine();
                    System.out.print("Title: "); String title = sc.nextLine();
                    System.out.print("Author: "); String author = sc.nextLine();
                    library.addBook(new Book(bid, title, author));
                    System.out.println("Book added successfully.");
                    break;
                case 2:
                    System.out.print("User ID: "); int uid = sc.nextInt(); sc.nextLine();
                    System.out.print("Name: "); String uname = sc.nextLine();
                    library.addUser(new User(uid, uname));
                    System.out.println("User added successfully.");
                    break;
                case 3:
                    System.out.print("User ID: "); int uIdIssue = sc.nextInt();
                    System.out.print("Book ID: "); int bIdIssue = sc.nextInt();
                    library.issueBook(uIdIssue, bIdIssue);
                    break;
                case 4:
                    System.out.print("User ID: "); int uIdReturn = sc.nextInt();
                    System.out.print("Book ID: "); int bIdReturn = sc.nextInt();
                    library.returnBook(uIdReturn, bIdReturn);
                    break;
                case 5:
                    library.viewBooks();
                    break;
                case 6:
                    library.viewUsers();
                    break;
                case 7:
                    System.out.println("Exiting...");
                    return;
                default:
                    System.out.println("Invalid choice. Try again.");
            }
        }
    }
}
