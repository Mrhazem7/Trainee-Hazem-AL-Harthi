import java.util.Scanner;
import java.io.PrintStream;
import java.nio.charset.StandardCharsets;

public class Main {
    public static void main(String[] args) {
       
        System.setOut(new PrintStream(System.out, true, StandardCharsets.UTF_8));

        Scanner scanner = new Scanner(System.in);
        Library library = new Library();
        boolean running = true;

        while (running) {
            
            System.out.println("\n===== نظام إدارة مكتبة صغيرة =====");
            System.out.println("1. إضافة كتاب");
            System.out.println("2. عرض كل الكتب");
            System.out.println("3. البحث عن كتاب");
            System.out.println("4. حذف كتاب");
            System.out.println("5. استعارة كتاب");
            System.out.println("6. إرجاع كتاب");
            System.out.println("7. خروج");
            System.out.print("اختر رقم العملية: ");

            try {
                int choice = Integer.parseInt(scanner.nextLine().trim());

                switch (choice) {
                    case 1:
                        System.out.print("أدخل ID الكتاب: ");
                        int id = Integer.parseInt(scanner.nextLine().trim());
                        System.out.print("أدخل عنوان الكتاب: ");
                        String title = scanner.nextLine();
                        System.out.print("أدخل اسم المؤلف: ");
                        String author = scanner.nextLine();
                        library.addBook(new Book(id, title, author));
                        break;

                    case 2:
                        library.viewAllBooks();
                        break;

                    case 3:
                        System.out.print("أدخل عنوان الكتاب اللي تبحث عنه: ");
                        String searchTitle = scanner.nextLine();
                        library.searchBook(searchTitle);
                        break;

                    case 4:
                        System.out.print("أدخل ID الكتاب المراد حذفه: ");
                        int deleteId = Integer.parseInt(scanner.nextLine().trim());
                        library.deleteBook(deleteId);
                        break;

                    case 5:
                        System.out.print("أدخل ID الكتاب المراد استعارته: ");
                        int borrowId = Integer.parseInt(scanner.nextLine().trim());
                        library.borrowBook(borrowId);
                        break;

                    case 6:
                        System.out.print("أدخل ID الكتاب المراد إرجاعه: ");
                        int returnId = Integer.parseInt(scanner.nextLine().trim());
                        library.returnBook(returnId);
                        break;

                    case 7:
                        running = false;
                        System.out.println("تم الخروج من النظام. مع السلامة ");
                        break;

                    default:
                        System.out.println("اختيار غير صحيح، حاول مرة ثانية.");
                }

            } catch (NumberFormatException e) {
                
                System.out.println(" خطأ: لازم تدخل رقم صحيح، حاول مرة ثانية.");
            } catch (Exception e) {
                
                System.out.println(" صار خطأ غير متوقع: " + e.getMessage());
            }
        }

        scanner.close();
    }
}