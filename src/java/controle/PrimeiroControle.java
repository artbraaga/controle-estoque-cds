/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controle;

import dao.CdDao;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import modelo.Cd;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author DesenvolvedorJava
 */
@Controller("/primeiro")
public class PrimeiroControle {
    
    @RequestMapping(value="/index.htm", method = RequestMethod.GET)
    public String chamarIndex(HttpServletRequest req)
    {
        return "index";
    }
    
    @RequestMapping(value="/preparaCadastrarCd.htm", method = RequestMethod.GET)
    public String preparaCadastrarCd(@ModelAttribute("cd") Cd cd)
    {
        return "cadastroCd";
    }
    
    @RequestMapping(value="/cadastrarCd.htm", method = RequestMethod.POST)
    public String cadastrarCd(@ModelAttribute("cd") Cd cd)
    {
        CdDao cdao = new CdDao();
        cdao.cadastrarCd(cd);
        
        return "index";
    }
    
    @RequestMapping(value="/editarCd.htm", method = RequestMethod.POST)
    public String editarCd(@ModelAttribute("cd") Cd cd)
    {
        CdDao cdao = new CdDao();
        cdao.editarCd(cd);
        
        return "index";
    }
    
    @RequestMapping(value="/listarCds.htm", method = RequestMethod.GET)
    public String listarCds(HttpServletRequest req){
        CdDao cdao = new CdDao();
        List<Cd> lista = cdao.listarCds();
        req.setAttribute("listaCds", lista);
        req.setAttribute("cd", new Cd());
        return "listarCds";
    }
    
  
    @RequestMapping(value="/excluirCd.htm", method = RequestMethod.GET)
    public String excluirCd(HttpServletRequest req,
    @RequestParam("id") String id){
        
        CdDao cdao = new CdDao();
        cdao.excluirCd(Integer.parseInt(id));
        List<Cd> listaCds = cdao.listarCds();
        req.setAttribute("listaCds", listaCds);
        
        return "index";
    }
}
