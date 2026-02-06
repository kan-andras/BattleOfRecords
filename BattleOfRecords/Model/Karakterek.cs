using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BattleOfRecords.Model
{
    internal class Karakterek
    {
        public int _karakter_id { get; set; }
        public int _jatek_id { get; set; }
        public string karakterneve { get; set; }
        public int eletero
        {
            get => _karakter_id;
            set
            {
                if (value < 0)
                    throw new ArgumentOutOfRangeException(nameof(value), "a karakter id nem lehet negatív.");
                _karakter_id = value;
            }
        }
        public int mana { get; set; }

        public Karakterek(int _karakter, int _jatek, int _mana, int _eletero, string _karakternev)
        {
            this.eletero = _eletero;
            this.karakterneve = _karakternev;
            this.mana = _mana;
            this._karakter_id = _karakter;
            this._jatek_id = _jatek;
        }

        public override string ToString()
        {
            return $"-Karakter ID: {_karakter_id}| Karakter neve: {karakterneve}| Életereje: {eletero}| Mana: {mana}";
        }
    }

}
