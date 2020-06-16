![Build](https://github.com/genexuslabs/deployment-targets/workflows/Build/badge.svg)

# GeneXus Deployment Targets
![](/res/cardboard-box.png)

This repo holds the scripts needed to deploy a GeneXus generated application to different Cloud Providers and/or infrastructure. 

Here's whats included:

Folder|Service
---|---
[AWSECS](./src/AWSECS)| [Amazon Elastic Container Service](https://aws.amazon.com/ecs/)
[AWSWlasticBeanstalk](./src/AWSWlasticBeanstalk)|[Amazon Elastic BEanstalk](https://aws.amazon.com/elasticbeanstalk/)
[AWSLambda](./src/AWSLambda)|[Amazon Lambda](https://aws.amazon.com/lambda/)
[AWSServerless](./src/AWSServerless)|[Amazon Serverless](https://aws.amazon.com/serverless/)
[Azure](./src/Azure)|[Microsoft Azure Web Apps](https://azure.microsoft.com/en-us/services/app-service/web/)
[Docker](./src/Docker)|[Docker](https://www.docker.com/)
[GoogleAppEngine](./src/GoogleAppEngine)|[Google App Engine](https://cloud.google.com/appengine)
[HCP](./src/HCP)|[SAP Hana Cloud Platform](https://saphanacloudservices.com/)
[IBMCF](./src/IBMCF)|[IBM Cloud Foundry](https://www.ibm.com/cloud/cloud-foundry)
[Local](./src/Local)|Local zip/war
[LocalSources](./src/LocalSources)|Local source files (.cs/.java)
[SAPCloudFoundry](./src/SAPCloudFoundry)|[SAP Cloud Foundry](https://www.cloudfoundry.org/the-foundry/sap-cloud-platform/)