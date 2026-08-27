using System;

namespace Project
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Please enter a number");
            var a = int.Parse(Console.ReadLine());
            var result = a * 5;
            Console.WriteLine(result);
        }
    }
}