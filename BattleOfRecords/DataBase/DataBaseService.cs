using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MySqlConnector;

namespace BattleOfRecords.DataBase
{
    internal class DataBaseService
    {
        private static string connectionString;
        private static string table;
        private static string queryParameters;


        public static void DBConnectionCheck(string connectionString)
        {
            try
            {
                using (MySqlConnection connection = new MySqlConnection(connectionString))
                {
                    connection.Open();
                    Console.WriteLine("Sikeres csatlakozás");
                }
            }
            catch (Exception ex)
            {
                {
                    Console.WriteLine("Sikertelen csatlakozás: " + ex.Message);
                }
            }

        }
        public static DataTable GetData(string tabelname, string connectionString)
        {
            using var connection = new MySqlConnection(connectionString);
            connection.Open();
            // Tábla nevének megadása és adatlekérdezés.
            using var command = new MySqlCommand("select * from " + tabelname, connection);
            // Olvassa az adatokat és betölti a DataTable-be.
            using var reader = command.ExecuteReader();
            var dataTable = new DataTable();
            // Betölti az adatokat a DataTable-be
            dataTable.Load(reader);


            // Visszatér a DataTable-lel
            return dataTable;
        }
    }
}
