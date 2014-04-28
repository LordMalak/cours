using System;   using System.Collections.Generic;  using System.Text;
namespace Tableau
{
    class Program
    {
        static void Main(string[] args)
        {
            // Tableau à 1 dimension, initialisé
            int[] tabEntiers = new int[] { 0, 10, 20, 30 };
            for (int i = 0; i < tabEntiers.Length; i++) 
            {
                Console.Out.WriteLine("tabEntiers[{0}]={1}", i, tabEntiers[i]);
            }  

            // Tableau à 2 dimensions, initialisé
            double[,] tabReels = new double[,] { { 0.5, 1.7 }, { 8.4, -6 } };
            for (int i = 0; i < tabReels.GetLength(0); i++) 
            {
                for (int j = 0; j < tabReels.GetLength(1); j++) 
                {
                    Console.Out.WriteLine("réels[{0},{1}]={2}", i, j, tabReels[i, j]);
                }
            } 

            // Tableau de tableaux
            string[][] noms = new string[3][];
            for (int i = 0; i < noms.Length; i++) 
            {
                noms[i] = new string[i + 1];
            }
            // initialisation
            for (int i = 0; i < noms.Length; i++) 
            {
                for (int j = 0; j < noms[i].Length; j++) 
                {
                    noms[i][j] = "nom" + i + j;
                } 
            } 
            // affichage
            for (int i = 0; i < noms.Length; i++) {
                for (int j = 0; j < noms[i].Length; j++) {
                    Console.Out.WriteLine("noms[{0}][{1}]={2}", i, j, noms[i][j]);
                }
 } } } }
