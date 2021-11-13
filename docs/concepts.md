## Structure
![st](img/structure.svg)

## Quick start (Skeleton Project - ExpressKernel Pack)


### Includes

- Full **Typescript** project setup
- **Jest** test and coverage config
- Docker-Compose file for **Development Database**
- **ESLint** config with AirBnB & Prettier presets
- GrandLineX **OpenApi** generator config
- Example **Kernel Extension** code `@/src`

### Variant 1 (GrandlineX cli)

1. Run `npm i @grandlinex/project-tool -g`
2. Start cli `gltool -i`
3. Select the new project option.
4. Follow the instructions.

### Variant 2 (clone project)

1. Clone `git clone https://github.com/GrandlineX/skeleton-project.git && cd skeleton-project`
2. Install dependencies `npm instsall`
3. Start database `docker-compose up -d`
4. Build project `npm run build`
5. Build project `npm run start`

### Skeleton project commands

|Command|Description|
|---|---|
|`npm run lint`| start ESLint |
|`npm run test`| start Jest test collection (creates db entry's) |
|`npm run test-converage`| start Jest test collection + coverage report (creates db entry's) |
|`npm run start-dev`| start dev script with disabled cors |
|`npm run makeDocs`| generates Typedoc documentation|
|`npm run makeSpec`| generates OpenApi spec [see](https://grandlinex.github.io/docs/utils/#docs-to-openapi-v3)|
|`npm run serveSpec`| generates OpenApi spec [see](https://grandlinex.github.io/docs/utils/#docs-to-openapi-v3) + serve Swagger UI|

## Manual install (Existing Project)
1. Before we can use the GrandLineX Kernel we need to set up a PostgressDB.
2. If you want to use an existing DB go to step 7.
3. A simple way to do this is to use a Docker container.
> If you dount have docker see [here](https://docs.docker.com/get-docker/)
4. Create a `docker-compose.yml` file.
5. Use a editor

```yaml
  services:
    dev-db:
      image: postgres
      volumes:
        - ./data/db:/var/lib/postgresql/data
      env_file:
        - .env
      ports:
        - 5432:5432
```


6. Or run
```shell
wget https://raw.githubusercontent.com/GrandlineX/kernel/main/docker-compose.yml -O docker-compose.yml
```
8. Create a `.env` file in the root folder of your Project
9. Use a editor
```shell
DBPATH=localhost
DBPORT=5432
POSTGRES_PASSWORD=example
POSTGRES_USER=dbuser
SERVER_PASSWOR=pw
PUBLICDOMAIN=http://localhost
```

9. Or run
```shell
wget https://raw.githubusercontent.com/GrandlineX/kernel/main/.env.example -O .env
```
11. Now we can start the database with `docker-compose up -d` or `docker compose up -d`
12. Install the kernel package `npm i @grandlinex/kernel`
13. Create a Basic Kernel Object `main.ts/main.js`

```typescript
 import Kernel from "@grandlinex/kernel"
 const kernel=new Kernel({
    appName:"AppName", 
    appCode:"appcode",
 })
 kernel.start();
```

14. Start `node main.js` \ `ts-node main.ts`
        
