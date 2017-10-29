/*
 * Proyecto de Ingenieria de Software 2017-1
 * Portal del terapeuta Sistema ATRLO * 
 * MARIO BOLANOS, JUAN SEBASTIAN LOZANO, ANDRES ACHURY * 
 */
package com.ingesoft.controller;

import com.ingesoft.model.Conectar;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author mario
 */
public class CanchaController {
        private JdbcTemplate jdbcTemplate;
    
        public CanchaController(){
            Conectar con = new Conectar();
            this.jdbcTemplate = new JdbcTemplate(con.conectar());
        }
        @RequestMapping(value = "/cancha", method = RequestMethod.GET)
        public ModelAndView showCancha(HttpServletRequest request, HttpServletResponse response) throws Exception{
            String idCancha = request.getParameter("id");
            String queryPath = "select path from tbcancha where codcancha=?";
            String queryName = "select nombre from tbcancha where codcancha=?";
            String queryDir = "select direccion from tbcancha where codcancha=?";
            
            String qPath = jdbcTemplate.queryForObject(
                queryPath, new Object[] {idCancha}, String.class);
            String qName = jdbcTemplate.queryForObject(
                queryName, new Object[] {idCancha}, String.class);
            String qDir = jdbcTemplate.queryForObject(
                queryDir, new Object[] {idCancha}, String.class);
            
            ModelAndView mav = new ModelAndView("cancha");
            mav.addObject("path", qPath);
            mav.addObject("name",qName);
            mav.addObject("dir",qDir);
            mav.addObject("id",idCancha);
            return mav;
        }
        
}
