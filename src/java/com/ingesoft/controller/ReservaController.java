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
import org.springframework.web.bind.annotation.RequestParam;
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

        @RequestMapping(value = "/reserva",method = RequestMethod.GET)
        public ModelAndView showReserva(HttpServletRequest request, HttpServletResponse response) throws Exception{
            
            String idCancha = request.getParameter("id");
            //String tempReserva = request.getParameter("temp");
            //String date = request.getParameter("date");
            ModelAndView mav = new ModelAndView("reserva");
            mav.addObject("id",idCancha);
            //mav.addObject("date",date);
            
            String queryPath = "select path from tbcancha where codcancha=?";
            String queryName = "select nombre from tbcancha where codcancha=?";
            String queryDir = "select direccion from tbcancha where codcancha=?";

            String qPath = jdbcTemplate.queryForObject(
                queryPath, new Object[] {idCancha}, String.class);
            String qName = jdbcTemplate.queryForObject(
                queryName, new Object[] {idCancha}, String.class);
            String qDir = jdbcTemplate.queryForObject(
                queryDir, new Object[] {idCancha}, String.class);


            mav.addObject("path", qPath);
            mav.addObject("name",qName);
            mav.addObject("dir",qDir);
            return mav;
            
        }
                
        @RequestMapping(value = "/reserva",method = RequestMethod.POST)
        public ModelAndView showPortal(HttpServletRequest request, HttpServletResponse response) throws Exception
        {
            String date = request.getParameter("date");
            String idCancha = request.getParameter("id");
            String time = request.getParameter("time");
            String ced = request.getParameter("cedula");
            String comments = request.getParameter("comentarios");
            String queryDate2 = "select count(*) from tbreserva where fecha=? and horainicio=?";
            boolean temp = true;
            int qCount = jdbcTemplate.queryForObject(
            queryDate2, new Object[] {date,time}, Integer.class);
            
            if (qCount==0){
                
                String tQuery = "INSERT INTO tbreserva (fecha,cedula,codcancha,horainicio,comentarios) VALUES (?,?,?,?,?)";
                jdbcTemplate.update(
                tQuery, new Object[]{date,ced,idCancha,time,comments});
                ModelAndView mav = new ModelAndView("redirect:/portal.htm");
                mav.addObject(temp);
                return mav;
            }
            else{
                return new ModelAndView("reserva");
            }
            
            
            
        }
        
}
