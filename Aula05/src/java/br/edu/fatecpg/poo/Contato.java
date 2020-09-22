/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.edu.fatecpg.poo;

/**
 *
 * @author Guilherme
 */
public class Contato {

    private String nome;
    private int tel;
    private String email;

    public Contato(String nome, int tel, String email) {
        this.nome = nome;
        this.tel = tel;
        this.email = email;
    }

    public void setName(String nome) {
        this.nome = nome;
    }

    public void setTelefone(int tel) {
        this.tel = tel;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getNome() {
        return nome;
    }

    public int getTel() {
        return tel;
    }

    public String getEmail() {
        return email;
    }
}
