<%-- 
    Document   : empleados
    Created on : 7/09/2025, 11:35:04 a. m.
    Author     : Programador
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="modelo.Puesto" %>
<%@page  import="java.util.HashMap" %>
<%@page import="modelo.Empleado" %>
<%@page import="javax.swing.table.DefaultTableModel" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Empleados UMG</title>
         <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.13.1/font/bootstrap-icons.min.css">
         
    </head>
    <body class="bg-dark text-white">
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
  <div class="container-fluid">
    <a class="navbar-brand" href="#">UMG</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNavDropdown">
      <ul class="navbar-nav">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="index.html">Inicio</a>
        </li>
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            Menu
          </a>
          <ul class="dropdown-menu">
            <li><a class="dropdown-item" href="empleados.jsp">Empleados</a></li>
            <li><a class="dropdown-item" href="#">Clientes</a></li>
            <li><a class="dropdown-item" href="#">Puestos</a></li>
          </ul>
        </li>
      </ul>
    </div>
  </div>
</nav>
        <h1>Formulario Empleados</h1>
        <div class="container">
            <form action="sr_empleado" method="post" class="row g-3 needs-validation" novalidate>
             <div class="col-md-6">
           <label for="lbl_id" class="form-label">ID</label>
           <input type="text" class="form-control" id="txt_id" name="txt_id" placeholder="Ej: ID:0" value="0" readonly>
           </div>
             <div class="col-md-6">
           <label for="lbl_codigo" class="form-label">Codigo</label>
           <input type="text" class="form-control" id="txt_codigo" name="txt_codigo" placeholder="Ej: E001" pattern="[E]{1}[0-9]{3}" required>
             </div>
             <div class="col-md-4">
           <label for="lbl_nombres" class="form-label">Nombres</label>
           <input type="text" class="form-control" id="txt_nombres" name="txt_nombres" placeholder="Ej: Nombre1 Nombre2" required>
             </div>
             <div class="col-md-4">
           <label for="lbl_apellidos" class="form-label">Apellidos</label>
           <input type="text" class="form-control" id="txt_apellidos" name="txt_apellidos" placeholder="Ej: Apellido1 Apellido2" required>
             </div>
             <div class="col-md-4">
           <label for="lbl_direccion" class="form-label">Direccion</label>
           <input type="text" class="form-control" id="txt_direccion" name="txt_direccion" placeholder="Ej: #casa calle ave." required>
             </div>
             <div class="col-md-4">
           <label for="lbl_telefono" class="form-label">Telefono</label>
           <input type="number" class="form-control" id="txt_telefono" name="txt_telefono" placeholder="Ej: 55554444" required>
             </div>
             <div class="col-md-4">
           <label for="lbl_fn" class="form-label">Fecha Nacimiento</label>
           <input type="date" class="form-control" id="txt_fn" name="txt_fn" placeholder="Ej: YYYY-MM-dd" required>
             </div>
             <div class="col-md-4">
           <label for="lbl_puesto" class="form-label">Puesto</label>
           <select class="form-select" aria-label="Default select example" id="drop_puesto" name="drop_puesto" required>
             <option selected disabled value="">Elige Puesto</option>
           <%
             Puesto puesto = new Puesto();
             HashMap<String,String> drop = puesto.leer();
             for(String i:drop.keySet()){
               out.println("<option value='"+ i +"'>"+ drop.get(i)+"</option>");
               }
          
           %>
             
             
            </select>
             </div>
              <div class="col-md-12">
           <button  class="btn btn-primary btn-lg" id="btn_crear" name="btn_crear" value="crear"><i class="bi bi-floppy-fill"></i> Crear</button>
           <button  class="btn btn-success btn-lg" id="btn_actualizar" name="btn_actualizar" value="actualizar"><i class="bi bi-pencil-fill"></i> Actualizar</button>
           <button  class="btn btn-danger btn-lg" id="btn_borrar" name="btn_borrar" value="borrar"><i class="bi bi-trash3-fill"></i> Borrar</button>
              </div> 
         </form>
            <div class="table-responsive">
                <table class="table table-hover table-dark">
                    <thead>
                        <tr>
                            <th>Codigo</th>
                            <th>Nombres</th>
                            <th>Apellidos</th>
                            <th>Direccion</th>
                            <th>Telefono</th>
                            <th>Nacimiento</th>
                            <th>Puesto</th>
                        </tr>    
                    </thead>
                    <tbody id="tbl_empleados">
                        <% 
                        Empleado empleado = new Empleado();
                        DefaultTableModel tabla = new DefaultTableModel();
                        tabla = empleado.leer();
                        for(int t=0;t<tabla.getRowCount();t++){
                                 out.println("<tr data-id=" + tabla.getValueAt(t, 0) + " data-id_p=" + tabla.getValueAt(t, 8) + " >");
                                 out.println("<td>"+ tabla.getValueAt(t, 1) +"</td>");
                                 out.println("<td>"+ tabla.getValueAt(t, 2) +"</td>");
                                 out.println("<td>"+ tabla.getValueAt(t, 3) +"</td>");
                                 out.println("<td>"+ tabla.getValueAt(t, 4) +"</td>");
                                 out.println("<td>"+ tabla.getValueAt(t, 5) +"</td>");
                                 out.println("<td>"+ tabla.getValueAt(t, 6) +"</td>");
                                 out.println("<td>"+ tabla.getValueAt(t, 7) +"</td>");
                                 out.println("</tr>");    
                            }
                        
                        %>
                    </tbody>
  
                </table>
            </div>
        </div>
        <script>
            // Example starter JavaScript for disabling form submissions if there are invalid fields
(() => {
  'use strict'

  // Fetch all the forms we want to apply custom Bootstrap validation styles to
  const forms = document.querySelectorAll('.needs-validation')

  // Loop over them and prevent submission
  Array.from(forms).forEach(form => {
    form.addEventListener('submit', event => {
      if (!form.checkValidity()) {
        event.preventDefault()
        event.stopPropagation()
      }

      form.classList.add('was-validated')
    }, false)
  })
})()
            
        </script>
        <script src="https://code.jquery.com/jquery-3.7.1.slim.min.js" integrity="sha256-kmHvs0B+OpCW5GVHUNjv9rOmY0IvSIRcf7zGUDTDQM8=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js" integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI" crossorigin="anonymous"></script>
        <script>
            $('#tbl_empleados').on('click','tr td',function(evt){
               var target,id,id_p,codigo,nombres,apellidos,direccion,telefono,nacimiento;
               target = $(event.target);
               id = target.parent().data('id');
               id_p = target.parent().data('id_p');
               codigo = target.parent("tr").find("td").eq(0).html();
               nombres =  target.parent("tr").find("td").eq(1).html();
               apellidos = target.parent("tr").find("td").eq(2).html();
               direccion =  target.parent("tr").find("td").eq(3).html();
               telefono = target.parent("tr").find("td").eq(4).html();
               nacimiento = target.parent("tr").find("td").eq(5).html();
               
               
               $("#txt_id").val(id);
               $("#drop_puesto").val(id_p);
               $("#txt_codigo").val(codigo);
               $("#txt_nombres").val(nombres);
               $("#txt_apellidos").val(apellidos);
               $("#txt_direccion").val(direccion);
               $("#txt_telefono").val(telefono);
               $("#txt_fn").val(nacimiento);
               
               
            });
        </script>
    
    </body>
</html>
