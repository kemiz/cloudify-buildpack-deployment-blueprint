Cloudify Buildpack to Docker Deployment
========================================

A Cloudify 3 blueprint that enables you to deploy any standard buildpack-enabled application. The application source needs to include a Procfile and a simple Dockerfile. Effectivelly all of the components are installed on the same host as vm.

It uses [buildstep](https://github.com/progrium/buildstep) to build a Docker image of the application from the Dockerfile & the Procfile using also the standard NodeJS Buildpack specification.

=
### 1. Creating the Dockerfile

If your Procfile looks something like this:
```
web: node server.js
```
Then the Dockerfile should look like this:

```
FROM tutum/buildstep
EXPOSE 80
CMD ["/start", "web"]
```
=

### 2. Blueprint inputs

The blueprint takes in 5 inputs and can be sent as a json file:

* host_ip: The ip of the host the application will be deployed on        
* agent_user: User name used when SSH-ing into the started machine
*	agent_private_key_path: Path to a private key that resided on the management machine. SSH-ing into agent machines will be done with this key.
*	git_url: Web applications Git url 
*	git_branch: The Git branch
*	base_port: Web application port 
*	app_name: Name of the app to be deployed

For example:
```json
{
	"host_ip": "192.168.0.25",
	"agent_user": "vagrant",
	"agent_private_key_path": "/home/vagrant/.vagrant.d/key",
	"git_url": "https://github.com/kemiz/nodecellar",
	"git_branch": "master",	
	"base_port": "3000",	
	"app_name": "nodecellar"	
}
```

### 3. Example

As part of the blueprint it deploys a sample NodeJS application [nodecellar-docker](https://github.com/kemiz/cloudify-buildstep-nodecellar-singlehost) which is a Dockerised & Buildpack compatible fork of [nodecellar](http://coenraets.org/blog/2012/10/nodecellar-sample-application-with-backbone-js-twitter-bootstrap-node-js-express-and-mongodb/).


Please refer to [the Cloudify quick start guide](http://getcloudify.org/guide/3.0/quickstart.html) for directions about about how to deploy this blueperint, and to [the Cloudify blueprint guide](http://getcloudify.org/guide/3.0/blueprint-guide.html) for a detailed explanation about the blueprint structure and syntax. 
