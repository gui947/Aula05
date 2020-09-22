<%-- 
    Document   : index
    Created on : 21 de set de 2020, 22:43:25
    Author     : Guilherme
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="br.edu.fatecpg.poo.Contato"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastro de Contatos</title>
    </head>
    <body>
        <h1>Cadastro de Contatos</h1><br>
        <%
            ArrayList<Contato> lc = (ArrayList) application.getAttribute("lc");
            if (lc == null) {
                lc = new ArrayList<>();
                lc.add(new Contato("Test1", 532525252, "test1@admin.com"));
                lc.add(new Contato("Test2", 77474342, "test2@admin.com"));
                application.setAttribute("lc", lc);
            }
            if (request.getParameter("adicionar") != null) {
                String name = request.getParameter("nome");
                int telefone = Integer.parseInt(request.getParameter("telefone"));
                String email = request.getParameter("email");
                lc.add(new Contato(name, telefone, email));
                response.sendRedirect(request.getRequestURI());
            }
            if (request.getParameter("remove") != null) {
                int x = Integer.parseInt(request.getParameter("x"));
                lc.remove(x);
                response.sendRedirect(request.getRequestURI());
            }
        %>
        <form>
            <label for="name">Nome</label>
            <input type="text" name="nome" id="nome" />
            <label for="telefone">Telefone</label>
            <input type="number" maxlength="11" name="tel" id="tel" />
            <label for="email">E-mail</label>
            <input type="email" name="email" id="email" />
            <input type="submit" name="adicionar" value="Adicionar" />
        </form><br>
        <table border="1">
            <thead>
                <tr>
                    <th>Índice</th>
                    <th>Nome</th>
                    <th>Telefone</th>
                    <th>E-mail</th>
                </tr>
            </thead>
            <tbody>
                <% for (int x = 0; x < lc.size(); x++) {%>
                <tr>
                    <td><%=x + 1%></td>
                    <% Contato c = lc.get(x);%>
                    <td><%=c.getNome()%></td>
                    <td><%=c.getTel()%></td>
                    <td><%=c.getEmail()%></td>
                    <td>
                        <form>
                            <input type="hidden" name="x" value="<%= x%>"/>
                            <input type="submit" name="remove" value="Remover"/>
                        </form>
                    </td>
                </tr>
                <% }%>
            </tbody>
        </table>
    </body>
</html>
