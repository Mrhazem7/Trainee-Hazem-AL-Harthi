using System;
namespace cProject
{
    class Program
    {
        static void Main(string[] args)
        {
            print();
            print();
        }

        static void print()
        {
            for (int i = 1; i <= 3; i++)
            {
                Console.WriteLine(i);
            }
        }
    }
}