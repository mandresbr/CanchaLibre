/*
 * Proyecto de Ingenieria de Software 2017-1
 * Portal del terapeuta Sistema ATRLO * 
 * MARIO BOLANOS, JUAN SEBASTIAN LOZANO, ANDRES ACHURY * 
 */
package com.ingesoft.controller;


import org.springframework.web.servlet.ModelAndView;
import com.ingesoft.model.Conectar;
import java.util.Properties;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
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
public class ContactenosController2{
        private JdbcTemplate jdbcTemplate;
    
        public ContactenosController2(){
            Conectar con = new Conectar();
            this.jdbcTemplate = new JdbcTemplate(con.conectar());
        }
        @RequestMapping(value = "/contactenos2", method = RequestMethod.GET)
        public ModelAndView showRegister(HttpServletRequest request, HttpServletResponse response) throws Exception{
            ModelAndView mav = new ModelAndView("contactenos2");
            String cedula = request.getParameter("cedula");
            mav.addObject("cedula",cedula);
            return mav;
        }
        
        @RequestMapping(value = "/contactenos2", method = RequestMethod.POST)
        public ModelAndView showPortal(HttpServletRequest request, HttpServletResponse response) throws Exception
        {
            String cedula = request.getParameter("cedula");
           String userName = request.getParameter("nombres");
           String userLastName = request.getParameter("apellidos");
           String userEmail = request.getParameter("email");
           String comments = request.getParameter("comentarios");
           String query = "select count(*) from tbusuario where cedula=? and clave=?";
           
           
           String tQuery = "INSERT INTO tbcontactenos VALUES (?,?,?,?)";
            jdbcTemplate.update(
            tQuery, new Object[]{userName,userLastName,userEmail,comments});
            ModelAndView mav = new ModelAndView("redirect:/contactenos2.htm");
            mav.addObject("cedula",cedula);
            sendMail(cedula);
            return mav;
           
                
           
        }
        
        public void sendMail(String cedula) {
        final String username = "canchalibrepuj@gmail.com";
        final String password = "dabg123456789";

        String query1 = "select correo from tbusuario where cedula=?";
        String qCorreo = jdbcTemplate.queryForObject(
                query1, new Object[]{cedula}, String.class);
       
        
        
        
        
        Properties props = new Properties();
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.smtp.host", "smtp.gmail.com");
                props.put("mail.smtp.ssl.trust", "smtp.gmail.com");
		props.put("mail.smtp.port", "587");

        Session session = Session.getInstance(props,
                new javax.mail.Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(username, password);
            }
        });

        try {

            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress("canchalibrepuj@gmail.com"));
            message.setRecipients(Message.RecipientType.TO,
                    InternetAddress.parse(qCorreo));
            message.setSubject("Gracias por contactar a Cancha Libre");
            message.setText("Querido usuario,"
                    + "\n\n Gracias por comunicarte con el equipo de Cancha Libre\n"
                    + "Pronto nos pondremos en contacto contigo para darte soporte.\n"
                    + "Saludos,\n\n"
                    + "DABG, el equipo de Cancha Libre.");

            Transport.send(message);

            System.out.println("Done");

        } catch (MessagingException e) {
            throw new RuntimeException(e);
        }
    }
      
       

}
