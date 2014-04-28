using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace TraiterListe
{
    class Program
    {
	    static void Main()
	    {
		    // Création et affectation d'éléments à la liste des couleurs
            List<string> colorList = new List<string>();
	        colorList.Add ("Rouge");
	        colorList.Add ("Vert");
	        colorList.Add ("Jaune");
	        colorList.Add ("Orange");

            // Affichage du contenu intitialisé de la liste
            Console.WriteLine("Création et affectation d'éléments à la liste des couleurs");
            foreach (string color in colorList)
            {
                Console.WriteLine(color);
            }
            Console.WriteLine("---------------------");
            Console.WriteLine();

            // Visualisation de la couleur de rang 1 puis modification
            Console.Write("Affichage de la couleur au rang 1 (vert) : ");
            Console.WriteLine(colorList[1]);
            colorList[1] = "Indigo";
            Console.WriteLine("Modification de la couleur de rang 1 (vert) par : " + colorList[1]);
            Console.WriteLine("---------------------");
            Console.WriteLine();

            // Suppression puis insertion d'un nouvel élément 
            Console.WriteLine("Suppression de l'éménent de valeur orange");
            colorList.Remove("Orange");
            Console.WriteLine("Insertion de l'élément blanc au rang 2");
            colorList.Insert(2, "Blanc");

            foreach (string color in colorList)
            {
                Console.WriteLine(color);
            }
            Console.WriteLine("---------------------");
            Console.WriteLine();

            // On utilise IndexOf 
            Console.WriteLine("Index de l'élément de valeur Jaune : " + colorList.IndexOf("Jaune"));          
            colorList[colorList.IndexOf("Jaune")] = "Noir";
            Console.WriteLine("Jaune a été remplacé par " + colorList[3]);
            foreach (string color in colorList)
            {
                Console.WriteLine(color);
            }

            colorList.RemoveAt(3);
            Console.WriteLine("Noir a été supprimé");
            Console.WriteLine();
            Console.WriteLine("Affichage final");
            foreach (string color in colorList)
            {
                Console.WriteLine(color);
            }
            // initialisation des éléments de la liste
            colorList.Clear();
        }
    }
}
