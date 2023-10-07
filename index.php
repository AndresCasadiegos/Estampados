<?php

  require 'config/config.php';
  require 'config/database.php';
  $db = new Database();
  $con = $db->conectar();

  $sql = $con->prepare("SELECT id, nombre, precio FROM productos WHERE activo=1");
  $sql->execute();
  $resultado = $sql->fetchALL(PDO::FETCH_ASSOC);


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
    <script src="https://kit.fontawesome.com/e403b51d68.js" crossorigin="anonymous"></script>
  </head>
<body>
<?php include 'menu.php'; ?>


<main>
  
  <div class="container">

  <div id="carouselExampleControls" class="carousel slide" data-bs-ride="carousel">
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img src="image/ad4.jpg" class="d-block w-100" alt="...">
    </div>
    <div class="carousel-item">
      <img src="image/ad5.jpg" class="d-block w-100" alt="...">
    </div>
    <div class="carousel-item">
      <img src="image/ad6.jpg" class="d-block w-100" alt="...">
    </div>
  </div>
  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Anterior</span>
  </button>
  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Siguiente</span>
  </button>
</div>
<br>
  <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
        <?php foreach($resultado as $row){ ?>
        <div class="col">
          <div class="card shadow-sm">
            <?php
            
            $id = $row['id'];
            $imagen = "image/productos/" . $id . "/principal.jpg";

            if (!file_exists($imagen)){
                $imagen ="image/no-photo.png";
            }

            ?>
          <img src="<?php echo $imagen; ?>" class="d-block w-100">
            <div class="card-body">
              <h5 class="card-title"><?php echo $row['nombre']; ?></h5>
              <p class="card-text">$ <?php echo number_format($row['precio'], 2, '.', ','); ?></a>
              <div class="d-flex justify-content-between align-items-center">
                <div class="btn-group">
                  <a href="details.php?id=<?php echo $row['id']; ?>&token=<?php echo hash_hmac('sha1', $row['id'], KEY_TOKEN); ?>" class="btn btn-primary">Detalles</a>
                </div>
                <button role="button" class="button-name" onclick="addProducto(<?php echo $row['id']; ?>, '<?php echo hash_hmac('sha1', $row['id'], KEY_TOKEN); ?>')">Agregar</button>
              </div>
           </div>
        </div>
  </div>
  <?php } ?>

  <style>

  #prev-button, #next-button {
    position: absolute;
    top: 50%;
    transform: translateY(-50%);
    background-color: #000;
    color: #fff;
    padding: 10px;
    border: none;
    cursor: pointer;
  }

  #prev-button {
    left: 0;
  }

  #next-button {
    right: 0;
  }

  #prev-button:hover, #next-button:hover {
    background-color: #fff;
    color: #000;
  }

  .button-name {
 align-items: center;
 appearance: none;
 background-color: #FCFCFD;
 border-radius: 4px;
 border-width: 0;
 box-shadow: rgba(45, 35, 66, 0.2) 0 2px 4px,rgba(45, 35, 66, 0.15) 0 7px 13px -3px,#D6D6E7 0 -3px 0 inset;
 box-sizing: border-box;
 color: #36395A;
 cursor: pointer;
 display: inline-flex;
 font-family: "JetBrains Mono",monospace;
 height: 48px;
 justify-content: center;
 line-height: 1;
 list-style: none;
 overflow: hidden;
 padding-left: 16px;
 padding-right: 16px;
 position: relative;
 text-align: left;
 text-decoration: none;
 transition: box-shadow .15s,transform .15s;
 user-select: none;
 -webkit-user-select: none;
 touch-action: manipulation;
 white-space: nowrap;
 will-change: box-shadow,transform;
 font-size: 18px;
}

.button-name:focus {
 box-shadow: #D6D6E7 0 0 0 1.5px inset, rgba(45, 35, 66, 0.4) 0 2px 4px, rgba(45, 35, 66, 0.3) 0 7px 13px -3px, #D6D6E7 0 -3px 0 inset;
}

.button-name:hover {
 box-shadow: rgba(45, 35, 66, 0.3) 0 4px 8px, rgba(45, 35, 66, 0.2) 0 7px 13px -3px, #D6D6E7 0 -3px 0 inset;
 transform: translateY(-2px);
}

.button-name:active {
 box-shadow: #D6D6E7 0 3px 7px inset;
 transform: translateY(2px);
}

</style>

</main>



<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

<script> 
  function addProducto(id, token){
    let url = 'clases/carrito.php'
    let formData = new FormData()
    formData.append('id', id)
    formData.append('token', token)

    fetch(url, {
      method: 'POST',
      body: formData,
      mode: 'cors',
    }).then(response => response.json())
    .then(data => {
      if(data.ok){
        let elemento = document.getElementById("num_cart")
        elemento.innerHTML = data.numero
      }
    })
  }
</script>

<script>
  var currentImage = 0;
  var images = document.querySelectorAll("#slider-container img");
  var prevButton = document.querySelector("#prev-button");
  var nextButton = document.querySelector("#next-button");

  function showImage(index) {
    images[currentImage].classList.remove("active");
    images[index].classList.add("active");
    currentImage = index;
  }

  prevButton.addEventListener("click", function() {
    var index = currentImage - 1;
    if (index < 0) {
      index = images.length - 1;
    }
    showImage(index);
  });

  nextButton.addEventListener("click", function() {
    var index = currentImage + 1;
    if (index >= images.length) {
      index = 0;
    }
    showImage(index);
  });
</script>

</body>
</html>