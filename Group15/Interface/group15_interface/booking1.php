
<!DOCTYPE html>
<head>
<html lang="en">
   <!-- Basic -->
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
   <!--[if lt IE 9]>
   <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
   <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
   <![endif]-->
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
               <h3>Bill Details</h3>    
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
	//echo "osm";
	$CustomerID = $_POST['CustomerID'];
	$VehicleRegNo = $_POST['VehicleRegNo'];
	$PickupDate = $_POST['PickupDate'];
	$DropoffDate = $_POST['DropoffDate'];
	
	
	// Database connection
	$conn = mysqli_connect('localhost','root','','vehicle_rental');
	if($conn->connect_error){
		echo "$conn->connect_error";
		die("Connection Failed : ". $conn->connect_error);
		
	} else {
		$sql="INSERT INTO booking_details(CustomerID,VehicleRegNo,PickupDate,DropoffDate) VALUES('$CustomerID','$VehicleRegNo','$PickupDate','$DropoffDate')";
		$result=mysqli_query($conn,$sql);
		$user_id=mysqli_insert_id($conn);
		//mysqli_free_result($result);
		//echo "INSERTION SUCCESSFUL TABLE1\n";
		
		$sql="INSERT INTO billing_details (BookID) VALUES($user_id)";
		$result2=mysqli_query($conn,$sql);
		$billid=mysqli_insert_id($conn);
		//mysqli_free_result($result2);
		//echo "INSERTION SUCCESSFUL TABLE2\n";
		
		//echo $billid;
		$sql="UPDATE billing_details SET billing_details.Deposit=
														(SELECT v.Deposit
														FROM vehicle v,billing_details l,booking_details k
														WHERE k.BookID=l.BookID AND v.VehicleRegNo=k.VehicleregNo AND l.BillID=$billid),
										billing_details.TotalAmount=
														(SELECT (DATEDIFF(k.Dropoffdate,k.PickupDate))*v.CostPerDay+500.00
														FROM vehicle v,billing_details l,booking_details k
														WHERE k.BookID=l.BookID AND v.VehicleRegNo=k.VehicleregNo AND l.BillID=$billid)
										WHERE BillID=$billid";		

		$result3=mysqli_query($conn,$sql);
		//echo "INSERTION SUCCESSFUL TABLE3\n";
	
		$sql="SELECT * FROM bill WHERE BillID=$billid";
		$result4=mysqli_query($conn,$sql);
		
		if($result4->num_rows>0){
			$row = $result4->fetch_assoc();
			?>
			<table width=75% style="margin-left:auto;margin-right:auto;">
			
				<tr>
				<td style="font-weight:bold"><font size=3px style='bold'>Bill ID</font></td>
				<td><?php echo $row["BillID"]; ?></td>
				</tr>
				<tr>
				<td style="font-weight:bold"><font size=3px>Customer ID</font></td>
				<td><?php echo $row["CustomerID"]; ?></td>
				</tr>
				<tr>
				<td style="font-weight:bold"><font size=3px>Vehicle Reg No</font></td>
				<td><?php echo $row["VehicleRegNo"]; ?></td>
				</tr>
				<tr style="color:blue">
				<td style="font-weight:bold"><font size=3px>Deposit</font></td>
				<td><?php echo $row["Deposit"]; ?></td>
				</tr>
				<tr style="color:blue">
				<td style="font-weight:bold"><font size=3px>Tax</font></td>
				<td>500.00</td>
				</tr>
				<tr style="color:red">
				<td style="font-weight:bold"><font size=3px>Total Amount</font></td>
				<td><?php echo $row["TotalAmount"]; ?></td>
				</tr>
				</table>
			
			
			<?php
		}
		//echo "INSERTION SUCCESSFUL bill\n";
		
		mysqli_close($conn);
		
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