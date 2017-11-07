/*
 * Proyecto de Ingenieria de Software 2017-1
 * Portal del terapeuta Sistema ATRLO * 
 * MARIO BOLANOS, JUAN SEBASTIAN LOZANO, ANDRES ACHURY * 
 */
package com.ingesoft.controller;

import com.ingesoft.model.Conectar;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
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
public class ReservaController {
        private JdbcTemplate jdbcTemplate;
    
        public ReservaController(){
            Conectar con = new Conectar();
            this.jdbcTemplate = new JdbcTemplate(con.conectar());
        }

        @RequestMapping(value = "/reserva", method = RequestMethod.GET)
        public ModelAndView showPortal(HttpServletRequest request, HttpServletResponse response) {
            ModelAndView mav = new ModelAndView("reserva");
            String cedula = request.getParameter("cedula");
            mav.addObject("cedula",cedula);
            return mav;
               
        } 
        @RequestMapping(value = "/reserva", method = RequestMethod.POST)
        public ModelAndView show(HttpServletRequest request, HttpServletResponse response) throws Exception
        {
            String date = request.getParameter("date");
            String time = request.getParameter("time");
            String cedula = request.getParameter("cedula");
            String cancha = request.getParameter("id");
            String query = "select * from (select codcancha from tbcancha where codcancha not in (select codcancha from tbreserva where fecha=? and hora=?)) as temp union (select codcancha from tbcancha natural join tbreserva where fecha=? and hora=? and  canchasdisponibles>0)";
            List datos = this.jdbcTemplate.queryForList(query,new Object[] {date,time,date,time});
            ModelAndView mav= new ModelAndView("redirect:/portal.htm"); 
            mav.addObject("fecha",date);
            mav.addObject("hora",time);
            mav.addObject("cedula",cedula);
            
            String update = "update tbcancha set canchasdisponibles=canchasdisponibles-1 where tbcancha.codcancha=?";
            jdbcTemplate.update(update, new Object[]{cancha});
            return mav;
        }
        
}
