VPC CIDR: 10.0.0.0/16 

I implemented a highly available network architecture spanning two Availability Zones (eu-north-1a, eu-north-1b). I separated the network into Public tiers (for internet-facing resources like Load Balancers) and Private tiers (for secure backend workloads).

Since it is a standard industry practice and provides ~65,000 IPs

for Public Subnet 1: 10.0.1.0/24 (The Availability Zone is eu-north-1a)

for Public Subnet 2: 10.0.2.0/24 (The Availability Zone is eu-north-1b) 

for Private Subnet 1: 10.0.3.0/24 (The Availability Zone is eu-north-1a)

for Private Subnet 2: 10.0.4.0/24 (The Availability Zone is eu-north-1b)