import java.util.ArrayList;

public class Library {
    
    private ArrayList<Book> books;

    
    public Library() {
        books = new ArrayList<Book>();
    }

    
    public void addBook(Book book) {
        books.add(book);
        System.out.println("تمت إضافة الكتاب بنجاح ✅");
    }

   
    public void viewAllBooks() {
        if (books.isEmpty()) {
            System.out.println("لا توجد كتب في المكتبة حاليًا.");
            return;
        }
        System.out.println("---- قائمة الكتب ----");
        for (Book b : books) {
            b.displayInfo();
        }
    }

    
    public void searchBook(String title) {
        boolean found = false;
        for (Book b : books) {
            if (b.getTitle().equalsIgnoreCase(title)) {
                b.displayInfo();
                found = true;
            }
        }
        if (!found) {
            System.out.println("ما لقينا كتاب بهذا العنوان.");
        }
    }

    
    public void deleteBook(int id) {
        Book toRemove = null;
        for (Book b : books) {
            if (b.getId() == id) {
                toRemove = b;
                break;
            }
        }
        if (toRemove != null) {
            books.remove(toRemove);
            System.out.println("تم حذف الكتاب بنجاح 🗑️");
        } else {
            System.out.println("ما لقينا كتاب بهذا الـ ID.");
        }
    }

    public void borrowBook(int id) {
        for (Book b : books) {
            if (b.getId() == id) {
                if (b.isAvailable()) {
                    b.setAvailable(false);
                    System.out.println("تم استعارة الكتاب 📖");
                } else {
                    System.out.println("الكتاب مستعار مسبقًا.");
                }
                return;
            }
        }
        System.out.println("ما لقينا كتاب بهذا الـ ID.");
    }

    public void returnBook(int id) {
        for (Book b : books) {
            if (b.getId() == id) {
                b.setAvailable(true);
                System.out.println("تم إرجاع الكتاب ✅");
                return;
            }
        }
        System.out.println("ما لقينا كتاب بهذا الـ ID.");
    }
}