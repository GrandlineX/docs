# Basic Concepts 

GrandLineX is a framework for building Web APIs, Electron Apps and all kinds of server environments.
It comes with its own object-relational mapping (ORM) and manny other features.
## Project Structure

All GrandLineX projects have the same basic structure. The following diagram shows the most important components.

![st](../img/structure.svg)

### The Kernel

The kernel is the heart or a GLX-Project. It serves as a runtime environment for the modules. 
It is the only component that is required to run a GLX-Project. 
The kernel is responsible for the following tasks:

- Manage the registered modules
- Serves a Configuration store, that contains shared inforation like environment variables.
    - The Config store can be prefilled from a `.env` file or the process environment.
- A basic encryption client for encrypting and decrypting data.
    - The encryption client can be used to encrypt and decrypt credentials and other critical information.
- A basic logger interface that can be used to log information to the console.



### The Modules

The modules are the place where the feature functionality is implemented.
They contain the following base resources, that are not required to be used:

1. Database Connection
    - The database connection is used to connect to a database and execute queries.
    - Managed by the **GLX-ORM** (Object Relational Mapping).
        - The ORM is used to create,manage, update and delete the database entity's.
2. Cache Connection
    - The cache connection is used to connect to a cache server and execute queries.
3. Client 
    - The Module client is used to define some module specific routines that can possibly be shared with other modules.
4. Presenter
     - The presenter can be used to create a web-server, an electron interface and more.
     - The ExpressKernel contains a ready to use presenter/web-server on base of express.js.
     - The ElectronKernel contains a ready to use presenter/electron-ipc emitter for Node to Frontend communication.

Then modules have two types of resources that can be registerd to the module:
1. Service
   - A Service is a class that can be used to implement business logic as a background task.
   - The service can be used to implement a cronjob, a background task or a long running process.
2. Action
   - Defines a function that can be called from the outside.
     - In case of the BaseAction of the Express-Kernel-Package, the action can be called from a HTTP request.
     - In case of the BaseAction of the Electron-Kernel-Package, the action can be called from a Electron-IPC call.

### The Bridges
Bridges are used to connect one module to another. 
In the Module definition you can require other modules and use there resources in your module.
If the Kernel startes it will resolve all dependencies of the modules, check for dependency cycles and create a bridge for each requirement.
So the first bridges do is to connect two modules together, but they are also be used to set the module start up order.
If the kernel notifies the modules to start up, all modules try to start up the same time, only modules that have required another module will wait until all required modules are completely started. 
