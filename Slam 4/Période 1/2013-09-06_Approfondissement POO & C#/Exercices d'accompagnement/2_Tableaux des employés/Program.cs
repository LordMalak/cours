using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace TabEmployes
{
    class Program
    {
        static void Main(string[] args)
        {
		// Création et affectation d'éléments à un tableau à deux dimmensions des employés
            string[,] tabSalaries = new string[,] 
            { 
                {"10","Poivre Romain"},{"20", "Safran Pauline"},{"30","Cannelle Coline"},{"40","Coriandre Joël"}, {"",""}
            };

            // Affichage du contenu intitialisé du tableau des employés
            Console.WriteLine("Liste initiale des employés");
            for	(int i = 0; i < 4 ; i++)
	 		{
                Console.WriteLine("Salarié : " + tabSalaries[i,0] + " " + tabSalaries[i,1]);
	        }
            // Décalage des éléments salarié 
            for	(int i = 4; i > 2 ; i--)
	 		{
                tabSalaries[i,0] = tabSalaries[i-1,0];
                tabSalaries[i,1] = tabSalaries[i-1,1];
            }
            // Insertion d'un nouveau salarié 
            tabSalaries[2, 0] = "25";
            tabSalaries[2, 1] = "Cumin Dorian";

            // ré=-ffichage du contenu intitialisé du tableau des employés
            Console.WriteLine();
            Console.WriteLine("Nouvelle liste des salariés après insertion");
            for (int i = 0; i < 5 ; i++)
            {
                Console.WriteLine("Salarié : " + tabSalaries[i, 0] + " " + tabSalaries[i, 1]);
            }

            
            // Tableau de tableaux de chaines des auteurs
            string[] tabPrenom 	    = new string[3] {"François", "Romain", "Julien"};
            string[] tabNom	        = new string[3] {"Cheng", "Roland", "Gracq"}; 
            string[][] tabPersonne  =
            {
                tabPrenom, tabNom 
            };
            Console.WriteLine();
            for (int i = 0 ; i < 3; i++)
            {
                    Console.WriteLine("Un auteur : " + tabPersonne[0][i] + " " + tabPersonne[1][i]);
            }
            Console.ReadKey();
        }
    }
}
