<?php
session_start();
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
      </div>
      <div class="col-sm-9 mt-3">
        <h3>YOUR SHOPPING CART</h3>
        <div class="row">
          <div class="col-sm-12" id="checkout">
            <?php
            include "./presentation/productP.php";
            include "./include/helper/database.php";
            $ck = new ProductionPresentation();
            $ck->showCart();
            ?>
          </div>
          <?php if ($_SESSION['total'] != 0) { ?>
            <!-- PayPal Logo -->
            <table>
              <tr>
                <td align="center"></td>
              </tr>
              <tr>
                <td align="center"><a href="./paypal.php" title="How PayPal Works"><img src="https://www.paypalobjects.com/webstatic/en_US/i/buttons/checkout-logo-large.png" alt="Check out with PayPal" /></a></td>
              </tr>
            </table><!-- PayPal Logo -->
          <?php } ?>
        </div>
      </div>
    </div>
  </div>
  </script>

  <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
</body>

</html>