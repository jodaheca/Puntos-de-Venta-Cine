

package co.udea.fundsistemas.puntosdeventa.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.ResourceBundle;
import java.util.logging.Level;
import java.util.logging.Logger;

    //  clase que realiza la conexion a la base de datos.
public class BDConexion {

    private static final String CONFIGURATION_FILE = "co.udea.fundsistemas.puntosdeventa.dao.propiedadesBase";
    private static final String STATEMENTS_FILE = "co.udea.fundsistemas.puntosdeventa.dao.statements";
    private static final ResourceBundle propiedades = ResourceBundle.getBundle("co.udea.fundsistemas.puntosdeventa.dao.propiedadesBase");
    private static final ResourceBundle statements = ResourceBundle.getBundle("co.udea.fundsistemas.puntosdeventa.dao.statements");

    private Connection connection = null;

    public BDConexion() {
        // toma todas las propiedades de la base de datos especificadas en el archivo propiedadesBase.properties
        String driver = getPropiedad("DriverBaseDeDatos");
        String url = getPropiedad("URLConexion") + getPropiedad("NombreBaseDeDatos");
        String user = getPropiedad("UsuarioBaseDeDatos");
        String password = getPropiedad("ContrasenaBaseDeDatos");
        try {
            try {
                Class.forName(driver);
            } catch (ClassNotFoundException ex) {
                Logger.getLogger(BDConexion.class.getName()).log(Level.SEVERE, null, ex);
            }
            if (this.connection == null) {
                this.connection = DriverManager.getConnection(url, user, password);
            }
        } catch (SQLException ex) {
            Logger.getLogger(BDConexion.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public static String getPropiedad(String nombre) {
        String valor = propiedades.getString(nombre);
        return valor;
    }

    public static String getStatement(String nombre) {
        String valor = statements.getString(nombre);
        return valor;
    }

    public void closeConnection() {
        try {
            if (this.connection != null) {
                this.connection.close();
            }
        } catch (SQLException sqlException) {
            System.err.println(sqlException);
        }
    }

    public Connection getConnection() {
        return this.connection;
    }
}
