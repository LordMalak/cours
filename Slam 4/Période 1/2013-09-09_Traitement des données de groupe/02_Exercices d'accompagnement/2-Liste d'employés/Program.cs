using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace ListeEmployes
{
    class Program
    {
        static void Main(string[] args)
        {
            // Création et affectation d'éléments à la liste des employés
            List<string> listEmployes = new List<string>();
	        listEmployes.Add ("Poivre Romain ");
	        listEmployes.Add ("Safran Pauline ");
	        listEmployes.Add ("Cannelle Coline  ");
	        listEmployes.Add ("Coriandre Joël");

            // Affichage du contenu initialisé de la liste des employés
            Console.WriteLine("Liste initiale des employés");
            foreach (string  unEmploye  in  listEmployes)
            {	 
		        Console.WriteLine("rang  : " + listEmployes.IndexOf(unEmploye) + " nom de l'employé : " + unEmploye);
	        }
            
            // insertion d'un nouvel employé 
            listEmployes.Insert(0, "Du Sel Marine ");
            Console.WriteLine();
            Console.WriteLine("Affichage de la liste après insertion "); 
            foreach (string unEmploye in listEmployes)
            {	 
	            Console.WriteLine(unEmploye);	 
            }

            // comptage des éléments de la liste
            listEmployes.Count();
            Console.WriteLine();
            Console.WriteLine("La liste comporte {0} éléments ", listEmployes.Count());
            
            // tri alphabétique de la lsite des employés 
            listEmployes.Sort();
            Console.WriteLine();
            Console.WriteLine("Affichage de la liste après tri");
            Console.WriteLine("-------------------------------"); 
            foreach (string unEmploye in listEmployes)
            {
                Console.WriteLine(unEmploye);
            }
       }
    }
}
