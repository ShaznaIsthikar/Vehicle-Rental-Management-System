

<!DOCTYPE html>
<html lang="en">
   <head>
   <!-- Basic -->
   <meta charset="utf-8">
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <!-- Mobile Metas -->
   <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
   <!-- Site Metas -->
   <title>Rent & Run</title>
   <style type="text/css">
		table{
			border-collapse: collapse;
			width: 100%;
			color: #588c7e;
			font-family: monospace;
			font-size:20px;
			text-align: Left;
		}
		th{
			background-color: #588c7e;
			color:white;
		}
		tr:nth-child(even){
			background-color: #f2f2f2
		}
   </style>
   <meta name="keywords" content="">
   <meta name="description" content="">
   <meta name="author" content="">
   <!-- site icon -->
   <link rel="icon" href="images/fevicon.png" type="image/png" />
   <!-- Bootstrap core CSS -->
   <link href="css/bootstrap.css" rel="stylesheet">
   <!-- FontAwesome Icons core CSS -->
   <link href="css/font-awesome.min.css" rel="stylesheet">
   <!-- Custom animate styles for this template -->
   <link href="css/animate.css" rel="stylesheet">
   <!-- Custom styles for this template -->
   <link href="style.css" rel="stylesheet">
   <!-- Responsive styles for this template -->
   <link href="css/responsive.css" rel="stylesheet">
   <!-- Colors for this template -->
   <link href="css/colors.css" rel="stylesheet">
   <!-- light box gallery -->
   <link href="css/ekko-lightbox.css" rel="stylesheet">
  
   </head>
   <body id="inner_page">
      <!-- header -->
      <header class="header">

        <div class="header_top_section">
           <div class="container">
              <div class="row">
               <div class="col-lg-3">
                  <div class="full">
                     <div class="logo">
                        <a href="index.html"><img src="images/logo_W.png" alt="#" /></a>
                     </div>
                  </div>
               </div>
               <div class="col-lg-9 site_information">
                  <div class="full">
                     <div class="main_menu">
                        <nav class="navbar navbar-inverse navbar-toggleable-md">
                           <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#cloapediamenu" aria-controls="cloapediamenu" aria-expanded="false" aria-label="Toggle navigation">
                           <span class="float-left">Menu</span>
                           <span class="float-right"><i class="fa fa-bars"></i> <i class="fa fa-close"></i></span>
                           </button>
                          <div class="collapse navbar-collapse justify-content-md-center" id="cloapediamenu">
                              <ul class="navbar-nav">
                                 <li class="nav-item active">
                                    <a class="nav-link" href="index.html">Home</a>
                                 </li>
                                 <li class="nav-item">
                                    <a class="nav-link color-aqua-hover" href="about.html">About</a>
                                 </li>
                                 <li class="nav-item">
                                    <a class="nav-link color-aqua-hover" href="rentals.php">Rentals</a>
                                 </li>
                                 <li class="nav-item">
                                    <a class="nav-link color-grey-hover" href="Booking.html">Bookings</a>
                                 </li>
                                 <li class="nav-item">
                                    <a class="nav-link color-grey-hover" href="signup.php">Sign up</a>
                                 </li>
                                 
                              </ul>
                              
                           </div>
                        </nav>
                     </div>
                  </div>
               </div>
            </div>
           </div>
        </div>

      </header>
      <!-- end header -->

      <!-- section -->
      <section class="main_full inner_page">
        <div class="container-fluid">
          <div class="row">
             <div class="full">
               <h3>Rentals</h3>
             </div>
          </div>
        </div>
      </section>
      <!-- end section -->

	<table>
		<tr>
			<th>VehicleRegNo</th>
			<th>VehicleID</th>
			<th>VehicleName</th>
			<th>Company</th>
			<th>Model</th>
			<th>ProductionYear</th>
			<th>CostPerDay</th>
			<th>Deposit</th>
			<th>Availability</th>

		</tr>

		<?php
		$conn=mysqli_connect("localhost","root","","vehicle_rental");
		if($conn->connect_error){
			die("Connection failed: ".$conn-> connect_error);
		}

		$sql = "SELECT VehicleRegNo,VehicleID,VehicleName,Company,Model,ProductionYear,CostPerDay,Deposit,Availability from vehicle";
		$result = $conn ->query($sql);

		if ($result -> num_rows > 0){

			while($row = $result -> fetch_assoc()){
				echo "<tr><td>". $row["VehicleRegNo"]."</td><td>". $row["VehicleID"]."</td><td>". $row["VehicleName"]."</td><td>". $row["Company"]."</td><td>". $row["Model"]."</td><td>". $row["ProductionYear"]."</td><td>". $row["CostPerDay"]."</td><td>". $row["Deposit"]."</td><td>". $row["Availability"]."</td></tr>";
	}
				echo "</table>";
}
else{
	echo "0 result"  ;
	}

$conn -> close();

?>
	</table>

    
 
      </section> 
      <!-- end section -->

     

        <!-- footer -->
      <footer class="footer layout_padding">
         <div class="container">
            <div class="row center">

               <div class="col-md-4 col-sm-12" >
                  <a href="index.html"><img class="img-responsive" src="images/logo_W.png" alt="#" /></a>
                  <div class="footer_link_heading">
                     <div class="footer_menu margin_top_30">
                     <ul>
                        <li><a href="tel:9876543210">0713520953</a></li>
                        <li><a href="#">rentandrun@gmail.com</a></li>
                        <li><a href="#">No 40,Gampola Road,Peradeniya</a></li>
                     </ul>
                  </div>
                  </div>
               </div>

     

            </div>
         </div>
      </footer>

      <!-- end footer -->
      <!-- Core JavaScript
         ================================================== -->
      <script src="js/jquery.min.js"></script>
      <script src="js/tether.min.js"></script>
      <script src="js/bootstrap.min.js"></script>
      <script src="js/parallax.js"></script>
      <script src="js/animate.js"></script>
      <script src="js/ekko-lightbox.js"></script>
      <script src="js/custom.js"></script>
   </body>
</html>