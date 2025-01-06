# GeneXus Deployment Targets
This repository holds the scripts needed to deploy a GeneXus generated application to different Cloud Providers and/or infrastructure. 

For more information about GeneXus's Deploy engine go to [Application Deployment tool](https://wiki.genexus.com/commwiki/servlet/wiki?32092).

## Repo Status
|Branch |Build |
|-------|------|
|master | [![Build](https://github.com/genexuslabs/deployment-targets/actions/workflows/build.yml/badge.svg)](https://github.com/genexuslabs/deployment-targets/actions/workflows/build.yml) |
|beta   | [![Build](https://github.com/genexuslabs/deployment-targets/actions/workflows/build.yml/badge.svg?branch=beta)](https://github.com/genexuslabs/deployment-targets/actions/workflows/build.yml) |

## Services
The following is the list of supported services:

Folder|Service
---|---
[AWSElasticBeanstalk](./src/AWSElasticBeanstalk)|[Amazon Elastic Beanstalk](https://aws.amazon.com/elasticbeanstalk/)
[AWSLambda](./src/AWSLambda)|[Amazon Lambda](https://aws.amazon.com/lambda/)
[AWSServerless](./src/AWSServerless)|[Amazon Serverless](https://aws.amazon.com/serverless/)
[Azure](./src/Azure)|[Microsoft Azure Web Apps](https://azure.microsoft.com/en-us/services/app-service/web/)
[AzureFunctions](./src/AzureFunctions)| [Azure Functions](https://azure.microsoft.com/en-us/services/functions/)
[AzureServerless](./src/AzureServerless)| [Azure Servless]
[Docker](./src/Docker)|[Docker](https://www.docker.com/) (& [Kubernetes](https://kubernetes.io/))
[GoogleAppEngine](./src/GoogleAppEngine)|[Google App Engine](https://cloud.google.com/appengine)
[HCP](./src/HCP)|[SAP Cloud Platform (Neo)](https://www.sap.com/products/cloud-platform.html)
[IBMCF](./src/IBMCF)|[IBM Cloud Foundry](https://www.ibm.com/cloud/cloud-foundry)
[Local](./src/Local)|Local zip/war
[LocalSources](./src/LocalSources)|Local source files (Java only)
[SAPCloudFoundry](./src/SAPCloudFoundry)|[SAP Cloud Platform (Cloud Foundry)](https://www.cloudfoundry.org/the-foundry/sap-cloud-platform/)
[StaticFrontEnd](./src/StaticFrontEnd)|[AWS S3](https://aws.amazon.com/s3) & [Azure Object Storage](https://azure.microsoft.com/en-us/services/storage/blobs/)

## Beta Services
This is the list of services we are working on:

Folder|Service
---|---
[AWSECS](./src/AWSECS)| [Amazon Elastic Container Service](https://aws.amazon.com/ecs/)

Note: you can try this services through the [GeneXus Beta Testing program](https://wiki.genexus.com/commwiki/servlet/wiki?40580).

## Installation 
As of GeneXus 16 Upgrade 11, this repository is the source for GeneXus and the Deployment Targets it supports. The content of this repository is distributed with different GeneXus upgrades, you can find those scripts in a GeneXus installation inside the DeploymentTargets directory.

If you found some new services that are not available in your current GeneXus installation, you can execute the following steps to integrate them to your installation:  
1. Clone of the repository
2. Execute the `deploy.bat` included given the GeneXus installation path as an argument. You can optionally update one single Target adding the name of the folder as second argument

Note: these steps could be necessary if you update GeneXus afterwards.

```
git clone https://github.com/genexuslabs/deployment-targets.git .
.\deploy.bat "C:\Program Files\GeneXus" [Target]
```

## Create your own Deployment Target
We're open for Pull Requests, so if you need a new target or want to contribute with one, you are welcome to fork this repository and help us improve our product.  
Deployment Targets are based on MSBuild. Anyone can create their own Deployment Target, and here's what you need to know.

1. Create a folder under [src](./src) where you want to add your files.

2. Create the definition file, which must be called `Definition.target`.
This is is an XML file with the following tags

Tag|Description
---|---
ID|Unique identifier for the Deployment Target
Name|Name that will appear in the GeneXus IDE
Description|Meaningfull description (can also be a key to a resx file)
DeployMSBuild|MSBuild script that will be executed
DeployMSBuildTarget|Target to be called in the mentioned above MSBuild script
ResolverFactory|Dll file that will hold the resolvers for properties' default or visibility attributes.
Languages|List of supported languages and their assigned application server
PropertiesDefinitions|Name of the file where the properties are defined (if any)

3. Create the properties definition file (when needed). This is also an xml file that will hold the definition for the properties you Deployment Target might need. You may want to take a look at the provided Properties.xml files in this repository.

4. Create the MSBuild script. This is the file that will do the actual deploy. The task you defined above will be called, along with every property defined by GeneXus plus your custom-defined properties. The most important property you'll receive is `$(DeploySource)` which will hold the path to the generated zip or war file, depending on the generator. That's the file you will want to upload to your target. Another usefull property is `$(GX_PROGRAM_DIR)` which will contain the path to the installation of GeneXus. This is usefull in case you want to import in your script some targets provided by GeneXus (like the MSBuild Community targets).
