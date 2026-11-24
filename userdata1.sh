#!/bin/bash
apt update
apt install -y apache2

# Get the instance ID using the instance metadata
INSTANCE_ID=$(curl -s http://169.254.169.254/latest/meta-data/instance-id)

# Install the AWS CLI
apt install -y awscli

# Download the images from S3 bucket
#aws s3 cp s3://myterraformprojectbucket2023/project.webp /var/www/html/project.png --acl public-read

# Create a simple HTML file with the portfolio content and display the images
cat <<EOF > /var/www/html/index.html
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>My Portfolio | Ali Khan</title>
  <style>
    @keyframes colorChange {
      0%   { color: #38bdf8; }
      50%  { color: #4ade80; }
      100% { color: #a78bfa; }
    }

    * {
      box-sizing: border-box;
    }

    body {
      margin: 0;
      min-height: 100vh;
      display: grid;
      place-items: center;
      padding: 1.5rem;
      font-family: system-ui, -apple-system, BlinkMacSystemFont, "Segoe UI", sans-serif;
      background: radial-gradient(circle at top right, #1e293b, #0f172a 70%);
      color: #f8fafc;
    }

    .card {
      width: 100%;
      max-width: 520px;
      background: rgba(15, 23, 42, 0.85);
      border: 1px solid rgba(148, 163, 184, 0.2);
      border-radius: 20px;
      padding: 2.25rem 2.5rem;
      box-shadow: 0 24px 48px rgba(0, 0, 0, 0.45);
      backdrop-filter: blur(10px);
    }

    .tag {
      display: inline-flex;
      align-items: center;
      gap: 0.4rem;
      font-size: 0.75rem;
      font-weight: 600;
      letter-spacing: 0.08em;
      text-transform: uppercase;
      color: #38bdf8;
      background: rgba(56, 189, 248, 0.12);
      border: 1px solid rgba(56, 189, 248, 0.25);
      padding: 0.35rem 0.75rem;
      border-radius: 999px;
      margin-bottom: 1rem;
    }

    .dot {
      width: 8px;
      height: 8px;
      border-radius: 50%;
      background: #4ade80;
      box-shadow: 0 0 8px #4ade80;
    }

    h1 {
      margin: 0 0 0.75rem;
      font-size: 1.85rem;
      font-weight: 700;
      letter-spacing: -0.02em;
      animation: colorChange 3s ease-in-out infinite alternate;
    }

    h2 {
      margin: 0 0 1.25rem;
      font-size: 0.95rem;
      font-weight: 500;
      color: #cbd5e1;
      background: rgba(30, 41, 59, 0.8);
      border: 1px solid rgba(148, 163, 184, 0.15);
      padding: 0.65rem 0.9rem;
      border-radius: 10px;
    }

    .instance-id {
      color: #4ade80;
      font-family: ui-monospace, SFMono-Regular, Menlo, monospace;
      font-weight: 600;
    }

    p {
      margin: 0;
      font-size: 1.05rem;
      color: #e2e8f0;
      line-height: 1.6;
    }
  </style>
</head>
<body>
  <div class="card">
    <div class="tag"><span class="dot"></span> AWS EC2 &bull; Live Deployment</div>
    <h1>Terraform Project Server 1</h1>
    <h2>Instance ID: <span class="instance-id">$INSTANCE_ID</span></h2>
    <p>Ali Khan cloud Journey</p>
  </div>
</body>
</html>
EOF
# Start Apache and enable it on boot
systemctl start apache2
systemctl enable apache2

