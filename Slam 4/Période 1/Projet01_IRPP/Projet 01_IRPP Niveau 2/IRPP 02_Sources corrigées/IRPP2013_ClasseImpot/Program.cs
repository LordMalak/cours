using System;       using System.Collections.Generic;
using System.Linq;  using System.Text;
using libImpot;

namespace IRPP2013
{
    class Program
    {
        static void Main(string[] args)
        {
        // Déclaration des constantes et des variables
        decimal     coefAbattement  = 0.90M;
        decimal[]   plafond         = { 5964.00M, 11897.00M, 26421.00M, 70831.00M, 150001, 00M };
        decimal[]   taux            = { 0M, 0.055M, 0.14M, 0.30M, 0.41M, 0.45M };
        decimal[]   abattement      = { 0M, 327.97M, 1339.13M, 5566.33M, 13357.63M, 19357.63M };
        bool        couple          = false;
        decimal     nbEnfants       = 0.0M, nbParts = 0.0M;
        decimal     salairePercu    = 0, revenuImposable = 0, quotientFamilial = 0;  
        string      reponse         = "";
        bool        OK = false;           

        // Instanciation d'un objet de la classe
        Impot IRPPTest = new Impot();
            Console.WriteLine( IRPPTest.GetType());
       
        // Saisies des données pour un calcul d'impot
        // ---------------------------------------------------------------------------------
        reponse = null;     // Couple ou célibataire 
        while (!OK)
        {
            Console.Write("Le foyer fiscal est-il composé d'un couple : oui ou non ? : ");
            reponse = Console.ReadLine().ToLower();   // converti la chaine en caratères minuscules
            if (reponse != "oui" && reponse != "non")
                Console.Error.WriteLine("Réponse incorrecte. Recommencez");
            else OK = true;
        }
        couple = reponse == "oui";

        OK = false; // Saisie du nombre d'enfants
        while (!OK) 
        {
            Console.Write("Nombre d'enfants à charge : ");
            reponse = Console.ReadLine();
            try
            {
                nbEnfants = int.Parse(reponse);
                if (nbEnfants >= 0) OK = true;
                else Console.WriteLine("Réponse incorrecte. Recommencez");
            }
            catch (Exception)
            { Console.WriteLine("Réponse incorrecte. Recommencez"); }
        }

        OK = false; // Saisie du salaire
        while (!OK) 
        {
            Console.Write("Salaire perçu en 2012 : "); 
            reponse = Console.ReadLine();
            try
            {
                salairePercu = decimal.Parse(reponse);
                if (salairePercu >= 0) OK = true;
                else Console.Error.WriteLine("Réponse incorrecte. Recommencez");
            }
            catch (Exception)
            { Console.Error.WriteLine("Réponse incorrecte. Recommencez"); }
        }

        // Affectation des valeurs des propriétés privées de l'objet
        IRPPTest.Couple         = couple;
        IRPPTest.NbEnfants      = nbEnfants;
        IRPPTest.CalculerNbParts(couple, nbEnfants);
        IRPPTest.SalairePercu   = salairePercu;    

        // Calcul du revenu imposable 
        //-----------------------------------------------------------------------------
        revenuImposable = (salairePercu * coefAbattement);

        // Calcul du quotient familial
        //-----------------------------------------------------------------------------
        nbParts = IRPPTest.NbParts;
        quotientFamilial = revenuImposable / nbParts;

        // recherche de la tranche d'impots correspondant au qotient familial
        //-----------------------------------------------------------------------------
        int i = 0;
        while ((quotientFamilial > plafond[i]) & (i<5))
        {
            i++;
        }
        
        // Affectation des valeurs des propriétés privées
        IRPPTest.Plafond        = plafond[i];
        IRPPTest.Coefficient    = taux[i];
        IRPPTest.Abattement     = abattement[i];

        Console.WriteLine();
        Console.WriteLine("Calcul de l'impôt");
        Console.WriteLine("-------------------------------------------"); 
        IRPPTest.CalculerImpot();
        Console.WriteLine();
        }
    }
}
        