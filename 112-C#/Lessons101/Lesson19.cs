using System;
namespace cProject
{
    class Program
    {
        static void Main(string[] args)
        {
            var colors = new string[] { "white", "blue", "red" };

            foreach (var color in colors)
            {
                Console.WriteLine(color);
            }
        }
    }
}