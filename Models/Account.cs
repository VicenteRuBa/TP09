using TP09.Models;
public static class Account{

    public static List<Usuario> ObtenerUsuarios(){
        return BD.LevantarUsuarios();
    }
    public static void ActualizarContraseña(Usuario Usuario, string NuevaContra){
        BD.ActualizarContraseña(Usuario.ID, NuevaContra);
    }
    public static void IngresarUsuario(Usuario Usuario)
    {
        BD.InsertarUsuario(Usuario);
    }
}