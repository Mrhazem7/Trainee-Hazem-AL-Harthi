using System;
namespace cProject
{
    class Program
    {
        static void Main(string[] args)
        {
            var age = 14;
            if (age >= 18)
            {
                Console.WriteLine("adult");
            }
            else
            {
                Console.WriteLine("under age");
            }
        }
    }
}