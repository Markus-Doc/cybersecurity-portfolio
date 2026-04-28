---
title: "AWS Cloud Security Architecture and Uplift Plan"
tags:
  - project
  - cloud-security
  - aws
  - architecture
aliases:
  - /projects/cloud
---

# AWS Cloud Security Architecture and Uplift Plan

## Overview

This project documents the design of a secure, scalable AWS environment for a growing small business, covering identity, network security, monitoring and incident response integration. The artefact is a portfolio case study that walks from current state evaluation through to a target architecture and an uplift roadmap.

The work is presented as a capability piece. All names and entities are sanitised for public review.

## Business Scenario

The case study is set against the Rossco's Coffee environment, a fictional small business operating an EC2 hosted PHP application with a single Availability Zone deployment, a flat security group permitting public SSH and HTTP, locally hosted MariaDB credentials inside the AMI and no centralised logging or monitoring. The brief is to evaluate the existing environment, identify risks and design a target state that is appropriate for a small operations team while meeting modern security expectations.

Constraints documented in the case study include schedule, budget, available skills, the requirement to remain on AWS, and the requirement to keep data and logs inside Australian Regions.

## What Was Designed

The portfolio defines a target architecture and the controls that wrap around it:

- AWS architecture across two Availability Zones with a Virtual Private Cloud, public and private subnets, NAT Gateways and an Internet Gateway
- Application tier on Auto Scaling EC2 instances built from a Golden AMI and managed via AWS Systems Manager Session Manager rather than SSH
- Data tier on Amazon RDS MariaDB Multi AZ with automated backups, encryption and point in time recovery
- Identity model using IAM Identity Center for staff with multi factor authentication, IAM roles for workloads, and Amazon Cognito for customer authentication
- Edge and application protection using AWS WAF, Shield Standard, an Application Load Balancer terminating TLS via AWS Certificate Manager and an S3 Gateway Endpoint to keep object access private
- Detection and response stack using CloudTrail, GuardDuty, Security Hub, Amazon Inspector, Macie and AWS Config
- Encryption controls using KMS keys at rest and TLS 1.2 or higher in transit
- Infrastructure as code using CloudFormation templates stored in versioned S3 buckets
- Cloud incident response integration that ties detections back to the broader IR program

## Key Capabilities Demonstrated

- Cloud security architecture across compute, network, data, identity and operations
- Least privilege design covering human identities, machine identities and customer authentication
- Detection and response capability built on AWS native services
- Secure deployment and operational resilience using managed services and infrastructure as code
- Risk based evaluation of an existing environment with mapped uplift recommendations
- Alignment with data sovereignty requirements through Australian Region deployment

## Artefact

The full portfolio case study is available below as a downloadable PDF:

- [Cloud Security Plan (PDF)](Cloud_Security_Plan.pdf)

## Architecture

The target architecture is a two tier, multi AZ design. Public subnets host the ALB and NAT Gateways. Private subnets host stateless EC2 application instances and the managed RDS MariaDB database. There is no inbound SSH. Outbound internet access from the private tier is through NAT, with an S3 Gateway Endpoint for private object storage access. Identity flows through IAM Identity Center for staff and Cognito for customers. Detection and response is layered through GuardDuty, Security Hub, CloudTrail, Inspector and Macie, with WAF and Shield Standard at the edge. The detailed diagrams and control descriptions are embedded inside the PDF.

## Notes on Use

This document is presented as a capability piece. It is suitable for review by recruiters, hiring managers and cloud security leaders evaluating cloud architecture, identity design and detection and response design. It is not intended to be deployed verbatim into a live organisation without tailoring to that organisation's workloads, regulatory context and operating model.
