using System; using System.Collections.Generic;
using System.Linq; using System.Text;

namespace Exception_Age
{
    class Program
    {
        static void Main(string[] args)
        {
            // initialisation des variables
            string  prenom;
            int     age     = 0;
            bool    ageOK   = false;
            
            // Saisie du prenom
            Console.Write("Votre prénom : ");
            prenom = Console.ReadLine();
            
            // -------------------------------------------------------------------
            // Tant Que la saisie de l'âge génère une erreur  
            while (!ageOK) 
            {
                // Saisie de l'âge
                Console.Write("Votre âge    : ");

                // Vérification de la valeur de la variable saisie et gestion d'exception
                try 
                {
                    // Si conversion impossible, la méthode Convert lance une exception  ==> l'opération est placée dans un try-catch.
                    age     = Convert.ToInt16(Console.ReadLine());
                    ageOK   = age>=17; 
                    if      (!ageOK)
                    {
                        Console.WriteLine("Votre âge semble incorrect, recommencez ...");
                    }
                } 
                catch (Exception)
                {
                    Console.WriteLine("Vous devez saisir une valeur numérique entière");
                }
                //   Fin de la gestion d'exception
               
            }  
            // Fin du Tant Que
            // ----------------------------------------------------------------------

            // affichage final
            Console.WriteLine();
            Console.WriteLine("Vous vous appelez {0} et vous avez {1} an(s)",prenom,age);
            Console.ReadKey();
        }
    }
}
