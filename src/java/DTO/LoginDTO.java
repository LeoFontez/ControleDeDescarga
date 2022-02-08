package DTO;

public class LoginDTO {

    private int cod_login;
    private String user_login;
    private String pass_login;
    
    public int getCod_login() {
        return cod_login;
    }

    public void setCod_login(int cod_login) {
        this.cod_login = cod_login;
    }

    public String getUser_login() {
        return user_login;
    }

    public void setUser_login(String user_login) {
        this.user_login = user_login;
    }

    public String getPass_login() {
        return pass_login;
    }

    public void setPass_login(String pass_login) {
        this.pass_login = pass_login;
    }

}
