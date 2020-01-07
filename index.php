<?php
session_start();
if (!isset($_SESSION['total']))
  $_SESSION['total'] = 0;
//print_r($_SESSION);
?>

<!DOCTYPE html>
<html lang="en">

<?php include "./layout/header.php" ?>

<body>
  <!-- navbar -->
  <?php include "./layout/navbar.php" ?>
  <!-- /navbar -->

  <div class="container">
    <div class="row">
      <div class="col-sm-3">
        <!-- Side nav -->
        <?php include "./layout/category.php" ?>
        <!-- /Side nav -->
      </div>
      <div class="col-sm-9">
        <!-- Products list -->
        <div class="row">
          <?php include "./presentation/productP.php";
          $pb = new ProductionPresentation();
          $pb->ShowProductsByUser();
          ?>
        </div>
        <div class="mt-2">

          <nav aria-label="Page navigation example">
            <ul class="pagination">
              <?php
              $cp->ShowPagingLink();
              ?>
            </ul>
          </nav>
        </div>
        <!-- /Products list -->
      </div>
    </div>
  </div>


  <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
</body>

</html>