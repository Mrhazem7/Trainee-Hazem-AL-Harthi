using System;

namespace Project
{
    class Program
    {
        enum products { cup = 11, plate = 13, table = 20 };
        static void Main(string[] args)
        {
            products someProduct = products.cup;
            Console.WriteLine((int)someProduct);
        }
    }
}