/*
 * Proyecto de Ingenieria de Software 2017-1
 * Portal del terapeuta Sistema ATRLO * 
 * MARIO BOLANOS, JUAN SEBASTIAN LOZANO, ANDRES ACHURY * 
 */
package com.ingesoft.controller;


import org.springframework.web.servlet.ModelAndView;
import com.ingesoft.model.Conectar;

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
public class UsuarioController2{
        private JdbcTemplate jdbcTemplate;
    
        public UsuarioController2(){
            Conectar con = new Conectar();
            this.jdbcTemplate = new JdbcTemplate(con.conectar());
        }
        @RequestMapping(value = "/usuario2", method = RequestMethod.GET)
        public ModelAndView showRegister(HttpServletRequest request, HttpServletResponse response) throws Exception{
            ModelAndView mav = new ModelAndView("usuario2");
            String cedula = request.getParameter("cedula");
            mav.addObject("cedulaq",cedula);
            
           String queryName = "select nombres from tbusuario where cedula=?";
           String userName= jdbcTemplate.queryForObject(queryName, new Object[] {cedula},String.class);
           mav.addObject("nombresq",userName);
           String queryLastName = "select apellidos from tbusuario where cedula=?";
           String userLastName= jdbcTemplate.queryForObject(queryLastName, new Object[] {cedula},String.class);
           mav.addObject("apellidosq",userLastName);
           String queryEmail = "select correo from tbusuario where cedula=?";
           String userEmail= jdbcTemplate.queryForObject(queryEmail, new Object[] {cedula},String.class);
           mav.addObject("emailq",userEmail);
           String queryPass = "select clave from tbusuario where cedula=?";
           String userPass= jdbcTemplate.queryForObject(queryPass, new Object[] {cedula},String.class);
           mav.addObject("claveq",userPass);
           
            
            
            return mav;
        }
        
        @RequestMapping(value = "/usuario2", method = RequestMethod.POST)
        public ModelAndView showPortal(HttpServletRequest request, HttpServletResponse response) throws Exception
        {
            String cedula = request.getParameter("cedulat");
            String userName = request.getParameter("nombres");
            String userLastName = request.getParameter("apellidos");
            String userEmail = request.getParameter("email");
            String userPass = request.getParameter("clave");
           
           String tQuery = "update tbusuario set nombres=?, apellidos=?, correo=?, clave=? where cedula=?";
            jdbcTemplate.update(tQuery, new Object[]{userName,userLastName,userEmail,userPass,cedula});
            ModelAndView mav = new ModelAndView("redirect:/propietario.htm");
            mav.addObject("cedula",cedula);
            
            return mav;
           
                
           
        }
        
        
    
       

}
