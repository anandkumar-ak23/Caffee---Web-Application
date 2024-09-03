<%@ page language="java" contentType="text/html" %>

 <%@ page import ="java.sql.*" %>


<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>My Cart- Ask Me Coffee | AK</title>
	<link rel="stylesheet" href="style.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

    <script>
        function payment()
        {
            alert("PAYMENT DONE WELL!........\nTHANK YOU :)");
            window.location.href = "cart.html";
        }
    </script>
</head> 
<body >
<div class="bgcolor">   
    <div class="header">
    <div class="container">
        <div class="navbar">
		<div class="logo">
			<img src="images/logo.jfif" width="125px">
		</div>
		<nav>
			<ul><br>
				<li><a href="main.html">Home</a></li>
				<li><a href="products.html">Products</a></li>
                <li><a href="product-details.html">Product-details</a></li>
				<li><a href="about.html">About</a></li>
				<li><a href="contact.html">Contact</a></li>
				<li><a href="account.html">Account</a></li>
                <li><a href="cart.html"><img src="images/cart.png" width="30px" height="30px"><br>My Cart</a></li>
			</ul>
		</nav>
        
	</div> 
        
<!-----------cast details---------->
      <br><br>  

        


<%  double quant1= (double) Integer.parseInt(request.getParameter("q1"));
double quant2= (double) Integer.parseInt(request.getParameter("q2"));
double quant3= (double) Integer.parseInt(request.getParameter("q3"));
double quant4= (double) Integer.parseInt(request.getParameter("q4"));
    String disc= request.getParameter("discount"); %>

<%
double co1= 2.0;
double co2= 0.7;
double co3= 1.75;
double co4= 0.99;%>

    <%
    double cost= (quant1*co1)+(quant2*co2)+(quant3*co3)+(quant4*co4);
    if(disc=="yes")
    {
        cost=cost-(cost*0.13);
    }
    %>
    <div class="row">
        <div class="col-2">
            <h1>Total Bill & Details</h1><br>
            
                <p><i><b>Thank you once again for choosing our services and completing your payment.
                 <br>We truly value your business.</b></i>
                </p>
                
            <p><br><br>
                
                <h2>Total cost: </h2>
                <h3><%=cost%>($)</h3>
                <% double costR= cost*(82.21);%><br>
                <h3><%=costR%>(Rs.)</h3>
            </p>
            <input type="submit" class="btn" value="Pay Now &#8594;" onclick="payment()"/>
        </div>
        <div >
        
            <img src="images/paynow.png" alt="paynow">
            
        </div>

    </div>
    
        
        
        
        
<!--------- footer and brands---------->
    
    <div class="brand">
        <h2 class="title">Other Brands</h2>
        <div class="small-container">
            <div class="row">
                <div class="col-5">
                    <center><a href="https://online.kfc.co.in/"><img src="images/logo-1.jpg">
                        <h4>*  KFC*</h4></a></center>
                </div>
                <div class="col-5">
                    <center><a href="https://www.starbucks.in/dashboard"><img src="images/logo-2.jpg">
                        <h4><b>*StarBucks *</b></h4></a></center>
                </div>
                <div class="col-5">
                    <center><a href="https://www.mcdonalds.com/us/en-us.html"><img src="images/logo-3.jpg">
                        <h4>*  McDonald's *</h4></a></center>
                </div>
                <div class="col-5">
                    <center><a href="https://www.coca-colacompany.com/"><img src="images/logo-4.webp">
                    <h4>*  Coca Cola *</h4></a></center>
                </div>
            </div>
        </div>
        
    </div>

<!------------footer---------->
    <div class="footer">
        <div cls="container">
            <div class="row">
                <div class="logo">
                    <a href="main.html"><img src="images/logo.jfif" width="125px" ></a>
		      </div>
                <div class="footer-clo-1">
                    <hr><div><a href="contact.html">CONTACT US</a></div>
                    <p class="Copyright">Copyright 2020- Ask Me Coffee | AKs </p>
                    
                </div>
            </div>
        </div>
    </div>
    
   
   
</div> 	
</body>
</html