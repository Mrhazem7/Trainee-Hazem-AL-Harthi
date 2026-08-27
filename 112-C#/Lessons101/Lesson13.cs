using System;
namespace cProject
{
    class Program
    {
        static void Main(string[] args)
        {
            int season = 5;
            switch (season)
            {
                case 1:
                    Console.WriteLine("Winter");
                    break;
                case 2:
                    Console.WriteLine("Spring");
                    break;
                case 3:
                    Console.WriteLine("Summer");
                    break;
                case 4:
                    Console.WriteLine("Autumn");
                    break;
                default:
                    Console.WriteLine("not a season");
                    break;
            }
        }
    }
}