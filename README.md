# Cloud Developer ND Course 2: Design for Performance and Scalability

---

## Task 1: Create AWS Architecture Schematics

### Part 1

Plan and provision a cost-effective AWS infrastructure for a new social media application development project for 50,000 single-region users.

AWS infrastructure requirements
 - Regions: us-east-1
 - Users and Client machines
 - One VPC
 - Two Availability Zones
 - Four Subnets (2 Public, 2 Private)
 - A NAT Gateway
 - A CloudFront distribution with an S3 bucket
 - Web servers in the Public Subnets sized according to your usage estimates
 - Application Servers in the Private Subnets sized according to your usage estimates
 - DB Servers in the Private Subnets
 - Web Servers Load Balanced and Autoscaled
 - Application Servers Load Balanced and Autoscaled
 - A Master DB in AZ1 with a read replica in AZ2

![image1](https://github.com/miharothl/awsnd-project2-aws-architecture-at-scale/blob/master/images/udacity-diagram-1.png)

### Part 2

Plan a server-less architecture schematic for a new application development project.

AWS infrastructure requirements:
 - A user and client machine
 - AWS Route 53
 - A CloudFront Distribution
 - AWS Cognito
 - AWS Lambda
 - API Gateway
 - DynamoDB
 - S3 Storage

![image2](https://github.com/miharothl/awsnd-project2-aws-architecture-at-scale/blob/master/images/udacity-diagram-2.png)

## Task 2: Calculate Infrastructure Costs


Use the [AWS Pricing Calculator] (https://calculator.aws/#/) to estimate how much it will cost to run the services in your Part 1 diagram for one month.

### Initial Budget

Target a monthly estimate between $8,000-$10,000.

#### Estimates based on figures

  | NAT Gateway - REST calls per day |        | Total     |
  |----------------------------------|--------|-----------|
  | number of users                  | 50.000 |           |
  | number of usages per day         |     10 |           |
  | number of REST calls per usage   |     10 |           |
  |                                  |        | 5.000.000 |

  | S3 - Photo data per day per 30 days |                    | Total         |
  |-------------------------------------|--------------------|---------------|
  | number of users                     | 50.000             |               |
  | number of photos per day            | 2                  |               |
  | photo size                          | 5 MB               |               |
  | number of days                      | 30                 |               |
  | each user x connections             | 100                |               |
  | Storage                             |                    | 15.000.000 MB |
  | PUT calls                           | 50k * 2 * 30       | 3.000.000     |
  | GET calls                           | 50k * 2 * 30 * 100 | 300.000.000   |
  | Returned data                       | 15 TB * 10         | 150 TB        |
  | Scan data                           | 15 TB * 100        | 1500 TB       |

  | S3 - Photo data per day per 30 days |                    | Total          |
  |-------------------------------------|--------------------|----------------|
  | number of users                     | 50.000             |                |
  | number of videos per day 2 minute   | 1                  |                |
  | video size 1 minute                 | 100 MB             |                |
  | number of days                      | 30                 |                |
  | each user x connections             | 100                |                |
  | Storage                             |                    | 150.000.000 MB |
  | PUT calls                           | 50k * 1 * 30       | 1.500.000      |
  | GET calls                           | 50k * 1 * 30 * 100 | 150.000.000    |
  | Returned data                       | 150 TB * 10        | 150 TB         |
  | Scan data                           | 150 TB * 100       | 1500 TB        |

  | RDS - Config data per user  |        | Total      |
  |-----------------------------|--------|------------|
  | number of users             | 50.000 |            |
  | configuration data per user |  10 MB |            |
  |                             |        | 500.000 MB |

[Initial Estimates](https://calculator.aws/#/estimate?id=f52541185a42f6b045a88719cba6341ac511bdd7)

Baseline:
 - no redundancy (1 availability zone only)
 - photo sharing only

### Reduced Budget

Your budget has been reduced from $8,000-$10,000 to a maximum of $6,500. What services will you modify to meet this new budget? Export the updated costs in a CSV file named Reduced_Cost_Estimate.csv and write up a brief narrative of the changes you made in the CSV file below the cost estimate.

[Reduced Budget Estimates](https://calculator.aws/#/estimate?id=3e4b60d9cb3d916280f27cb1fb405ac7f9a5856e)

Changes:
  - no redundancy (1 availability zone)
  - photo sharing only (reduced S3 storage by 1/3)
  - upfront web and application server payment
  - reduced RDB instance
  
Rationale:

To meet the reduced budget requirements and limit the lost functionality of the social media website, I change the payment for EC2 web and application servers to upfront. Further, I have to decrease the computing power of the RDB instance and decrease the monthly S3 storage by one-third.

### Increased Budget 

  Your budget has been increased to $20,000. What resources will you add and why?

[Increased Budget Estimates](https://calculator.aws/#/estimate?id=205c45a6ff82a1ac4d57edbd4feaa41c1e68e392)

Changes:
 - redundancy (2 availability zones)
 - increased S3 storage to support both photo and video (beta) sharing

Rationale:

Increased budget offered an opportunity to set up a redundant system using two availability zones in case of an outage in one of the zones.
I was also able to increase S3 storage and enable sharing of both photo and video content (beta) on the social media site.





## Project  Instructions

### Exercise 1

1. Download the [starter code](https://github.com/udacity/cand-c2-project).
2. In the main.tf file write the code to provision
   * AWS as the cloud provider
   * Use an existing VPC ID
   * Use an existing public subnet
   * 4 AWS t2.micro EC2 instances named Udacity T2
   * 2 m4.large EC2 instances named Udacity M4
3. Run Terraform. 
4. Take a screenshot of the 6 EC2 instances in the AWS console and save it as `Terraform_1_1`. 
5. Use Terraform to  delete the 2 m4.large instances 
6. Take an updated screenshot of the AWS console showing only the 4 t2.micro instances and save it as `Terraform_1_2`

### Exercise 2

1. In the  Exercise_2 folder, write the code to deploy an AWS Lambda Function using Terraform. Your code should include:

   * A lambda.py file
   * A main.tf file with AWS as the provider, and IAM role for Lambda, a VPC, and a public subnet
   * An outputs.tf file
   * A variables.tf file with an AWS region
  
2. Take a screenshot of the EC2 instances page
3. Take a screenshot of the VPC page 
