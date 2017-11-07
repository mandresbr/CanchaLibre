/*
 * Proyecto de Ingenieria de Software 2017-1
 * Portal del terapeuta Sistema ATRLO * 
 * MARIO BOLANOS, JUAN SEBASTIAN LOZANO, ANDRES ACHURY * 
 */
package com.ingesoft.controller;

import com.ingesoft.model.Conectar;
import javax.mail.PasswordAuthentication;
import java.util.List;
import java.util.Properties;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
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

    public CanchaController() {
        Conectar con = new Conectar();
        this.jdbcTemplate = new JdbcTemplate(con.conectar());
    }

    @RequestMapping(value = "/cancha", method = RequestMethod.GET)
    public ModelAndView showCancha(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String idCancha = request.getParameter("id");
        String fecha = request.getParameter("fecha");
        String hora = request.getParameter("hora");
        String cedula = request.getParameter("cedula");
        String queryPath = "select path from tbcancha where codcancha=?";
        String queryName = "select nombre from tbcancha where codcancha=?";
        String queryDir = "select direccion from tbcancha where codcancha=?";
        String queryPrice = "select precio from tbcancha where codcancha=?";
        
        String qPrice = jdbcTemplate.queryForObject(
                queryPrice, new Object[]{idCancha}, String.class);

        String qPath = jdbcTemplate.queryForObject(
                queryPath, new Object[]{idCancha}, String.class);
        String qName = jdbcTemplate.queryForObject(
                queryName, new Object[]{idCancha}, String.class);
        String qDir = jdbcTemplate.queryForObject(
                queryDir, new Object[]{idCancha}, String.class);

        ModelAndView mav = new ModelAndView("cancha");
        mav.addObject("path", qPath);
        mav.addObject("name", qName);
        mav.addObject("dir", qDir);
        mav.addObject("id", idCancha);
        mav.addObject("fecha", fecha);
        mav.addObject("hora", hora);
        mav.addObject("cedula", cedula);
        mav.addObject("precio", qPrice);
        return mav;
    }

    @RequestMapping(value = "/cancha", method = RequestMethod.POST)
    public ModelAndView show(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String date = request.getParameter("fecha");
        String hora = request.getParameter("hora");
        String cancha = request.getParameter("id");
        //String direccion = request.getParameter("direccion");
        String cedula = request.getParameter("cedula");
        String tQuery = "INSERT INTO tbreserva(fecha,cedula,codcancha,hora,tarifa) VALUES (?,?,?,?,?)";
        jdbcTemplate.update(tQuery, new Object[]{date, cedula, cancha, hora, "50000"});
        String update = "update tbcancha set canchasdisponibles=canchasdisponibles-1 where tbcancha.codcancha=?";
        jdbcTemplate.update(update, new Object[]{cancha});
        
        ModelAndView mav = new ModelAndView("redirect:/reserva.htm");
        mav.addObject("cedula", cedula);
        sendMail(date,hora,cancha,cedula);
        return mav;

    }

    public void sendMail(String fecha,String hora,String idcancha,String cedula) {
        final String username = "canchalibrepuj@gmail.com";
        final String password = "dabg123456789";

        String query1 = "select correo from tbusuario where cedula=?";
        String qCorreo = jdbcTemplate.queryForObject(
                query1, new Object[]{cedula}, String.class);
        String query2 = "select nombre from tbcancha where codcancha=?";
        String qName = jdbcTemplate.queryForObject(
                query2, new Object[]{idcancha}, String.class);
        
        
        
        
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
            message.setSubject("Confirmación de Reserva");
            message.setText("Querido usuario,"
                    + "\n\n Tu reserva en " + qName+ " ha sido almacenada satisfactoriamente!"
                    + "\n\n Fecha: "+ fecha
                    +"\n Hora: "+ hora+"\n\n");

            Transport.send(message);

            System.out.println("Done");

        } catch (MessagingException e) {
            throw new RuntimeException(e);
        }
    }
}
