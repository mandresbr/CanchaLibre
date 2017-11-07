/*
 * Proyecto de Ingenieria de Software 2017-1
 * Portal del terapeuta Sistema ATRLO * 
 * MARIO BOLANOS, JUAN SEBASTIAN LOZANO, ANDRES ACHURY * 
 */
package com.ingesoft.controller;


import org.springframework.web.servlet.ModelAndView;
import com.ingesoft.model.Conectar;
import org.springframework.web.servlet.mvc.Controller;
//import com.ingesoft.controller.Login;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.jdbc.core.JdbcTemplate;
//import org.springframework.web.bind.annotation.ModelAttribute;


/**
 *
 * @author mario
 */
public class LoginController implements Controller{
        private JdbcTemplate jdbcTemplate;
        
        public LoginController(){
            
            Conectar con = new Conectar();
            this.jdbcTemplate = new JdbcTemplate(con.conectar());
        }
        @Override
        public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception
        {
           String userName = request.getParameter("user");
           String password = request.getParameter("pass");
           String query = "select count(*) from tbusuario where correo=? and clave=?";
           int qCount = jdbcTemplate.queryForObject(
            query, new Object[] {userName,password}, Integer.class);
           
           if (qCount>0)
           {
                
                String id="select cedula from tbusuario where correo=? and clave=?";
                    String cedula=jdbcTemplate.queryForObject(id,new Object[]{userName,password},String.class);
                String Query = "select codtipousuario from tbusuario where clave=?";
                int q = jdbcTemplate.queryForObject(Query, new Object[] {password},Integer.class);
                if (q==2){
                    ModelAndView mav = new ModelAndView("redirect:/propietario.htm");
                   
                    mav.addObject("cedula", cedula);
                    return mav;
                }else{
                    
                    ModelAndView mav = new ModelAndView("redirect:/reserva.htm");
                    mav.addObject("cedula",cedula);
                    return mav;
                }
               
           }else{
             return new ModelAndView("login");
           }

        }
       

}
