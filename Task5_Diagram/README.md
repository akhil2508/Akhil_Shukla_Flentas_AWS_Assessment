# Akhil_Shukla_Flentas_AWS_Assessment
Flentas Cloud Engineer Internship AWS Assessment
Architectural Diagram is uploaded

I designed a standard 3-Tier Web Architecture capable of handling 10,000 concurrent users.

An Internet-facing ALB balances traffic across a dynamic Auto Scaling Group of EC2 instances, which scale horizontally based on CPU utilization.

For durability, I included an Amazon RDS database configured with Multi-AZ deployment (Primary + Standby) to ensure failover capability in case of a zone outage.

To reduce load on the database, an ElastiCache (Redis) cluster caches frequent queries, while static assets (images/css) are offloaded to S3.