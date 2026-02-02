using BattleOfRecords.DataBase;
using BattleOfRecords.Model;
using System.Data;

internal class Program
{
    public static List<Kepessegek> kepessegek = new List<Kepessegek>();
    public static List<Jatekok> jatekok = new List<Jatekok>();
    public static List<Karakterek> karakterek = new List<Karakterek>();
    public static FileIO.ReadFromFile beolvas = new FileIO.ReadFromFile();
    public static FileIO.WriteToFile beleiras = new FileIO.WriteToFile();
    public static readonly string connectionString = "Server=localhost;Database=battle_of_records;User=root;";
    public static DataTable adatok = new DataTable();
    public static DataTable karak = new DataTable();
    public static DataTable kepesseg = new DataTable();
    private static void Main(string[] args)
    {
        SelectFromTable("jatek", connectionString);
        SelectFromTableTwo("karakter", connectionString);
        SelectFromTableThree("kepesseg", connectionString);
        Adatokbetoltes(adatok);
        AdatokBetolteseTwo(karak);
        AdatokbetoltesThree(kepesseg);


        JatekokKiirasa(jatekok);
        KarakterekKiirasa(karakterek);
        KepessegekKiirasa(kepessegek);

        MeccsKeszites(jatekok, karakterek, kepessegek);
    }

    private static void MeccsKeszites(List<Jatekok> jatekok, List<Karakterek> karakterek, List<Kepessegek> kepessegek)
    {
        Console.WriteLine("\nÍrd le, melyik játék karaktereivel szeretnél játszani:");
        Console.WriteLine("1 - " + jatekok[0].jatekneve);
        Console.WriteLine("2 - " + jatekok[1].jatekneve);
        Console.WriteLine("3 - " + jatekok[2].jatekneve);

        try
        {
            int valasztas = Convert.ToInt32(Console.ReadLine());

            if (valasztas < 1 || valasztas > 3)
            {
                Console.WriteLine("Érvénytelen választás!");
                return;
            }

            int valasztottJatekId = valasztas;

            Console.WriteLine("\nA kiválasztott játék karakterei:");

            foreach (var item in karakterek)
            {
                if (item._jatek_id == valasztottJatekId)
                {
                    Console.WriteLine(
                        $"-Id: {item._jatek_id}| Név: {item.karakterneve} | HP: {item.eletero} | Mana: {item.mana}");
                }
            }
        }
        catch
        {
            Console.WriteLine("Kérlek számot adj meg!");
        }
    }

    private static void KepessegekKiirasa(List<Kepessegek> kepessegek)
    {
        //Console.WriteLine("\n");
        //foreach(var item in kepessegek)
        //{
        //    Console.WriteLine(item.kepessegekneve);
        //}
    }

    private static void AdatokbetoltesThree(DataTable kepesseg)
    {
        foreach (DataRow row in kepesseg.Rows)
        {
            Kepessegek kepesegek = new Kepessegek(Convert.ToInt32(row["karakter_id"]), Convert.ToInt32(row["kepesseg_id"]), Convert.ToString(row["kepessegneve"]), Convert.ToString(row["tipusa"]), Convert.ToInt32(row["manafogyasztas"]), Convert.ToInt32(row["serules"]));
            kepessegek.Add(kepesegek);
        }
    }

    private static void SelectFromTableThree(string tablename, string connectionString)
    {
        kepesseg = DataBaseService.GetData(tablename, connectionString);
    }

    private static void KarakterekKiirasa(List<Karakterek> karakterek)
    {
        //Console.WriteLine("Elérhető karakterek nevei:");
        //Console.WriteLine("\n");
        //foreach (var item in karakterek) { 
        //    Console.WriteLine(item.karakterneve);
        //}
    }

    private static void AdatokBetolteseTwo(DataTable karak)
    {
        foreach (DataRow row in karak.Rows)
        {
            Karakterek karakter = new Karakterek(Convert.ToInt32(row["karakter_id"]), Convert.ToInt32(row["jatek_id"]), Convert.ToInt32(row["mana"]), Convert.ToInt32(row["eletero"]), Convert.ToString(row["karakterneve"]));
            karakterek.Add(karakter);
        }
    }

    private static void SelectFromTableTwo(string tablename, string connectionString)
    {
        karak = DataBaseService.GetData(tablename, connectionString);
    }

    private static void JatekokKiirasa(List<Jatekok> jatekok)
    {
        Console.WriteLine("Játszható játékok nevei:");
        foreach (var item in jatekok)
        {
            Console.WriteLine(item.jatekneve);
        }
    }

    private static void SelectFromTable(string tabelname, string connectionString)
    {
        adatok = DataBaseService.GetData(tabelname, connectionString);
        //Console.WriteLine(".");
    }

    private static void Adatokbetoltes(DataTable adatok)
    {
        foreach (DataRow row in adatok.Rows)
        {
            Jatekok jatek = new Jatekok(Convert.ToInt32(row["jatek_id"]), row["jatekneve"].ToString());
            jatekok.Add(jatek);
        }
    }
 }