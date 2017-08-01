
package controle;

import dao.LoginDao;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import modelo.Login;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller("/log")
public class LoginControle {
    
    @RequestMapping(value="/login.htm", method = RequestMethod.GET)
    public String chamarLogin(@ModelAttribute("login") Login login, HttpSession session){
        
         String token = (String) session.getAttribute("token");
        
        if(token!=null && token.equals("aprovado")){
            return "index";
        }
        
        return"login";
    }
    
    
    @RequestMapping(value="/logar.htm", method = RequestMethod.POST)
    public String logar(@ModelAttribute("login") Login login, 
    HttpSession session){
    
        LoginDao dao = new LoginDao();
        if(dao.validarUsuario(login)){
            session.setAttribute("token", "aprovado");
        return"index";  
    }else{
            return "login";
            }
    }
    
    @RequestMapping(value="/entrarCadastroLogin.htm", method = RequestMethod.GET)
    public String entrarCadastroLogin(
            @ModelAttribute("login") Login login){
        
        return "cadastroLogin";
    }
    
    @RequestMapping(value="/cadastrarLogin.htm", method = RequestMethod.POST)
    public String cadastrarLogin(
            @ModelAttribute("login") Login login, HttpServletRequest req){
        LoginDao dao = new LoginDao();
        dao.cadastrarLogin(login);
        req.setAttribute("msg", "Usuário cadastrado com sucesso");
        return "login";
    }
}
