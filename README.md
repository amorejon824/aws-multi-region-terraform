\# Multi-Region AWS Infrastructure with Terraform



\## Overview

This project demonstrates a production-style multi-region AWS deployment using Terraform modules across \*\*us-east-1\*\* and \*\*us-west-2\*\*.



The goal was to build a reusable, scalable, and highly available infrastructure design rather than a one-off deployment.



\---



\## What This Project Includes

\- Multi-region AWS deployment

\- Reusable Terraform modules

\- VPC and public subnets

\- Internet Gateway and routing

\- Application Load Balancer (ALB)

\- EC2 Auto Scaling Groups

\- Target group health checks

\- CloudWatch dashboard and alarms



\---



\## Architecture

Each region contains:

\- 1 VPC

\- 2 public subnets across Availability Zones

\- 1 Application Load Balancer

\- 1 Auto Scaling Group with EC2 instances

\- CloudWatch monitoring for ALB health



\---



\## Terraform Structure

envs/

us-east-1/

us-west-2/

modules/

vpc/

alb/

compute/

monitoring/



\---



\## Key Skills Demonstrated

\- Terraform module design

\- Multi-region AWS architecture

\- High availability design

\- Load balancing and Auto Scaling

\- Infrastructure monitoring with CloudWatch



\---



\## Why I Built This

I wanted to move beyond basic deployments and build something closer to a real production setup. This project helped reinforce how to design scalable infrastructure, reuse Terraform modules, and think about availability across multiple regions.



\---



\## Future Improvements

\- Route 53 failover routing between regions

\- HTTPS with ACM

\- Private subnets + NAT Gateway

\- Centralized logging



Screenshots

Terraform Structure



Application Load Balancer



Auto Scaling Group



Target Group Health



East Region Test



West Region Test



CloudWatch Monitoring

