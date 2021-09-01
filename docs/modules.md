## Kernel

[![GitHub](https://badge.fury.io/gh/grandlinex%2Fkernel.svg)](https://github.com/GrandlineX/kernel)
[![NPM](https://img.shields.io/static/v1?label=NPM&message=Package&color=red&logo=NPM)](https://www.npmjs.com/package/@grandlinex/kernel)
![TS](https://img.shields.io/static/v1?label=Language&message=TypeScript&color=blue&logo=TypeScript)
![Coverage](https://img.shields.io/static/v1?label=Coverage&message=76%&color=yellow&logo=Jest)

### Kernel features

- Extendable module structure
- Managed DB Connection
- Encrypted credential store
- Backend authorization with JWT 


### Documentation

#### Version 0.9.x
1. [Kernel Docs](/docs/kernel/v0.9.x)
2. [Kernel API - SwaggerUI](/docs/swagger?v=0.9.x)


### Structure
![st](img/structure.svg)

### Manual install (Existing Project)
1. Before we can use the GrandLineX Kernel we need to set up a PostgressDB.
2. If you want to use an existing DB go to step 7. 
3. A simple way to do this is to use a Docker container.
> If you dount have docker see [here](https://docs.docker.com/get-docker/)
4. Create a `docker-compose.yml` file.
5. Use a editor


        services:
          dev-db:
            image: postgres
            volumes:
              - ./data/db:/var/lib/postgresql/data
            env_file:
              - .env
            ports:
              - 5432:5432         


6. Or run `wget https://raw.githubusercontent.com/GrandlineX/kernel/main/docker-compose.yml -O docker-compose.yml`
7. Create a `.env` file in the root folder of your Project
8. Use a editor
   
        DBPATH=localhost
        DBPORT=5432
        POSTGRES_PASSWORD=example
        POSTGRES_USER=dbuser
        SERVER_PASSWOR=pw
        PUBLICDOMAIN=http://localhost
   
9. Or run `wget https://raw.githubusercontent.com/GrandlineX/kernel/main/.env.example -O .env` 
10. Now we can start the database with `docker-compose up -d` or `docker compose up -d`
11. Install the kernel package `npm i @grandlinex/kernel`
12. Create a Basic Kernel Object `main.ts/main.js`

        import Kernel from '@grandlinex/kernel';
        import * as path from 'path';

        const configPaht = Path.join(__dirname,'config');
        const kernel = new Kernel("AppName","appcode",configPaht);         

        kernel.start();

14. Start `node main.js` \ `ts-node main.ts`
        
