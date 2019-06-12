using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Presentacion.Controllers
{
    public class PalindromoController : Controller
    {

        [HttpGet]
        public ActionResult Index()
        {
         
            return View();
        }

        [HttpPost]
        public ActionResult ProcesarTexto(string Text)
        {
            string str = Text.ToLower();
            var split = str.Split(' ');

            if (split.Length == 1)
                return Json("Cantidad de palíndromos: " + CountPS(str.ToCharArray(), str.Length));
            else
                return Json("Cantidad de palíndromos: " + countPalin(Text));
        }

        private int CountPS(char[] str, int n)
        {

            int[][] dp = ReturnRectangularIntArray(n, n);
            bool[][] P = ReturnRectangularBoolArray(n, n);

            for (int i = 0; i < n; i++)
            {
                P[i][i] = true;
            }

            for (int i = 0; i < n - 1; i++)
            {
                if (str[i] == str[i + 1])
                {
                    P[i][i + 1] = true;
                    dp[i][i + 1] = 1;
                }
            }

            for (int gap = 2; gap < n; gap++)
            {
                for (int i = 0; i < n - gap; i++)
                { 
                    int j = gap + i;

                    if (str[i] == str[j] && P[i + 1][j - 1])
                    {
                        P[i][j] = true;
                    }

                    if (P[i][j] == true)
                    {
                        dp[i][j] = dp[i][j - 1] +
                                   dp[i + 1][j] + 1 - dp[i + 1][j - 1];
                    }
                    else
                    {
                        dp[i][j] = dp[i][j - 1] +
                                   dp[i + 1][j] - dp[i + 1][j - 1];
                    }
                }
            }

            return dp[0][n - 1];
        }

        private int[][] ReturnRectangularIntArray(int size1, int size2)
        {
            int[][] newArray = new int[size1][];
            for (int array1 = 0;
                     array1 < size1; array1++)
            {
                newArray[array1] = new int[size2];
            }

            return newArray;
        }

        private bool[][] ReturnRectangularBoolArray(int size1, int size2)
        {
            bool[][] newArray = new bool[size1][];
            for (int array1 = 0; array1 < size1; array1++)
            {
                newArray[array1] = new bool[size2];
            }

            return newArray;
        }

        private bool checkPalin(string word)
        {
            int n = word.Length;
            word = word.ToLower();
            for (int i = 0; i < n; i++, n--)
            {
                if (word[i] != word[n - 1])
                {
                    return false;
                }
            }
            return true;
        }

        private int countPalin(string str)
        {
            str = str + " ";

            string word = "";
            int count = 0;
            for (int i = 0; i < str.Length; i++)
            {
                char ch = str[i];

                if (ch != ' ')
                {
                    word = word + ch;
                }
                else
                {
                    if (checkPalin(word))
                    {
                        count++;
                    }
                    word = "";
                }
            }

            return count;
        }
    }
}