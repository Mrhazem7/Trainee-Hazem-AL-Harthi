public class App {
    static String[] names = new String[15];
    static double[] grades = new double[15];
    static int studentCount = 0;

    public static void addStudent(String name, double grade) {
        names[studentCount] = name;
        grades[studentCount] = grade;
        studentCount++;
    }

    public static double calculateAverage() {
        try {
            if (studentCount == 0) {
                throw new ArithmeticException("لا يوجد طلاب لحساب المتوسط");
            }
            double total = 0;
            for (int i = 0; i < studentCount; i++) {
                total = total + grades[i];
            }
            return total / studentCount;
        } catch (ArithmeticException e) {
            System.out.println("خطأ: " + e.getMessage());
            return 0;
        }
    }

    public static void displayStudents() {
        for (int i = 0; i < studentCount; i++) {
            System.out.println(names[i] + " " + grades[i]);
        }
    }

    public static void main(String[] args) {
        addStudent("sultan", 91.5);
        addStudent("hazem", 95);
        addStudent("ali", 81.5);
        System.out.println(studentCount);

        displayStudents();

        System.out.println(calculateAverage());
    }
}