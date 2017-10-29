/*
 * Proyecto de Ingenieria de Software 2017-1
 * Portal del terapeuta Sistema ATRLO * 
 * MARIO BOLANOS, JUAN SEBASTIAN LOZANO, ANDRES ACHURY * 
 */
package com.ingesoft.controller;
import org.springframework.web.servlet.ModelAndView;
import com.ingesoft.model.Conectar;
import java.util.List;
import org.springframework.web.servlet.mvc.Controller;
//import com.ingesoft.controller.Login;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
//import org.springframework.web.bind.annotation.ModelAttribute;


/**
 *
 * @author mario
 */

public class PortalController{
        private JdbcTemplate jdbcTemplate;
        
        public PortalController(){
            Conectar con = new Conectar();
            this.jdbcTemplate = new JdbcTemplate(con.conectar());
        }
        @RequestMapping("/portal")
        public ModelAndView showPortal(HttpServletRequest request, HttpServletResponse response) {
            ModelAndView mav = new ModelAndView("portal");
            String query = "select * from tbcancha";
            List datos = this.jdbcTemplate.queryForList(query);
            mav.addObject("datos", datos);
//            String qName = jdbcTemplate.queryForObject(
//                query, new Object[] {}, String.class);
            return mav;
        }
        
        
        @RequestMapping(value = "/pacientes", method = RequestMethod.GET)
        public ModelAndView showPacientes(HttpServletRequest request, HttpServletResponse response) {
            ModelAndView mav = new ModelAndView("pacientes");
            return mav;
        }
    
}


