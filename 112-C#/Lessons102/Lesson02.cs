using System;

namespace Project
{
    class Program
    {
        static void Main(string[] args)
        {
            int myInt = 5;
            double myD = 10.2;

            //implicit
            //myD = myInt;
            //Console.WriteLine(myD);

            //explicit
            //myInt = (int)myD;
            //Console.WriteLine(myInt);

            //convert
            string mySt = "2";
            myInt = Convert.ToInt32(mySt);
            Console.WriteLine(myInt);
        }
    }
}