![Build](https://github.com/genexuslabs/deployment-targets/workflows/Build/badge.svg)

# GeneXus Deployment Targets
![](/res/cardboard-box.png)

This repo holds the scripts needed to deploy a GeneXus generated application to different Cloud Providers and/or infrastructure. 

For more information about GeneXus's Deploy engine go to [Application Deployment tool](https://wiki.genexus.com/commwiki/servlet/wiki?32092).

Here's what's included in this repo:

Folder|Service
---|---
[AWSECS](./src/AWSECS)| [Amazon Elastic Container Service](https://aws.amazon.com/ecs/)
[AWSWlasticBeanstalk](./src/AWSWlasticBeanstalk)|[Amazon Elastic Beanstalk](https://aws.amazon.com/elasticbeanstalk/)
[AWSLambda](./src/AWSLambda)|[Amazon Lambda](https://aws.amazon.com/lambda/)
[AWSServerless](./src/AWSServerless)|[Amazon Serverless](https://aws.amazon.com/serverless/)
[Azure](./src/Azure)|[Microsoft Azure Web Apps](https://azure.microsoft.com/en-us/services/app-service/web/)
[Docker](./src/Docker)|[Docker](https://www.docker.com/)
[GoogleAppEngine](./src/GoogleAppEngine)|[Google App Engine](https://cloud.google.com/appengine)
[HCP](./src/HCP)|[SAP Cloud Platform (Neo)](https://www.sap.com/products/cloud-platform.html)
[IBMCF](./src/IBMCF)|[IBM Cloud Foundry](https://www.ibm.com/cloud/cloud-foundry)
[Local](./src/Local)|Local zip/war
[LocalSources](./src/LocalSources)|Local source files (Java only)
[SAPCloudFoundry](./src/SAPCloudFoundry)|[SAP Cloud Platform (Cloud Foundry)](https://www.cloudfoundry.org/the-foundry/sap-cloud-platform/)

### Installation 
As of GeneXus 16 Upgrade 11, this repo is the source for GeneXus and the Deployment Targets it supports. Changes here will be reflected in every GeneXus upgrade, and will be available at `<GeneXus path>\DeploymentTargets`

If you want to run this repo locally, all you have to do is clone it and and run the `update.bat` with the path to your GeneXus installation.  
```
.\deploy.bat "C:\Program Files\GeneXus"
```

### Create your own Deployment Target
We're open for Pull Requests, so if you need a new target or want to contribute with one, here's what you need to know.  
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
Lanugages|List of supported languages and their assigned application server
PropertiesDefinitions|Name of the file where the properties are defined (if any)

3. Create the properties definition file (when needed). This is also an xml file that will hold the definition for the properties you Deployment Target might need. You may want to take a look at the provided Properties.xml files in this repo.

4. Create the MSBuild script. This is the file that will do the actual deploy. The task you defined above will be called, along with every property defined by GeneXus plus your custom-defined properties. The most important property you'll receive is `$(DeploySource)` which will hold the path to the generated zip or war file, depending on the generator. That's the file you will want to upload to your target. Another usefull property is `$(GX_PROGRAM_DIR)` which will contain the path to the installation of GeneXus. This is usefull in case you want to import in your script some targets provided by GeneXus (like the MSBuild Community targets).

