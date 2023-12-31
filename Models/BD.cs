using System.Data.SqlClient;
using System.Data;
using Dapper;
using TP09.Models;
public class BD{
    private static string _connectionString = @"Server=A-PHZ2-CIDI-050;DataBase=TP09;Trusted_Connection=True;";
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
        using(SqlConnection db = new SqlConnection(_connectionString)){
        string sp = "InsertarUsuario";
        db.Execute(sp, new{Username = Usuario.Username, Password = Usuario.Password,
        Nombre = Usuario.Nombre, Email = Usuario.Email, Telefono = Usuario.Telefono}, commandType: CommandType.StoredProcedure);
        }
    }
    public static Usuario BuscarUsuario(string email, string contraseña){
        Usuario Usuario = null;
        using(SqlConnection db = new SqlConnection(_connectionString)){
        string sp = "BuscarUsuario";
        Usuario = db.QueryFirstOrDefault<Usuario>(sp, new{Email = email, Contraseña = contraseña}, commandType: CommandType.StoredProcedure);
        }
        return Usuario;
    }
}