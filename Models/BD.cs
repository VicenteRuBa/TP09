using System.Data.SqlClient;
using System.Data;
using Dapper;
using TP09.Models;
public class BD{
    private static string _connectionString = @"Server=A-PHZ2-AMI-006;DataBase=TP09;Trusted_Connection=True;";
    public static List<Usuario> LevantarUsuarios(){
        List<Usuario> listaUsuarios;
        using(SqlConnection db = new SqlConnection(_connectionString)){
        string sp = "LevantarUsuarios";
        listaUsuarios = db.Query<Usuario>(sp, commandType: CommandType.StoredProcedure).ToList();
        }
        return listaUsuarios;
    }
    public static void ActualizarContraseña(int ID, string NuevaContra){
        string sp = "ActualizarContraseña";
        using(SqlConnection db = new SqlConnection(_connectionString)){
        db.Execute(sp, new{IdUsuario = ID, NuevaContraseña = NuevaContra}, commandType: CommandType.StoredProcedure);
        }
    }
    public static void InsertarUsuario(Usuario Usuario){
        string sp = "InsertarUsuario";
        using(SqlConnection db = new SqlConnection(_connectionString)){
        db.Execute(sp, new{Username = Usuario.Username, Password = Usuario.Password,
        Nombre = Usuario.Nombre, Email = Usuario.Email, Telefono = Usuario.Telefono}, commandType: CommandType.StoredProcedure);
        }
    }
}