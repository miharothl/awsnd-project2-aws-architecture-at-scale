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



