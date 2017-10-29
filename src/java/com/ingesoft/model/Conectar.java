/*
 * Proyecto de Ingenieria de Software 2017-1
 * Portal del terapeuta Sistema ATRLO * 
 * MARIO BOLANOS, JUAN SEBASTIAN LOZANO, ANDRES ACHURY * 
 */
package com.ingesoft.model;

import org.springframework.jdbc.datasource.DriverManagerDataSource;

/**
 *
 * @author mario
 */
public class Conectar {
    public DriverManagerDataSource conectar(){
        DriverManagerDataSource dataSource = new DriverManagerDataSource();
        dataSource.setDriverClassName("com.mysql.jdbc.Driver");
        dataSource.setUrl("jdbc:mysql://localhost/bdcanchalibre");
        dataSource.setUsername("root");
        dataSource.setPassword("");
        return dataSource;
    }
}
