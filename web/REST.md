# API's and REST

#### 1. Explain REST:
- Representational State Transfer (REST).
- An architectural style of developing web services.
  - Data and functionality are considered resources and are accessed using Uniform Resource Identifiers (URIs), typically links on the Web.
  - Each resource is identified by URIs or global IDs.
  - REST uses the HTTP methods to define sever side actions.
  - The structure is built around the concept of resources.
  - A resource can be accessed by a common interface using HTTP standard methods.
- A client/server architecture designed to use a stateless communication protocol, typically HTTP.
  - A REST Server provides access to resources
  - A REST client accesses and presents resources from the server.
- Resources are acted upon by using a set of simple, well-defined operations.
- Clients and servers exchange representations of resources by using a standardized interface and protocol.


#### 2. Explain The RESTFul Web Service?
- Two common kinds of Web Services are REST and SOAP.
- REST, known as "RESTful web services".
- **Resource identification through URI**: A RESTful web service exposes a set of resources that identify the targets of the interaction with its clients. Resources are identified by URIs (Uniform Resource Identifier), which provide a global addressing space for resource and service discovery. See The @Path Annotation and URI Path Templates for more information.
- **Uniform interface**: Resources are manipulated using a fixed set of four create, read, update, delete operations: PUT, GET, POST, and DELETE. PUT creates a new resource, which can be then deleted by using DELETE. GET retrieves the current state of a resource in some representation. POST transfers a new state onto a resource. See Responding to HTTP Methods and Requests for more information.
- **Self-descriptive messages**: Resources are decoupled from their representation so that their content can be accessed in a variety of formats, such as HTML, XML, plain text, PDF, JPEG, JSON, and others. Metadata about the resource is available and used, for example, to control caching, detect transmission errors, negotiate the appropriate representation format, and perform authentication or access control. See Responding to HTTP Methods and Requests and Using Entity Providers to Map HTTP Response and Request Entity Bodies for more information.
- **Stateful interactions through hyperlinks**: Every interaction with a resource is stateless; that is, request messages are self-contained. Stateful interactions are based on the concept of explicit state transfer. Several techniques exist to exchange state, such as URI rewriting, cookies, and hidden form fields. State can be embedded in response messages to point to valid future states of the interaction. See Using Entity Providers to Map HTTP Response and Request Entity Bodies and “Building URIs” in the JAX-RS Overview document for more information.

- SOAP (Simple Object Access Protocol) which is an XML-based way to expose web services.



#### 3. Explain What Is A “Resource” In REST?
- REST architecture treats every content as a resource. These resources can be either text files, HTML pages, images, videos or dynamic business data.

- REST Server provides access to resources and REST client accesses and modifies these resources. Here each resource is identified by URIs/ global IDs.


#### 4. What Is The Most Popular Way To Represent A Resource In REST?
- REST uses different representations to define a resource like text, JSON, and XML.
- XML and JSON are the most popular representations of resources.


####  5. What Is URI? Explain Its Purpose In REST Based Web Services. What Is Its Format?
- URI stands for Uniform Resource Identifier. URI is the identifier for the resource in REST architecture.
- The purpose of a URI is to locate a resource(s) on the server hosting the web service. Formatted as: `<protocol>://<service-name>/<ResourceType>/<ResourceID>`


#### 6. What Do You Understand By Payload In RESTFul Web Service?
- Request body of every HTTP message includes request data called as Payload. This part of the message is of interest to the recipient.

- We send the payload in `POST` method but not in `GET` and `DELTE` methods.


#### 7. What Is The Upper Limit For A Payload To Pass In The POST Method?
- `GET` appends data to the service URL. But, its size shouldn’t exceed the maximum URL length. However, `POST` doesn’t have any such limit.

- So, theoretically, a user can pass unlimited data as the payload to POST method. But, if we consider a real use case, then sending POST with large payload will consume more bandwidth. It’ll take more time and present performance challenges to your server. Hence, a user should take action accordingly.


#### 8. Explain The Caching Mechanism?
- Caching is a process of storing server response at the client end. It decreases the amount of work required by the server. Fewer calls will be made if content has not changed and/or responses will be smaller.

- The server response holds information which leads a client to perform the caching. It helps the client to decide how long to archive the response or not to store it at all.


#### 9. What makes REST unique?
- Rest is a service architecture and design for network-based software architecture.
- It supports many different data formats.
- It supports caching.
- A REST client is just like a browser and uses standard methods. An application has to fit inside it.
- It uses the HTTP headers to hold meta information.


#### 10. What Are The Tools Available For Testing Web Services?
- Postman


#### 11. Which Java API Helps In Developing A RESTFul Web Service?
- Examples may include:
  - JAX-RS library
  - Jersey, which uses JAX-RS
  - RESTEasy, RESTlet, and Apache CFX.
  - For Scala, the Play framework


## Sources:
- [api interview questions](http://www.techbeamers.com/rest-api-interview-questions-answers/)
- [The Java EE 6 Tutorial: What Are Restful Web Services?](http://docs.oracle.com/javaee/6/tutorial/doc/gijqy.html)