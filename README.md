# UPDATE SUBDOMAIN A RECORD ON DNS ZONE

This bash script changes an A record for a specific subdomain on your DNS Zone

## Getting Started

Just download or clone this project and make the script executable (example. chmod +x updatednszone.sh)

### Prerequisites

You need to have bash, relevant access and named service.
You are expected to have a DNS Zone and the specified subdomain set.

### Usage

bash updatednszone.sh DOMAIN SUBDOMAIN IP
(example. bash updatednszone.sh example.com subdomain 35.35.35.35)

## Authors

* **Michael Strigkos** - *Initial work* - [mstrigkos](https://github.com/mstrigkos)

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details
