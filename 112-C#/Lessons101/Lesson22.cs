using System;
namespace cProject
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine(sum(4, 2));
        }
        static int sum(int a, int b)
        {
            int c = a + b;
            return c;
        }
    }
}