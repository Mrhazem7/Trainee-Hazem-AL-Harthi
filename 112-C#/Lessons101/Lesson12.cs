using System;
namespace cProject
{
    class Program
    {
        static void Main(string[] args)
        {
            var number = 0;

            if (number > 0)
            {
                Console.WriteLine("+");
            }
            else if (number < 0)
            {
                Console.WriteLine("-");
            }
            else
            {
                Console.WriteLine("zero");
            }
        }
    }
}