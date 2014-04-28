using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using libAnimalerie;


namespace Annuaire
{
    class Program
    {
        static void Main(string[] args)
        {
            Dictionary<string, classAnimal> mesAnimaux = new Dictionary<string, classAnimal>();
            mesAnimaux.Add("Premier", new classAnimal{Espece = "Chien", Nom = "Barthes"});
            mesAnimaux.Add("Second",  new classAnimal { Espece = "Chat", Nom = "Doudou" });
            mesAnimaux.Add("Dernier", new classAnimal { Espece = "Chien", Nom = "Couac" }); 
            Console.WriteLine(mesAnimaux.Count);
            Console.WriteLine(mesAnimaux["Premier"] );

            foreach (Object obj in mesAnimaux)
                Console.WriteLine("    {0}", obj);
                Console.WriteLine();

                Queue<string> numbers = new Queue<string>();
                numbers.Enqueue("one");
                numbers.Enqueue("two");
                numbers.Enqueue("three");
                numbers.Enqueue("four");
                numbers.Enqueue("five");

                // A queue can be enumerated without disturbing its contents.
                foreach (string number in numbers)
                {
                    Console.WriteLine(number);
                }

                Console.WriteLine("\nDequeuing '{0}'", numbers.Dequeue());
                Console.WriteLine("Peek at next item to dequeue: {0}",
                    numbers.Peek());
                Console.WriteLine("Dequeuing '{0}'", numbers.Dequeue());

                // Create a copy of the queue, using the ToArray method and the
                // constructor that accepts an IEnumerable<T>.
                Queue<string> queueCopy = new Queue<string>(numbers.ToArray());

                Console.WriteLine("\nContents of the first copy:");
                foreach (string number in queueCopy)
                {
                    Console.WriteLine(number);
                }

                // Create an array twice the size of the queue and copy the
                // elements of the queue, starting at the middle of the 
                // array. 
                string[] array2 = new string[numbers.Count * 2];
                numbers.CopyTo(array2, numbers.Count);

                // Create a second queue, using the constructor that accepts an
                // IEnumerable(Of T).
                Queue<string> queueCopy2 = new Queue<string>(array2);

                Console.WriteLine("\nContents of the second copy, with duplicates and nulls:");
                foreach (string number in queueCopy2)
                {
                    Console.WriteLine(number);
                }

                Console.WriteLine("\nqueueCopy.Contains(\"four\") = {0}",
                    queueCopy.Contains("four"));

                Console.WriteLine("\nqueueCopy.Clear()");
                queueCopy.Clear();
                Console.WriteLine("\nqueueCopy.Count = {0}", queueCopy.Count);
        }
      
    }
} 
