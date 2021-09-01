# Util List

- [Docs to OpenApi](#docs-to-openapi-v3)


# Docs to OpenApi v.3

[![GitHub](https://badge.fury.io/gh/GrandlineX%2Fdocs-to-openapi.svg)](https://github.com/GrandlineX/docs-to-openapi)
[![NPM](https://img.shields.io/static/v1?label=NPM&message=Package&color=red&logo=NPM)](https://www.npmjs.com/package/@grandlinex/docs-to-openapi)
![TS](https://img.shields.io/static/v1?label=Language&message=TypeScript&color=blue&logo=TypeScript)

## Description

This Project converts comments in your code or in your dependencies to an OpenApi Spec.
The following annotations are supported.
- `@openapi`
- `@swagger`

All comments with these annotations will be pasted as a singe element in the path definition array.
For all other OpenApi configs the `glconf.json` is used.

## Installation

- `npm i -g @grandlinex/docs-to-openapi`

### Config fields

- rootDir
    - Relative path to your sourcecode.
- filetypes
    -  List of file extensions to monitor.
- externalModules
    - If your dependencies use also these annotations you can merge these in your curren spec.
- outPutDir (optional)
    - Relative path for the Spec. output.

## Quick Start

1. Create a `glconf.json` in the root dir of your project (see config 01 or 02).
2. Edit your base Config file like in the official [Swagger Doc](https://swagger.io/specification/)
3. Add a Comment to your soruce code in yml syntax like:

            /**
             * @openapi
             * /ping:
             *   get:
             *     summary: ping
             *     tags:
             *       - basic
             *     responses:
             *       200:
             *         description: OK
             *       401:
             *         description: not authorized
             */

4. run `npx @grandlinex/docs-to-openapi`

> If you install the package as a dependency then you can use the `makeOpenApi` command.

## CLI Parameter (version >= 0.5.0)

|Parameter|Description|command|
|---|---|---|
|`--html`|Creates a swagger.html file (Standalone SwaggerUI)|`npx @grandlinex/docs-to-openapi --html`|
|`--serve`|Serves the OpenApi Spec on port 9000|`npx @grandlinex/docs-to-openapi --serve`|


## Config File Examples:

#### Config 01 `glconf.json` (minimal)


      {
        "rootDir": "./src",
        "filetypes": ["ts","js"],
        "externalModules": [],
        "baseConfig": {
          "info": {
            "title": "Hello World",
            "version": "1.0.0",
            "description": "A sample API"
          },
          "servers": [
            {
              "url": "http://localhost:9257"
            }
          ]
        }
      }

#### Config 02 `glconf.json` (Bearer JWT)

      {
        "rootDir": "./src",
        "filetypes": ["ts","js"],
        "externalModules": ["./node_modules/module_a","./node_modules/module_b"],
        "outPutDir": "./dist",
        "baseConfig": {
          "info": {
            "title": "Hello World",
            "version": "1.0.0",
            "description": "A sample API"
          },
          "servers": [
            {
              "url": "http://localhost:9257"
            }
          ],
          "security": [
            {
              "bearerAuth": []
            }
          ],
          "components": {
            "securitySchemes": {
              "bearerAuth": {
                "type": "http",
                "scheme": "bearer",
                "bearerFormat": "JWT"
              }
            }
          }
        }
      }
