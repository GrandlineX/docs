# Util List

- [Project-Tool](#project-tool)
- [Docs to OpenApi](#docs-to-openapi-v3)


---

## Project-Tool 


[![GitHub](https://badge.fury.io/gh/GrandlineX%2Fproject-tool.svg)](https://github.com/GrandlineX/project-tool)
[![NPM](https://img.shields.io/static/v1?label=NPM&message=Package&color=red&logo=NPM)](https://www.npmjs.com/package/@grandlinex/project-tool)
![TS](https://img.shields.io/static/v1?label=Language&message=TypeScript&color=blue&logo=TypeScript)

### Description

**Cli**  for the GrandLineX Project

### Features

- **Create new** GrandLineX **project** with customizable project setup. 
- **Update** GrandLineX **packages**

### Quick start

1. Run `npm i -g @grandlinex/project-tool`
2. Start CLI `gltool -i` or `npx @grandlinex/project-tool -i`

---

## Swagger-Mate
> GrandLineX Swagger-Mate  project

[![GitHub](https://badge.fury.io/gh/grandlinex%2Fswagger-mate.svg)](https://github.com/GrandlineX/swagger-mate)
[![NPM](https://img.shields.io/static/v1?label=NPM&message=Package&color=red&logo=NPM)](https://www.npmjs.com/package/@grandlinex/swagger-mate)
![TS](https://img.shields.io/static/v1?label=Language&message=TypeScript&color=blue&logo=TypeScript)

#### Status
![Quality Gate Status](https://sonarcloud.io/api/project_badges/measure?project=GrandlineX_swagger-mate&metric=alert_status)
![Security Rating](https://sonarcloud.io/api/project_badges/measure?project=GrandlineX_swagger-mate&metric=security_rating)
![Maintainability Rating](https://sonarcloud.io/api/project_badges/measure?project=GrandlineX_swagger-mate&metric=sqale_rating)
![Reliability Rating](https://sonarcloud.io/api/project_badges/measure?project=GrandlineX_swagger-mate&metric=reliability_rating)
![Coverage](https://sonarcloud.io/api/project_badges/measure?project=GrandlineX_swagger-mate&metric=coverage)

#### Issues
![Bugs](https://sonarcloud.io/api/project_badges/measure?project=GrandlineX_swagger-mate&metric=bugs)
![Vulnerabilities](https://sonarcloud.io/api/project_badges/measure?project=GrandlineX_swagger-mate&metric=vulnerabilities)
![Code Smells](https://sonarcloud.io/api/project_badges/measure?project=GrandlineX_swagger-mate&metric=code_smells)

### Features

- Generate swagger.{json|yml} from code
- Generate Api client from swagger.{json|yml}


### Documentation
- [Documentation](https://www.grandlinex.com/swagger-mate/)


### Quick Start

#### Install

1. Insatal npm package
```shell
  npm i  @grandlinex/swagger-mate
```

2. Update package.json
```json
{
  //...
  "scripts": {
    "makeSpec": "swagger-mate",
    "serveSpec": "swagger-mate --serve",
    "buildSpecMain": "swagger-mate --build --main",
    "buildSpecDev": "swagger-mate --build --dev"
  },
  "glx": {
    "kernel": "dist/Kernel.js"
  }
  //...
}
```

|Command| Description                                                                       |
|---|-----------------------------------------------------------------------------------|
|`npm run makeSpec`| make `openapi.json`                                                               |
|`npm run serveSpec`| serve `openapi.json` with [swagger-ui](https://github.com/swagger-api/swagger-ui) |
|`npm run buildSpecMain`| build api client (prod)                                                           |
|`npm run buildSpecDev`| build api client (dev)                                                           |

#### Serve option

> Default port = 9000

ENV variables

| ENV | Description              |
|-----|--------------------------|
|  SW_PORT   | set custom serve port    |
|  SW_AUTH   | set default bearer token |

### Define types

#### Kernel

```typescript
import { SPathUtil, Swagger } from '@grandlinex/swagger-mate';
// OpenApi 3.0.3 - Root Api definition
@Swagger({
  info: {
    title: 'KernelTest',
    version: '0.1.0', // Version (optional) will be read from package.json
  },
  openapi: '3.0.3',
  servers: [
    {
      url: 'http://localhost:9257',
      description: 'LocalDev',
    },
  ],
  paths: {
      // Static definition
    '/version': {
      get: {
        description: 'Get version',
        operationId: 'getVersion',
        responses: SPathUtil.defaultResponse('200', '500'),
      },
    },
   // Dynamic definition will be read from @SPath
  },
  security: [
    {
      bearerAuth: [],
    },
  ],
  components: {
    securitySchemes: {
      bearerAuth: {
        type: 'http',
        scheme: 'bearer',
        bearerFormat: 'JWT',
      },
    },
  },
})
export default class SomeKernel {}

```

#### Action

```typescript
import { SPathUtil, Swagger } from '@grandlinex/swagger-mate';

// OpenApi 3.0.3 - Patch definition
@SPath({
    '/test': {
        get: {
            description: 'test',
            operationId: 'getTest', // name for the js api client
            summary: 'Descritption summary',
            responses: SPathUtil.defaultResponse('200','400', '500')
        },
    },
})
export default class SomeBaseApiAction {}

```
