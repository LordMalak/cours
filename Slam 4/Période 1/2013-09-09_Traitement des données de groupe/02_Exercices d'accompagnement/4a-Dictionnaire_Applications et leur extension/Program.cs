using System; using System.Collections.Generic; using System.Text;
namespace Dico
{
    class Program
    {
        static void Main(string[] args)
        {
            // Création du dictionnaire : TKey = extention; TValue ! application
            Dictionary<string, string> mesAppli = new Dictionary<string, string>();
            
            // Ajout d'éléments. Il ne peut pas y avoir deux clefs identiques mais les valeurs peuvent l'être.
            mesAppli.Add("txt", "notepad++.exe");
            mesAppli.Add("bmp", "paint.exe");
            mesAppli.Add("jpg", "paint.exe");
            mesAppli.Add("doc", "winword.exe");
            mesAppli.Add("rtf", "wordpad.exe");
            mesAppli.Add("pdf", "adobe.exe");


            // Gestion d'une exception sur la méthode Add : la clef existe déjà.
            try
            {
                mesAppli.Add("txt", "winword.exe");
            }
            catch (ArgumentException)
            {
                Console.WriteLine("Un élément possède déjà la clef \"txt\".");
            }

            // L'index d'un dictionnaire est de type string car il est associé à la clé 
            Console.WriteLine("La valeur associée à la clef \"rtf\" est {0}.",mesAppli["rtf"]);

            // On utilise l'index pour remplacer la valeur asssociée à cet index 
            mesAppli["rtf"] = "winword.exe";
            Console.WriteLine("La nouvelle valeur associée à la clef \"rtf\" est {0}.",mesAppli["rtf"]);

            // Si la clef n'existe pas déjà, l'utilisation de l'index crée un nouveau couple clef/valeur.
            mesAppli["doc"] = "winword.exe";

            // Recherche d'une valeur en fonction de la clé avec gestion d'une exception si la clef n'existe pas  
            try
            {
                Console.WriteLine("La valeur associée à la clef \"tif\" est {0}.", mesAppli["tif"]);
            }
            catch (KeyNotFoundException)
            {
                Console.WriteLine("La clef \"tif\" est introuvable.");
            }
            
            // La méthode ContainsKey permet de savoir si la clef existe déjà ou non ==> true si clef existe  
            if (!mesAppli.ContainsKey("htm"))
            {
                mesAppli.Add("htm", "firefox.exe");
                Console.WriteLine("Ajout de la clef \"htm\" avec la valeur {0}.",mesAppli["htm"]);
            }

            // La méthode Remove permet de supprimer une paire clef/valeur.
            Console.WriteLine("Suppression de la clef \"doc\" et de la valeur associée.");
            mesAppli.Remove("doc");
            if (!mesAppli.ContainsKey("doc"))
            {
                Console.WriteLine("La clef \"doc\" est introuvable.");
            }
            
            // Count indique le nombre de paires stockées.
            Console.WriteLine("Ce dictionnaire contient {0} paires.", mesAppli.Count);
            
            // Affichage du contenu du dictionnaire
            //--------------------------------------------------------------------------
            Dictionary<string, string>.KeyCollection lesClésDeMaCollection = mesAppli.Keys;

            // On parcourt les clefs (qui sont des objets de type string).
            Console.WriteLine("Liste des clefs :");
            foreach (string uneCle in lesClésDeMaCollection)
            {

                Console.WriteLine(uneCle);
            }

            // Le \n sert à faire à sauter une ligne)
            Console.WriteLine("\nListe des valeurs :");

            // On récupère juste les valeurs.
            Dictionary<string, string>.ValueCollection lesValeursDeMaCollection = mesAppli.Values;

            // On parcourt les valeurs (qui sont des objets de type string)
            foreach (string uneValeur in lesValeursDeMaCollection)
            {
                Console.WriteLine(uneValeur);
            }

            Console.WriteLine("\nListe des paires clef/valeur :");

            // Quand on utilise foreach pour énumérer les éléments du dictionnaire,
            // ces éléments sont récupérés en tant que des objets de type KeyValuePair.
            foreach (KeyValuePair<string, string> pcv in mesAppli)
            {
                Console.WriteLine("L'extension [\"{0}\"] est associée à {1}", pcv.Key, pcv.Value);
            }
            
            // La méthode Clear permet de supprimer toutes les paires clef/valeur.
            mesAppli.Clear();
            Console.WriteLine("Après suppression, ce dictionnaire contient {0} paires.", mesAppli.Count);
        }
    }
}