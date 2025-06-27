# alx-system_engineering-devops
## Simple Web Stack Infrastructure

# 0 Simple web stack
1. server: is a physical or virtual computer that provides services, resources, or data to other computers over a network.
2. Domain Name (foobar.com): Provides a human-readable address that maps to the server's IP address,Users can access the website using www.foobar.com instead of remembering the IP address 8.8.8.8
3. DNS Record Type for "www":A Record type 
4. Web Server (Nginx):Acts as the first point of contact for incoming HTTP/HTTPS requests
5. Application Server:Executes the business logic and dynamic content generation
6. Database (MySQL):Stores and manages persistent data for the application
7. Communication Protocol Used: HTTP/HTTPS over TCP/IP
8. 1. Single Point of Failure (SPOF) Problem: The entire infrastructure depends on one server
   2. Downtime During Maintenance Problem: Any maintenance activity requires stopping services
   3. Scaling Limitations Problem: Single server has limited resources (CPU, RAM, storage)

# 1 Distributed web infrastructure
1. 1. Load Balancer (HAproxy) Added to Eliminates single point of failure from the original single-server setup
   2. Additional Servers (2 more servers)Added for Redundancy
2. Distribution Algorithm used: Round Robin
3. Current Setup: Active-Active, All servers are actively receiving and processing requests simultaneously
    while the Alternative Active-Passive One server actively handles requests while others remain on standby
4. Database Primary-Replica (Master-Slave) Cluster:The Write Operations will go to Primary database then the Primary automatically replicates changes to Replica database, Read Operations and Synchronization can be distributed
5. Primary Node Role has a Write Authority while the Replica Node Role has Read Operations
6. 1. Single Points of Failure (SPOF):If HAproxy fails entire site becomes unavailable and no backup load balancer in current setup
   2. Security Issues: no Firewall Servers are exposed to direct internet access
   3. No Monitoring: Lack of Health Checks, no way to detect server failures automatically

# 2 Secured and monitored web infrastructure
1. 1. Firewalls (3 total) added for Network Security, Protect servers from unauthorized access and malicious traffic
   2. SSL Certificate for HTTPS added for Data Encryption, Encrypts data in transit between user and server
   3. Monitoring Clients (3 total) added for Health Monitoring, Track system performance and availability
2. How Monitoring Tool Collects Data:Agent-Based, Monitoring agents installed on each server
3. To Monitor QPS Configure log format to include timestamps
4. 1. having SSL Termination at Load Balancer Level has the Issue of Unencrypted Internal Traffic meaning Communication between load balancer and web servers is not encrypted
   2. Single MySQL Server for Writes has the issue of Single Point of Failure meaning if Primary database fails, no writes can be processed
   3. having identical Server Components will have no Separation of Concerns meaning all servers run web server, app server, and connect to database