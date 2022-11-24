# Express Kernel - Getting Started

## Install Express Kernel

That includes:

- Full **Typescript** project setup
- **ESLint** config with AirBnB & Prettier presets
- Example **Kernel Extension** code `@/src`
- Webpack config for **Electron** and **Web** builds
- ElectronUI - React base setup (can be replaced)

### Option 01 - gltool

Install from GrandLineX Project Tool

> If Project tool is not installed, please install it first. You can use the following command to install the tool.

```bash
  npm install @grandlinex/project-tool -g
```

Create new Demo-Project

```bash
  gltool --template=electron && cd grandlinex-project 
```

Or use the interactive mode fore more options
```bash
  gltool -i 
```
### Option 02 - Clone from Github

```bash
  git clone https://github.com/GrandlineX/electron-skeleton-project.git 
  cd grandlinex-electron-project
  npm install
```

## Recompile dependencies
```bash
  npm run recompile
```

## Start App
```bash
  npm run start 
```

## Base Commands

| Command              | Description                                       |
|----------------------|---------------------------------------------------|
| `npm run start`      | One click start preview (no DEV-Mode)             |
| `npm run lint`       | start ESLint                                      |
| `npm run buildServe` | Start webpack serve (hot reload) for frontend     |
| `npm run startDev`   | Start the Electron App (DevMode for `buildServe`) |
| `npm run package`    | Build/Pack the full app as a executable file      |
