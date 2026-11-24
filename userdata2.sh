#!/bin/bash
apt-get update -y
DEBIAN_FRONTEND=noninteractive apt-get install -y apache2

# Fetch Instance ID using IMDSv2 token
TOKEN=$(curl -s -X PUT "http://169.254.169.254/latest/api/token" -H "X-aws-ec2-metadata-token-ttl-seconds: 21600")
INSTANCE_ID=$(curl -s -H "X-aws-ec2-metadata-token: $TOKEN" http://169.254.169.254/latest/meta-data/instance-id)
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
  <title>My Portfolio | Server 2</title>
  <style>
    @keyframes colorChange {
      0%   { color: #f472b6; }
      50%  { color: #fbbf24; }
      100% { color: #c084fc; }
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
      background: radial-gradient(circle at bottom left, #311042, #13091f 70%);
      color: #faf5ff;
    }

    .card {
      width: 100%;
      max-width: 520px;
      background: rgba(24, 12, 40, 0.88);
      border: 1px solid rgba(192, 132, 252, 0.25);
      border-radius: 20px;
      padding: 2.25rem 2.5rem;
      box-shadow: 0 24px 48px rgba(0, 0, 0, 0.5);
      backdrop-filter: blur(10px);
    }

    .top-bar {
      display: flex;
      align-items: center;
      justify-content: space-between;
      margin-bottom: 1rem;
    }

    .tag {
      display: inline-flex;
      align-items: center;
      gap: 0.45rem;
      font-size: 0.75rem;
      font-weight: 600;
      letter-spacing: 0.08em;
      text-transform: uppercase;
      color: #e879f9;
      background: rgba(232, 121, 249, 0.12);
      border: 1px solid rgba(232, 121, 249, 0.28);
      padding: 0.35rem 0.75rem;
      border-radius: 999px;
    }

    .dot {
      width: 8px;
      height: 8px;
      border-radius: 50%;
      background: #fbbf24;
      box-shadow: 0 0 8px #fbbf24;
    }

    .node-label {
      font-size: 0.75rem;
      font-family: ui-monospace, SFMono-Regular, Menlo, monospace;
      color: #a855f7;
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
      color: #e9d5ff;
      background: rgba(46, 16, 72, 0.75);
      border: 1px solid rgba(192, 132, 252, 0.2);
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
      color: #f3e8ff;
      line-height: 1.6;
    }
  </style>
</head>
<body>
  <div class="card">
    <div class="top-bar">
      <div class="tag"><span class="dot"></span> AWS EC2 &bull; Secondary Node</div>
      <span class="node-label">AZ-02</span>
    </div>
    <h1>Terraform Project Server 2</h1>
    <h2>Instance ID: <span class="instance-id">$INSTANCE_ID</span></h2>
    <p>Welcome to Ali Khan Devops Practice</p>
  </div>
</body>
</html>
EOF

# Start Apache and enable it on boot
systemctl start apache2
systemctl enable apache2