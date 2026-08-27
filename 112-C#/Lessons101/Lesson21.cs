using System;
namespace cProject
{
    class Program
    {
        static void Main(string[] args)
        {
            print(6);
        }
        static void print(int to)
        {
            for (int i = 1; i <= to; i++)
            {
                Console.WriteLine(i);
            }
        }
    }
}