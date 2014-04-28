using System; using System.Collections.Generic; using System.Linq; using System.Text;
namespace IRPP2008
{   class Program
    {   static void Main(string[] args)
        {
            // tableaux de données nécessaires au calcul de l'impôt - M comme Money pour le type décimal 
            decimal[] Limites = new decimal[] 
            { 12620M, 13190M, 15640M, 24740M, 31810M, 39970M, 48360M, 55790M, 92970M, 127860M, 151250M, 172040M, 195000M, 0M };
            decimal[] CoeffN = new decimal[] 
            { 0M, 631M, 1290.5M, 2072.5M, 3309.5M, 4900M, 6898.5M, 9316.5M, 12106M, 16754.5M, 23147.5M, 30710M, 39312M, 49062M };
            int     Salaire = 0, i = 0;
            decimal coefAbattement = 0.72M, NbParts, Revenu,QF;
            // Saisie du statut marital
            bool OK         = false;
            string reponse  = null;
            while (!OK)
            {   Console.Out.Write("Etes-vous marié(e) (oui/non) ? ");
                reponse = Console.In.ReadLine().Trim().ToLower();
                if (reponse != "oui" && reponse != "non")
                    Console.Error.WriteLine("Réponse incorrecte. Recommencez");
                else OK = true;
            }
            bool Marie = reponse == "oui";
            // Saisie du nombre d'enfants
            OK              = false;
            int NbEnfants   = 0;
            while (!OK)
            {   Console.Out.Write("Nombre d'enfants à charge : ");
                reponse = Console.In.ReadLine();
                try
                {   NbEnfants = int.Parse(reponse);
                    if (NbEnfants >= 0) OK = true;
                    else Console.Error.WriteLine("Réponse incorrecte. Recommencez");
                }
                catch (Exception)
                {   Console.Error.WriteLine("Réponse incorrecte. Recommencez");    }
            }
            // Saisie du salaire
            OK = false;
            while (!OK)
            {   Console.Out.Write("Salaire annuel : ");
                reponse = Console.In.ReadLine();
                try
                {   Salaire = int.Parse(reponse);
                    if (Salaire >= 0) OK = true;
                    else Console.Error.WriteLine("Réponse incorrecte. Recommencez");
                }
                catch (Exception)
                {   Console.Error.WriteLine("Réponse incorrecte. Recommencez");    }
            }
            // calcul du nombre de parts
            if (Marie) NbParts  = (decimal)NbEnfants/2 + 2;
            else NbParts        = (decimal)NbEnfants/2 + 1;
            if (NbEnfants       >= 3) NbParts = NbParts + 0.5M;   
            // revenu imposable
            Revenu = coefAbattement * Salaire;
            // quotient familial
            QF = Revenu / NbParts;
            // recherche de la tranche d'impots correspondant à QF
            int NbTranches = Limites.Length;
            Limites[NbTranches - 1] = QF;
            while (QF > Limites[i]) i++;
            // l'impôt chaque ligne correspond à un taux de 0,05 * tranche
            int impots = (int)(i * 0.05M * Revenu - CoeffN[i] * NbParts);
            // on affiche le résultat
            Console.Out.WriteLine("Impôt à payer : " + impots);
            Console.ReadKey();
}   }   }
