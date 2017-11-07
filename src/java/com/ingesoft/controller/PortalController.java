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
            String date = request.getParameter("fecha");
            String time = request.getParameter("hora");
            String cedula = request.getParameter("cedula");
            String query = "select codcancha,path,nombre from  (select codcancha from  (select codcancha from tbcancha where codcancha not in (select codcancha from tbreserva where fecha=? and hora=?) ) as temp union (select codcancha from tbcancha natural join tbreserva where fecha=? and hora=? and  canchasdisponibles>0)) as imp natural join tbcancha";
            List datos = this.jdbcTemplate.queryForList(query,new Object[] {date,time,date,time});
            mav.addObject("datos", datos);
            mav.addObject("date", date);
            mav.addObject("time", time);
            mav.addObject("cedula",cedula);
            return mav;
        }
        
    
}


