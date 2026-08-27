using System;

namespace Project
{
    class Program
    {
        static void Main(string[] args)
        {
            var x = 1;
            Console.WriteLine(x);

            Three(out x);

            Console.WriteLine(x);
        }
        static void Three(out int a)
        {
            a = 3;
            Console.WriteLine(a);
        }
    }
}