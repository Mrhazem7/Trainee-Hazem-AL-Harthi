using System;

namespace cProject
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("كم عدد الطلاب؟");
            int count = Convert.ToInt32(Console.ReadLine());

            string[] names = new string[count];
            int[] grades = new int[count];

            for (int i = 0; i < count; i++)
            {
                Console.WriteLine("ادخل اسم الطالب رقم " + (i + 1));
                names[i] = Console.ReadLine();

                Console.WriteLine("ادخل درجة الطالب " + names[i]);
                grades[i] = Convert.ToInt32(Console.ReadLine());
            }

            Console.WriteLine("---------------------");
            Console.WriteLine("النتائج:");

            for (int i = 0; i < count; i++)
            {
                if (grades[i] >= 60)
                {
                    Console.WriteLine(names[i] + " - " + grades[i] + " - Passed");
                }
                else
                {
                    Console.WriteLine(names[i] + " - " + grades[i] + " - Failed");
                }
            }
        }
    }
}