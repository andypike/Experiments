using System;

namespace TestingGit
{
    class Program
    {
        static void Main(string[] args)
        {
            string test = "hello";
            Console.WriteLine(Test(test));
            Console.WriteLine(test);

            Console.WriteLine("What's your name?");
            string name = Console.ReadLine();

            Console.WriteLine("Hello, " + name);
            Console.ReadLine();
        }

        private static string Test(string a)
        {
            return a.Replace("l", "_");
        }
    }
}
