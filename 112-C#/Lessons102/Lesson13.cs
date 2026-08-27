using System;

namespace Project
{
    class Program
    {
        static void Main(string[] args)
        {
            //object
            var c = new Cat();

            Console.WriteLine("please enter your cat's name");
            c.Name = Console.ReadLine();

            Console.WriteLine("please enter your cat's gender");
            c.Gender = Console.ReadLine();

            Console.WriteLine("please enter your cat's color");
            c.Color = Console.ReadLine();

            Console.WriteLine("please enter your phone number");
            c.OwnerPhoneNumber = Console.ReadLine();

            c.catInfo();
        }
    }

    class Cat
    {
        //feilds
        public string Name;
        public string Gender;
        public string Color;
        public string OwnerPhoneNumber;

        public void catInfo()
        {
            Console.WriteLine("cat name is: {0} , its gender is: {1} , its color is: {2} , and owner phone number is: {3}"
                , Name, Gender, Color, OwnerPhoneNumber);
        }
    }
}