#!/bin/bash
apt update
apt install apache2 -y

# Create a simple HTML file 
cat <<EOF > /var/www/html/index.html
<!DOCTYPE html>
<html>
<head>
  <style>
    /* Add animation and styling for the text */
    @keyframes colorChange {
      0% { color: red; }
      50% { color: green; }
    }
  </style>
</head>
<body>
  <h1><span style="color:red">My Terraform Project</span> - <span style="color:green">Server 1</span></h1>
  <h2>By Nikhita A</h2>
  <p>This html page is deployed in <b>Server 1</b><p>

</body>
</html>
EOF

# Start Apache and enable it on boot
systemctl start apache2
systemctl enable apache2