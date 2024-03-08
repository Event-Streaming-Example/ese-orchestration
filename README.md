# ESE-Orchestration

This repo houses all the required configs as to how to orchestrate the FE, BE and other components for a demo. One can use this to understand how the overall architecure would look like.

![ESE Overview](./images/overview.jpg)

## Quick Start

Execute the below given commands in order to setup all the components on a single machine. For more details about each component, view:

1. [ESE-Client](./client/README.md)
2. [ESE-Server](./server/README.md)
3. [ESE-Consumer](./consumer/README.md)
4. [ESE-Mailer](./mail/README.md)

```shell

# 1. Setting up the ese-mailer first
 docker-compose -f ./mail/docker-compose.yml -p ese-mailer up -d

 # 2. Setting up the ese-server next
 docker-compose -f ./server/docker-compose.yml -p ese-servers up -d

 # 3. Setting up the ese-consumer next
 docker-compose -f ./consumer/docker-compose.yml -p ese-consumer up -d

 # 4. Setting up a standalone ese-client
 docker run -d -p 8080:80 --env-file ./client/env --name ese-client-standalone saumyabhatt10642/ese-client

# 5. Setting up the simulation clients
docker-compose -f ./client/docker-compose.yml -p ese-clients up -d

```
