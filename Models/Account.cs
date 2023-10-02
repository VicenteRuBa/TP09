public static class Account{
    private static List<Usuario> listaUsuarios;
    public static void IniciarPrograma(){
        listaUsuarios = BD.LevantarUsuarios;
    }
    public static List<Usuario> ObtenerUsuarios(){
        return listaUsuarios;
    }
}