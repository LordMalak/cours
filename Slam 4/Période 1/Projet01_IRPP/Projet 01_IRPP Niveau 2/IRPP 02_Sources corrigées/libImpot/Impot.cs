using System;       using System.Collections.Generic;
using System.Linq;  using System.Text;

namespace libImpot
{
    public class Impot
    {
        // propriétés privées de la classe
        private     bool         couple;
        private     decimal      nbEnfants ;
        private     decimal      nbParts;
        private     decimal      salairePercu;
        private     decimal      plafond;
        private     decimal      coefficient;
        private     decimal      abattement;

        // constructeur de la classe
        public Impot()
        {}
        // accesseurs de la classe
        public bool Couple
        {
            get { return couple;        }       set { couple = value;       }
        }
        public decimal NbEnfants
        {
            get { return nbEnfants;     }       set { nbEnfants = value;    }
        }
        public decimal NbParts
        {
            get { return nbParts;     }       set { nbParts = value;        }
        }
        public decimal SalairePercu
        {
            get { return salairePercu;  }       set { salairePercu = value; }
        }
        public decimal Plafond
        {
            get { return plafond;       }       set { plafond = value;      }
        }
        public decimal Coefficient
        {
            get { return coefficient;   }       set { coefficient = value;  }
        }
         public decimal Abattement
        {
            get { return abattement;    }       set { abattement = value;   }
        }

         // Méthode privée de la classe permettant de calculer le nombre de parts
         public void CalculerNbParts(bool Couple, decimal NbEnfants)
         {
             decimal parts;
             if (couple == true)  			                // couple avec ou sans enfants
             {
                 parts = 2 + (nbEnfants / 2);
             }
             else if (nbEnfants > 0)
             {
                 parts = 1 + (nbEnfants / 2) + 0.5M;  	    // personne isolée avec enfants
             }
             else parts = 1;		                        // personne isolée sans enfant			
             if
                 (nbEnfants >= 3) parts = parts + 0.5M;	    // à partir de 3 enfants
             
             this.nbParts = parts;
         }
        
        // Calcul de l'impôt 
        //---------------------------------------------
        public void CalculerImpot()
        {
			Console.WriteLine("En couple                      : {0}", this.couple); 
            Console.WriteLine("Nombre d'enfants               : {0}", this.nbEnfants);
            Console.WriteLine("Nombre de parts                : {0}", this.nbParts);
            Console.WriteLine("--------------------------------------------");

			// Salaire imposable et quotient familial
			decimal salaireImposable = this.salairePercu * 90 / 100;
            decimal quotientFamilial = salaireImposable / this.nbParts;
			Console.WriteLine("Salaire imposable              : {0}", salaireImposable); 
            Console.WriteLine("Quotient familial              : {0}", quotientFamilial);
            Console.WriteLine("Tranche d'imposition           : {0}", this.plafond);
            Console.WriteLine("Taux d'imposition              : {0}", this.coefficient);
            Console.WriteLine("Abattement pour chaque part    : {0}", this.abattement);
            Console.WriteLine("--------------------------------------------");
			// Calcul de l'impôt
            decimal impot = Math.Floor((salaireImposable * this.coefficient) - (this.abattement * this.nbParts));  
			Console.WriteLine("Impôt à payer au titre de 2012 : {0}", impot);
        }
    }
}
