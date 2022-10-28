

<!DOCTYPE html>

<html lang="en">
<head>
   <!-- Basic -->
   <head>
   <meta charset="utf-8">
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <!-- Mobile Metas -->
   <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
   <!-- Site Metas -->
   <title>Rent & Run</title>
   <style type="text/css">
	td{
		height: 50px;
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
               <h3>MY PROFILE</h3>    
             </div>
          </div>
        </div>
      </section>
      <!-- end section -->
    
    <!-- section -->
     <section class="layout_padding section">
         <div class="container">
           <div class="row">
               <div class="col-md-12">
                  <div class="contact_section margin_top_30">
                     <div class="row">
                        <div class="col-md-8 offset-md-2">
                           <div class="form_cont">
								<?php
	$db=mysqli_connect('localhost','root','','vehicle_rental');
	//echo "1";
	$Name = "";
	$NIC_No = "";
	$phone = "";
	$address = "";
	
	if(isset($_POST['signup'])){
		//echo "2";
		$Name = $_POST['CustomerName'];
		$NIC_No = $_POST['CustomerNIC'];
		$phone = $_POST['ContactNumber'];
		$address = $_POST['Address'];
		
		$sql_N="SELECT * FROM customer WHERE CustomerNIC='$NIC_No'";
		$res_N=mysqli_query($db,$sql_N) or die(mysqli_error($db));
		
		if(mysqli_num_rows($res_N)>0){
			?>
			<h5 style="color:red;"> YOU HAVE ALREADY CREATED AN ACCOUNT!!!</h5>
			
			<?php
		}else{
			$query="INSERT INTO customer(CustomerName,CustomerNIC,Address,ContactNumber) VALUES('$Name','$NIC_No','$address','$phone')";
			$result=mysqli_query($db,$query) or die(mysqli_error($db));
			?>
			<h5 style="color:red;" align='center'> Saved</h5>
			
			<?php
		}
		$connection=mysqli_connect('localhost','root','');
		$db=mysqli_select_db($connection,'vehicle_rental');
		$NIC_No = $_POST['CustomerNIC'];
		$query="SELECT * FROM customer WHERE CustomerNIC='$NIC_No'";
		$query_run=mysqli_query($connection,$query);
								
		while($row = mysqli_fetch_array($query_run)){
			?>
			<div name="result">
				<table width=100%>
			
				<tr>
				<td style="font-weight:bold"><font size=3px style='bold'>Customer ID</font></td>
				<td><?php echo $row['CustomerID']; ?></td>
				</tr>
				<tr>
				<td style="font-weight:bold"><font size=3px>Customer Name</font></td>
				<td><?php echo $row['CustomerName']; ?></td>
				</tr>
				<tr>
				<td style="font-weight:bold"><font size=3px>Customer NIC</font></td>
				<td><?php echo $row['CustomerNIC']; ?></td>
				</tr>
				<tr>
				<td style="font-weight:bold"><font size=3px>Address</font></td>
				<td><?php echo $row['Address']; ?></td>
				</tr>
				<tr>
				<td style="font-weight:bold"><font size=3px>Contact Number</font></td>
				<td><?php echo $row['ContactNumber']; ?></td>
				</tr>
				</table>
			
			</div>
				<?php
	}
		
	}
	
?>
                           </div>
                        </div>
                     </div>
                  </div>
               </div>
            </div>
         </div>
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
