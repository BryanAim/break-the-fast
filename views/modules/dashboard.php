<div class="content-wrapper">
  
  <section class="content-header">
    
    <h1>
      Dashboards
    </h1>

  </section>

  <section class="content">

  <div class="row">
    <img src="views/images/Logo-full.png" alt="logo-breakthefast" width="330">
  </div>

    <div class ="row">

      <?php

        if($_SESSION["profile"] =="administrator"){

          include "dashboard/box_views.php";

        }

      ?>
    
    </div>

    <div class ="row">

      <div class="col-lg-12">

      <?php

        if($_SESSION["profile"] =="administrator"){

          include "reports/sales_graph.php";

        }
        
      ?>

      </div>

      <div class="col-lg-6">
        
        <?php

          if($_SESSION["profile"] =="administrator"){

            include "reports/bestselling_products.php";

          }

        ?>

      </div>

      <div class="col-lg-6">
        
        <?php
        
          if($_SESSION["profile"] =="administrator"){

            include "dashboard/recentlyAdded_products.php";

          }

        ?>

      </div>

      <div class="col-lg-12">
           
        <?php

        if($_SESSION["profile"] =="chef" || $_SESSION["profile"] =="waiter" | $_SESSION["profile"] =="cashier"){

           echo '<div class="box box-success">

           <div class="box-header">

           <h1>Welcome ' .$_SESSION["name"].'</h1>

           </div>

           </div>';

        }

        ?>

    
    </div>

</div>


    </div>

  </section>

</div>
