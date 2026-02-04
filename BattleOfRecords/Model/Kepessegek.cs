using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BattleOfRecords.Model
{
    internal class Kepessegek
    {
        public Kepessegek(int karakter_id, int kepessegek_id, string kepessegekneve, string tipusa, int manafogyasztas, int serules)
        {
            this.karakter_id = karakter_id;
            this.kepessegek_id = kepessegek_id;
            this.kepessegekneve = kepessegekneve;
            this.tipusa = tipusa;
            this.manafogyasztas = manafogyasztas;
            this.serules = serules;
        }

        public int karakter_id {  get; set; }
        public int kepessegek_id { get; set;}
        public string kepessegekneve { get; set; }
        public string tipusa {  get; set; }
        public int manafogyasztas { get; set; }
        public int serules {  get; set; }

        public override string ToString()
        {
            return $"-Képesség ID: {kepessegek_id}| Képesség neve: {kepessegekneve}| Típusa: {tipusa}| Mana fogyasztás: {manafogyasztas}| Sebzés: {serules}";
        }
    }
}
