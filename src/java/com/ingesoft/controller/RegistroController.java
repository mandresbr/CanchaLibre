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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
//import org.springframework.web.bind.annotation.ModelAttribute;


/**
 *
 * @author mario
 */
public class RegistroController{
        private JdbcTemplate jdbcTemplate;
    
        public RegistroController(){
            Conectar con = new Conectar();
            this.jdbcTemplate = new JdbcTemplate(con.conectar());
        }
        @RequestMapping(value = "/registro", method = RequestMethod.GET)
        public ModelAndView showRegister(HttpServletRequest request, HttpServletResponse response) throws Exception{
            return new ModelAndView("registro");
        }
        
        @RequestMapping(value = "/registro", method = RequestMethod.POST)
        public ModelAndView showPortal(HttpServletRequest request, HttpServletResponse response) throws Exception
        {
           String userName = request.getParameter("name");
           String userLastName = request.getParameter("lastname");
           String userId = request.getParameter("id");
           String userEmail = request.getParameter("user");
           String password = request.getParameter("pass");
           String query = "select count(*) from tbusuario where cedula=? and clave=?";
           int qCount = jdbcTemplate.queryForObject(
            query, new Object[] {userId,password}, Integer.class);
           if (qCount==0){
                String tQuery = "INSERT INTO tbusuario VALUES (?,?,?,?,?,?)";
                jdbcTemplate.update(
                tQuery, new Object[]{userId,userName,userLastName,userEmail,password,3});
                ModelAndView mav = new ModelAndView("redirect:/portal.htm");
                mav.addObject("nombre", userName);
                return mav;
           }else{
                return new ModelAndView("registro");    
           }
        }
      
       

}
