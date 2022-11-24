# Express Kernel - Getting Started

## Install Express Kernel

That includes:

- Full **Typescript** project setup
- **Jest** test and coverage config
- **ESLint** config with AirBnB & Prettier presets
- Example **Kernel Extension** code `@/src`

### Option 01 - gltool 

Install from GrandLineX Project Tool 

> If Project tool is not installed, please install it first. You can use the following command to install the tool.

```bash
  npm install @grandlinex/project-tool -g
```

Create new Demo-Project

```bash
  gltool --template=express && cd grandlinex-project 
```

Or use the interactive mode fore more options
```bash
  gltool -i 
```
### Option 02 - Clone from Github

```bash
  git clone https://github.com/GrandlineX/skeleton-project.git 
  cd skeleton-project 
  npm install
```

## Check your installation
```bash
  npm run test
```

## Base Commands

| Command                  | Description                                                       |
|--------------------------|-------------------------------------------------------------------|
| `npm run build`          | build project                                                     |
| `npm run start`          | run build project                                                 |
| `npm run startDev`       | build & run project                                               |
| `npm run lint`           | start ESLint                                                      |
| `npm run test`           | start Jest test collection (creates db entry's)                   |
| `npm run test-converage` | start Jest test collection + coverage report (creates db entry's) |
| `npm run start-dev`      | start dev script with disabled cors                               |
| `npm run makeDocs`       | generates Typedoc documentation                                   |
