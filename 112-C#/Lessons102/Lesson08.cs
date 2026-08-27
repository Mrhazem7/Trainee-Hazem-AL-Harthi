using System;

namespace Project
{
    class Program
    {
        static void Main(string[] args)
        {
            var x = 1;
            Console.WriteLine(x);

            Double(ref x);

            Console.WriteLine(x);
        }
        static void Double(ref int a)
        {
            a = a * 2;
            Console.WriteLine(a);
        }
    }
}