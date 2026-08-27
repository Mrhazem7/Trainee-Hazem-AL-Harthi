using System;
using System.Collections.Generic;

namespace InventoryApp
{
    class Item
    {
        public string Name;
        public int Quantity;
        public double Price;

        public Item(string name, int quantity, double price)
        {
            Name = name;
            Quantity = quantity;
            Price = price;
        }

        public void PrintInfo()
        {
            Console.WriteLine("الاسم: " + Name + " | الكمية: " + Quantity + " | السعر: " + Price);
        }
    }

    class Program
    {
        static void Main(string[] args)
        {
            List<Item> inventory = new List<Item>();
            bool running = true;

            while (running)
            {
                Console.WriteLine("\n===== نظام إدارة المخزون =====");
                Console.WriteLine("1. إضافة عنصر جديد");
                Console.WriteLine("2. عرض جميع العناصر");
                Console.WriteLine("3. تعديل كمية عنصر");
                Console.WriteLine("4. خروج");
                Console.WriteLine("اختر رقم العملية:");

                string choice = Console.ReadLine();

                if (choice == "1")
                {
                    AddItem(inventory);
                }
                else if (choice == "2")
                {
                    DisplayItems(inventory);
                }
                else if (choice == "3")
                {
                    UpdateQuantity(inventory);
                }
                else if (choice == "4")
                {
                    running = false;
                    Console.WriteLine("تم إنهاء البرنامج.");
                }
                else
                {
                    Console.WriteLine("اختيار غير صحيح، حاول مرة أخرى.");
                }
            }
        }

        static void AddItem(List<Item> inventory)
        {
            Console.WriteLine("ادخل اسم العنصر:");
            string name = Console.ReadLine();

            Console.WriteLine("ادخل الكمية:");
            int quantity = Convert.ToInt32(Console.ReadLine());

            Console.WriteLine("ادخل السعر:");
            double price = Convert.ToDouble(Console.ReadLine());

            Item newItem = new Item(name, quantity, price);
            inventory.Add(newItem);

            Console.WriteLine("تمت إضافة العنصر بنجاح.");
        }

        static void DisplayItems(List<Item> inventory)
        {
            if (inventory.Count == 0)
            {
                Console.WriteLine("لا يوجد عناصر في المخزون حالياً.");
                return;
            }

            Console.WriteLine("----- قائمة العناصر -----");
            for (int i = 0; i < inventory.Count; i++)
            {
                Console.Write((i + 1) + ". ");
                inventory[i].PrintInfo();
            }
        }

        static void UpdateQuantity(List<Item> inventory)
        {
            if (inventory.Count == 0)
            {
                Console.WriteLine("لا يوجد عناصر لتعديلها.");
                return;
            }

            Console.WriteLine("ادخل اسم العنصر اللي تبي تعدل كميته:");
            string name = Console.ReadLine();

            bool found = false;

            foreach (Item item in inventory)
            {
                if (item.Name == name)
                {
                    Console.WriteLine("الكمية الحالية: " + item.Quantity);
                    Console.WriteLine("ادخل الكمية الجديدة:");
                    int newQuantity = Convert.ToInt32(Console.ReadLine());
                    item.Quantity = newQuantity;
                    Console.WriteLine("تم تعديل الكمية بنجاح.");
                    found = true;
                    break;
                }
            }

            if (!found)
            {
                Console.WriteLine("لم يتم العثور على عنصر بهذا الاسم.");
            }
        }
    }
}