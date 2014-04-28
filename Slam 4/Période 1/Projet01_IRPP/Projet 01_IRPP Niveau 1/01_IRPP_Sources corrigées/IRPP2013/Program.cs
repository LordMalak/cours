using System;       using System.Collections.Generic;
using System.Linq;  using System.Text;

namespace IRPP2013
{
    class Program
    {
        static void Main(string[] args)
        {
        // Déclaration des constantes et des variables
        double     coefAbattement = 0.90;
        double[]   plafond      = { 5964.00,    11897.00,   26421.00,   70831.00,   150001,00           };
        double[]   coefficient  = { 0,          0.055,      0.14,       0.30,       0.41,           0.45};
        double[]   abattement   = { 0,          327.97,     1339.13,    5566.33,    13357.63,       19357.63};
        bool       couple       = false;
        double     nbEnfants    = 0.0; 
        double     salairePercu = 0, revenuImposable = 0, quotientFamilial = 0;
        double     impotAPayer  = 0;   
        string     reponse      = "";
        bool       OK;           

        // Saisies des données concernant un salarié
        // ---------------------------------------------------------------------------------

        // Couple ou célibataire 
        OK = false; 
        while (!OK) 
        {
            Console.Write("La famille est-elle composée d'un couple : oui ou non ? : ");
            reponse = Console.ReadLine();
            if (reponse != "oui" && reponse != "non")
                Console.WriteLine("Réponse incorrecte. Recommencez");
            else OK = true;
        }
        if  (reponse == "oui")  
        {   
            couple = true; 
        }
        
        // nombre d'enfants
        OK = false;
        while (!OK) 
        {
            Console.Write("Nombre d'enfants à charge : ");
            nbEnfants = Convert.ToInt16(Console.ReadLine());
            OK = nbEnfants >= 0;
            if (!OK) 
            {
                Console.WriteLine("Réponse incorrecte. Recommencez");
            }
        }

        // salaire
        OK = false;
        while (!OK) 
        {
            Console.Write("Salaire annuel : ");
            salairePercu = int.Parse(Console.ReadLine());
            OK = salairePercu >= 0;
            if (!OK) 
            {
                Console.WriteLine("Réponse incorrecte. Recommencez");
            }
        }

        // Calcul du revenu imposable 
        //-----------------------------------------------------------------------------
        revenuImposable = (salairePercu * coefAbattement);

        // Calcul du quotient familial
        //-----------------------------------------------------------------------------
        quotientFamilial = revenuImposable / nbParts(nbEnfants, couple);

        // recherche de la tranche d'impots correspondant au qotient familial
        //-----------------------------------------------------------------------------
        int i = 0;
        while ((quotientFamilial > plafond[i]) & (i<5))
        {
            i++;
        }
        impotAPayer = Math.Floor((revenuImposable * coefficient[i]) - (abattement[i] * nbParts(nbEnfants, couple)));
        // on affiche les résultats
        Console.WriteLine("nombre d'enfants               : {0}", nbEnfants); 
        Console.WriteLine("Nombre de parts                : {0}", nbParts(nbEnfants, couple));
        Console.WriteLine("Revenu déclaré                 : {0} euros", salairePercu);
        Console.WriteLine("Revenu imposable               : {0} euros", revenuImposable);
        Console.WriteLine("Quotient familial              : {0} euros", quotientFamilial);
        Console.WriteLine("Impôt à payer                  : {0} euros", impotAPayer);
        }

         // calcul du nombre de parts
        //----------------------------------------------------------------------------
        private static double nbParts(double nbEnfants, bool couple)
        {
            double parts;
            if (couple == true)  						// couple avec ou sans enfants
            {
                parts = 2 + (nbEnfants / 2);
            }
            else if (nbEnfants > 0)
            {
                parts = 1 + (nbEnfants / 2) + 0.5;  	// personne isolée avec enfants
            }
			else parts = 1;								// personne isolée sans enfant
			
            if
                (nbEnfants >= 3) parts = parts + 0.5;	// à partir de 3 enfants

            return parts;
        }
    }
}
        