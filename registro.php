<?php

  require 'config/config.php';
  require 'config/database.php';
  require 'clases/clienteFunciones.php';

  $db = new Database();
  $con = $db->conectar();

  $errors =[];

  if(!empty($_POST)){

    $nombres = trim($_POST['nombres']);
    $apellidos = trim($_POST['apellidos']);
    $email = trim($_POST['email']);
    $telefono = trim($_POST['telefono']);
    $dni = trim($_POST['dni']);
    $usuario = trim($_POST['usuario']);
    $password = trim($_POST['password']);
    $repassword = trim($_POST['repassword']);

    if(esNulo([$nombres, $apellidos, $email, $telefono, $dni, $usuario, $password, $repassword])){
        $errors[] = "Debe llenar todos lo campos";
    }

    if(!esEmail($email)){
        $errors[] = "La dirección de correo no es valida";
    }

    if(!validaPassword($password, $repassword)){
        $errors[] = "Las contraseñas no son iguales";
    }

    if(usuarioExiste($usuario, $con)){
        $errors[] = "El usuario $usuario ya existe";
    }

    if(emailExiste($email, $con)){
        $errors[] = "El correo electrónico $email ya existe";
    }

    if(count($errors) == 0){

    $id = registraCliente([$nombres, $apellidos, $email, $telefono, $dni], $con);
    
    if($id > 0){

        $pass_hash = password_hash($password, PASSWORD_DEFAULT);
        $token = generaToken();

        if (!registraUsuario([$usuario, $pass_hash, $token, $id], $con)){
             $errors[] = "error al registrar usuario";
            }
        } else {
            $errors[] = "error al registrar cliente";

        }

    }

 }




?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Camisetas 360 Sports</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link href="css/estilos.css" rel="stylesheet">
  </head>
<body>
    
<?php include 'menu.php'; ?>

<main>
  <div class="container">
        <h2>Datos del cliente</h2>

        <?php mostrarMensajes($errors); ?>

        <form class="row g-3" action="registro.php" method="post" autocomplete="off">
            <div class="col-md-6">
                <label for="nombres"><span class="text-danger">*</span> Nombres </label>
                <input type="text" name="nombres" id="nombres" class="form-control" requiredA>
            </div>
            <div class="col-md-6">
                <label for="apellidos"><span class="text-danger">*</span> Apellidos </label>
                <input type="text" name="apellidos" id="apellidos" class="form-control" requiredA>
            </div>
            <div class="col-md-6">
                <label for="email"><span class="text-danger">*</span> Email </label>
                <input type="email" name="email" id="email" class="form-control" requiredA>
                <span id="validaEmail"  class="text-danger"></span>
            </div>
            <div class="col-md-6">
                <label for="telefono"><span class="text-danger">*</span> Telefono </label>
                <input type="tel" name="telefono" id="telefono" class="form-control" requiredA>
            </div>
            <div class="col-md-6">
                <label for="dni"><span class="text-danger">*</span> C.C </label>
                <input type="text" name="dni" id="dni" class="form-control" requiredA>
            </div>
            <div class="col-md-6">
                <label for="usuario"><span class="text-danger">*</span> Usuario </label>
                <input type="text" name="usuario" id="usuario" class="form-control" requiredA>
                <span id="validaUsuario" class="text-danger"></span>
            </div>
            <div class="col-md-6">
                <label for="password"><span class="text-danger">*</span> Contraseña </label>
                <input type="password" name="password" id="password" class="form-control" requiredA>
            </div>
            <div class="col-md-6">
                <label for="repassword"><span class="text-danger">*</span> Repetir Contraseña </label>
                <input type="password" name="repassword" id="repassword" class="form-control" requiredA>
            </div>

                <i><b>NOTA:</b> Los campos con asteriscos son obligatorios</i>

            <div class="col-12">
                <button type="submit" class="btn btn-primary">Registrar</button>
            </div>
        </form>
  </div>
</main>



<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

<script>
    let txtUsuario = document.getElementById('usuario')
    txtUsuario.addEventListener("blur", function() {
        existeUsuario(txtUsuario.value)
    }, false)

    let txtEmail = document.getElementById('email')
    txtEmail.addEventListener("blur", function() {
        existeEmail(txtEmail.value)
    }, false)

    function existeUsuario(usuario){

        let url = "clases/clienteAjax.php"
        let formData = new FormData()
        formData.append("action","existeUsuario")
        formData.append("usuario",usuario)

        fetch(url,{
            method: 'POST',
            body: formData
        }).then(response => response.json())
        .then(data => {

            if (data.ok){
                document.getElementById('usuario').value = ''
                document.getElementById('validaUsuario').innerHTML = 'usuario no disponible'
            } else {
                document.getElementById('validaUsuario').innerHTML = ''
            }
        })
    }

    ///////////

    function existeEmail(email){

        let url = "clases/clienteAjax.php"
        let formData = new FormData()
        formData.append("action","existeEmail")
        formData.append("email",email)

        fetch(url,{
            method: 'POST',
            body: formData
        }).then(response => response.json())
        .then(data => {

            if (data.ok){
                document.getElementById('email').value = ''
                document.getElementById('validaEmail').innerHTML = 'Email no disponible'
            } else {
                document.getElementById('validaEmail').innerHTML = ''
            }
        })
        }
</script>

</body>
</html>