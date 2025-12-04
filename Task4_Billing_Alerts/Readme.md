Setting up Billing Alerts

Importance: 
For cloud beginners, the "Pay-as-you-go" model carries the risk of "Bill Shock." Cost monitoring is the first line of defense, providing early warnings before budget thresholds are breached.

Common Causes of Spikes:
1. Zombie Resources: Forgotten NAT Gateways (which charge hourly even if idle) and unattached Elastic IPs.
2. Runaway Scaling: Misconfigured Auto Scaling Groups launching max instances due to a loop or error.
3. Data Transfer: Unexpected high outbound traffic from a compromised or popular public-facing resource.