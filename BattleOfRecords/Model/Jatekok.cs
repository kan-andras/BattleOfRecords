using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BattleOfRecords.Model
{
    internal class Jatekok
    {
        public Jatekok(int jatek_id, string jatekneve)
        {
            this.jatek_id = jatek_id;
            this.jatekneve = jatekneve;
        }

        public int jatek_id { get; set; }
        public string jatekneve { get; set; }

        public override string ToString()
        {
            return $"-ID: {jatek_id}| Játék neve: {jatekneve}";
        }

    }
}
