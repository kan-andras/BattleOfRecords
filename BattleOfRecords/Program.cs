using BattleOfRecords.Model;
using System.Data;

internal class Program
{
    public static List<Karakterek> karakterek = new List<Karakterek>();
    public static FileIO.ReadFromFile beolvas = new FileIO.ReadFromFile();
    public static FileIO.WriteToFile beleiras = new FileIO.WriteToFile();
    public static readonly string connectionString = "Server=localhost;Database=battle_of_records;User=root;";
    public static DataTable adatok = new DataTable();
    private static void Main(string[] args)
    {
        SelectFromTable("orszagok", connectionString);
        Adatokbetoltes(adatok);
    }

    private static void SelectFromTable(string v, string connectionString)
    {
        adatok = DatabaseServices.GetData(tablename, connectionString);
        Console.WriteLine(".");
    }

    private static void Adatokbetoltes(DataTable adatok)
    {
        foreach (DataRow row in adatok.Rows)
        {
            Orszag orszag = new Orszag();
            orszag.id = row.Field<int>(0);
            orszag.orszag = row.Field<string>(1);
            orszag.fovaros = row.Field<string>(2);
            orszag.foldr_hely = row.Field<string>(3);
            orszag.terulet = row.Field<double>(4);
            orszag.allamforma = row.Field<string>(5);
            orszag.nepesseg = row.Field<int>(6);
            orszag.nep_fovaros = row.Field<int>(7);
            orszag.autojel = row.Field<string>(8);
            orszag.country = row.Field<string>(9);
            orszag.capital = row.Field<string>(10);
            orszag.penznem = row.Field<string>(11);

        }
    }
}