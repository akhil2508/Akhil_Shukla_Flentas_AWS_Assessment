I migrated the application to a fully decoupled and self-healing architecture. 

The single point of failure (standalone EC2) was replaced by an Auto Scaling Group spanning two Availability Zones.

Internet traffic hits the Application Load Balancer (ALB) positioned in the Public Subnets.
 
The ALB distributes requests to healthy instances in the Private Subnets.

The backend instances are now completely shielded from the internet; they accept traffic only from the ALB's Security Group, ensuring a secure Multi-Tier architecture.

Hence, made the website un-killable.