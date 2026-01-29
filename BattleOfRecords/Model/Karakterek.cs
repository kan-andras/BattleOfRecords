using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BattleOfRecords.Model
{
    internal class Karakterek
    {
        public int id { get; set; }
        public string nev { get; set; }
        public int eletero { get; set; }
        public int mana { get; set; }
        public int tamadoero { get; set; }

        public Karakterek(int id, string nev, int eletero, int mana, int tamadoero)
        {
            this.id = id;
            this.nev = nev;
            this.eletero = eletero;
            this.mana = mana;
            this.tamadoero = tamadoero;
        }
    }
}
