package DTO;

public class FornecedorDTO {
    
    private int senha;
    private String cor;
    private String nome_motorista;
    private String transportadora;
    private String fornecedor;
    private String placa;
    private int doca;
    private int carga_paletizada;
    private int paletizacao;
    private int aplicacao;
    private double total;

    public int getSenha() {
        return senha;
    }

    public void setSenha(int senha) {
        this.senha = senha;
    }

    public String getNome_motorista() {
        return nome_motorista;
    }

    public void setNome_motorista(String nome_motorista) {
        this.nome_motorista = nome_motorista;
    }

    public String getTransportadora() {
        return transportadora;
    }

    public void setTransportadora(String transportadora) {
        this.transportadora = transportadora;
    }

    public String getFornecedor() {
        return fornecedor;
    }

    public void setFornecedor(String fornecedor) {
        this.fornecedor = fornecedor;
    }

    public String getPlaca() {
        return placa;
    }

    public void setPlaca(String placa) {
        this.placa = placa;
    }

    public int getDoca() {
        return doca;
    }

    public void setDoca(int doca) {
        this.doca = doca;
    }

    public int getCarga_paletizada() {
        return carga_paletizada;
    }

    public void setCarga_paletizada(int carga_paletizada) {
        this.carga_paletizada = carga_paletizada;
    }

    public int getPaletizacao() {
        return paletizacao;
    }

    public void setPaletizacao(int paletizacao) {
        this.paletizacao = paletizacao;
    }

    public int getAplicacao() {
        return aplicacao;
    }

    public void setAplicacao(int aplicacao) {
        this.aplicacao = aplicacao;
    }

    public double getTotal() {
        return total;
    }

    public void setTotal(double total) {
        this.total = total;
    }

    public String getCor() {
        return cor;
    }

    public void setCor(String cor) {
        this.cor = cor;
    }

    public void setCor() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
  
}
