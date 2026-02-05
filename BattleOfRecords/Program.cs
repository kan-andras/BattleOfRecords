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
    public static int kinyert = 0;
    private static string firstplayer = "";
    private static string secondplayer = "";
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

        MeccsKeszites(jatekok, karakterek, kepessegek, ref kinyert, ref firstplayer, ref secondplayer);

    }

    private static void MeccsKeszites(List<Jatekok> jatekok, List<Karakterek> karakterek, List<Kepessegek> kepessegek, ref int kinyert, ref string player1, ref string player2)
    {
        Console.WriteLine("\nÍrd le, melyik játék karaktereivel szeretnél játszani:");

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
                    Console.WriteLine(item);
                }
            }
            Console.WriteLine("\nÍrja be az első játékos a kívánt karakter indexét a listából:");
            int karakterIndex = Convert.ToInt32(Console.ReadLine());
            var firstselectedKarakter = karakterek.Find(k => k._karakter_id == karakterIndex && k._jatek_id == valasztottJatekId);
            if (firstselectedKarakter == null)
            {
                Console.WriteLine("Érvénytelen karakter választás!");
                return;
            }
            Console.WriteLine($"\nElérhető képességek:");
            foreach (var item in kepessegek)
            {
                if (item.karakter_id == firstselectedKarakter._karakter_id)
                {
                    Console.WriteLine(item);
                }
            }
            Console.WriteLine("\nÍrja be a második játékos a kívánt karakter indexét a listából:");
            int karakterrIndex = Convert.ToInt32(Console.ReadLine());
            var secondselectedKarakter = karakterek.Find(k => k._karakter_id == karakterrIndex && k._jatek_id == valasztottJatekId);
            if (secondselectedKarakter == null || secondselectedKarakter == firstselectedKarakter)
            {
                Console.WriteLine("Érvénytelen karakter választás!");
                return;
            }
            Console.WriteLine($"\nElérhető képességek:");
            foreach (var item in kepessegek)
            {
                if (item.karakter_id == secondselectedKarakter._karakter_id)
                {
                    Console.WriteLine(item);
                }
            }
            Console.WriteLine($"\nA Harc elkezdődött!");
            Console.WriteLine($"\n{firstselectedKarakter.karakterneve} vs {secondselectedKarakter.karakterneve}");
            Console.WriteLine($"Sok szerencsét mindkét játékosnak!");
            Console.WriteLine("Válasszátok ki az első képességet, amivel támadtok!");
            Console.WriteLine("Az első játékos választ képességet (Válassz a karakterednek meghatározott képességet a képességek kőzül a képesség indexével.):");
            try
            {
                int firstkepessegIndex = Convert.ToInt32(Console.ReadLine());
                var firstselectedKepesseg = kepessegek.Find(k => k.kepessegek_id == firstkepessegIndex && k.karakter_id == firstselectedKarakter._karakter_id);
                if (firstselectedKepesseg == null)
                {
                    Console.WriteLine("Érvénytelen képesség választás!");
                    return;
                }
                Console.WriteLine($"Az első játékos a {firstselectedKepesseg.kepessegekneve} képességet választotta!");
                Console.WriteLine("Most a második játékos következik:");
                int secondkepessegIndex = Convert.ToInt32(Console.ReadLine());
                var secondselectedKepesseg = kepessegek.Find(k => k.kepessegek_id == secondkepessegIndex && k.karakter_id == secondselectedKarakter._karakter_id);
                if (secondselectedKepesseg == null || secondselectedKepesseg == firstselectedKepesseg)
                {
                    Console.WriteLine("Érvénytelen képesség választás!");
                    return;
                }
                Console.WriteLine($"A második játékos a {secondselectedKepesseg.kepessegekneve} képességet választotta!");

                Console.WriteLine($"\nAz első játékos támad!");
                secondselectedKarakter.eletero -= firstselectedKepesseg.serules;
                firstselectedKepesseg.manafogyasztas -= firstselectedKepesseg.manafogyasztas;
                Console.WriteLine($"\nNeve: {secondselectedKarakter.karakterneve} életereje: {secondselectedKarakter.eletero}");
                Console.WriteLine($"Az első játékos manája: {firstselectedKarakter.mana}");

            }
            catch
            {
                Console.WriteLine("Hiba a képesség választásnál!");
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
            Console.WriteLine(item);
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