package co.udea.fundsistemas.puntosdeventa.dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.Driver;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;

public class BDConnection {

    private Connection conexion;

    public BDConnection(String driver, String host, String usuario, String clave)
            throws SQLException, InstantiationException, IllegalAccessException, ClassNotFoundException {
        DriverManager.registerDriver((Driver) Class.forName(driver).newInstance());
        this.conexion = DriverManager.getConnection(host, usuario, clave);
    }

    public Statement getStatement()
            throws SQLException {
        return this.conexion.createStatement();
    }

    public CallableStatement getCallableStatement(String sql)
            throws SQLException {
        return this.conexion.prepareCall(sql);
    }

    public PreparedStatement getPreparedStatement(String sql)
            throws SQLException {
        return this.conexion.prepareStatement(sql);
    }

    public void cerrarConexion()
            throws SQLException {
        if (this.conexion != null) {
            this.conexion.close();
        }
    }
}
