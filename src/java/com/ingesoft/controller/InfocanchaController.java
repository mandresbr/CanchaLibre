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
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author jonatandiaz
 */
 @Controller
public class InfocanchaController {

    private final JdbcTemplate jdbcTemplate;
    public InfocanchaController(){
        Conectar con = new Conectar();
        this.jdbcTemplate = new JdbcTemplate(con.conectar());
    }
    @RequestMapping(value = "/Infocancha", method = RequestMethod.GET)
    public ModelAndView showCancha(HttpServletRequest request, HttpServletResponse response) throws Exception{
            String cancha= request.getParameter("id");
            String cedula= request.getParameter("cedula");
            String reserva= request.getParameter("Act");
            String nomcancha = request.getParameter("cancha");
            if (reserva!=null){
                ModelAndView mav=new ModelAndView("Infocancha");
                mav.addObject("id",cancha);
                mav.addObject("cedula",cedula);
                mav.addObject("cancha",nomcancha);
                String queryPath = "select path from tbcancha where codcancha=?";
                String qPath = jdbcTemplate.queryForObject(queryPath, new Object[] {cancha}, String.class);
                mav.addObject("path", qPath);
                String queryDir = "select direccion from tbcancha where codcancha=?";
                String qDir = jdbcTemplate.queryForObject(queryDir, new Object[] {cancha}, String.class);
                mav.addObject("dir",qDir);
                String querySomos = "select somos from tbcancha where codcancha=?";
                String qSomos = jdbcTemplate.queryForObject(querySomos, new Object[] {cancha}, String.class);
                mav.addObject("somos",qSomos);
                String queryNom = "select nombre from tbcancha where codcancha=?";
                String nombre = jdbcTemplate.queryForObject(queryNom, new Object[] {cancha}, String.class);
                mav.addObject("nombre",nombre);
                String queryPre = "select precio from tbcancha where codcancha=?";
                String precio = jdbcTemplate.queryForObject(queryPre, new Object[] {cancha}, String.class);
                mav.addObject("precio",precio);
                jdbcTemplate.update("delete from tbreserva where codreserva=?", new Object[] {reserva});
                String consulta = "select fecha,hora,tarifa,nombres,apellidos,cedula,codreserva  from tbreserva natural join tbusuario where codcancha=?";
                List datRe = jdbcTemplate.queryForList(consulta,new Object[] {cancha});
                mav.addObject("datos",datRe);
                return mav;
            }
            else{
                ModelAndView mav=new ModelAndView("Infocancha");
                mav.addObject("id",cancha);
                mav.addObject("cedula",cedula);
                mav.addObject("cancha",nomcancha);
                String queryPath = "select path from tbcancha where codcancha=?";
                String qPath = jdbcTemplate.queryForObject(queryPath, new Object[] {cancha}, String.class);
                mav.addObject("path", qPath);
                String queryDir = "select direccion from tbcancha where codcancha=?";
                String qDir = jdbcTemplate.queryForObject(queryDir, new Object[] {cancha}, String.class);
                mav.addObject("dir",qDir);
                String querySomos = "select somos from tbcancha where codcancha=?";
                String qSomos = jdbcTemplate.queryForObject(querySomos, new Object[] {cancha}, String.class);
                mav.addObject("somos",qSomos);
                String queryNom = "select nombre from tbcancha where codcancha=?";
                String nombre = jdbcTemplate.queryForObject(queryNom, new Object[] {cancha}, String.class);
                mav.addObject("nombre",nombre);
                String queryPre = "select precio from tbcancha where codcancha=?";
                String precio = jdbcTemplate.queryForObject(queryPre, new Object[] {cancha}, String.class);
                mav.addObject("precio",precio);
                String consulta = "select fecha,hora,tarifa,nombres,apellidos,cedula,codreserva  from tbreserva natural join tbusuario where codcancha=?";
                List datRe = jdbcTemplate.queryForList(consulta,new Object[] {cancha});
                mav.addObject("datos",datRe);
                return mav;
            }
            
        }
        @RequestMapping(value = "/Infocancha", method = RequestMethod.POST)
        public ModelAndView guardar(HttpServletRequest request, HttpServletResponse response) throws Exception{
            String nombre= request.getParameter("nombre");
            String direccion= request.getParameter("direccion");
            String somos = request.getParameter("somos");
            String cedula = request.getParameter("cedula");
            String nomcancha= request.getParameter("cancha");
            String precio= request.getParameter("precio");
            String cod= request.getParameter("id");
            String update="update tbcancha set nombre=?, direccion=?, somos=?, precio=? where codcancha=?";
            jdbcTemplate.update(update, new Object[]{nombre,direccion,somos,precio,cod});
            ModelAndView mav=new ModelAndView("redirect:/Infocancha.htm");
            mav.addObject("id",cod);
            mav.addObject("cedula",cedula);
            mav.addObject("cancha",nomcancha);
            return mav;
            
        }
}
