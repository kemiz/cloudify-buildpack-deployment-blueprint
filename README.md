cloudify-buildstep-nodecellar-singlehost
========================================

A sample Cloudify 3 blueprint that simulates two hosts and installs a sample nodejs+mongodb application. Effectivelly all of the components are installed on the same host as the Cloudify manager. 

The sample nodejs application used here is [nodecellar-docker](https://github.com/kemiz/cloudify-buildstep-nodecellar-singlehost) which is a Dockerised & Buildpack compatible fork of [nodecellar](http://coenraets.org/blog/2012/10/nodecellar-sample-application-with-backbone-js-twitter-bootstrap-node-js-express-and-mongodb/).

## Process
-- Using a [buildstep](https://github.com/progrium/buildstep) we build a Docker image Heroku-style application as a Docker image from a Dockerfile & a Procfile alogside the standard NodeJS Buildpack specification.


Please refer to [the Cloudify quick start guide](http://getcloudify.org/guide/3.0/quickstart.html) for directions about about how to deploy this blueperint, and to [the Cloudify blueprint guide](http://getcloudify.org/guide/3.0/blueprint-guide.html) for a detailed explanation about the blueprint structure and syntax. 
