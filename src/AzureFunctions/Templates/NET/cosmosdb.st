using GeneXus.Deploy.AzureFunctions.CosmosDBHandler;
using GeneXus.Deploy.AzureFunctions.Handlers.Helpers;
using Microsoft.Azure.Functions.Worker;
using System.Collections.Generic;

namespace CosmosDBTriggerFunctions
{
    $classes:{class | 
    public class $class.className$
    {
        private ICallMappings _callmappings;
		public $class.className$(ICallMappings callMappings)
        {
            _callmappings = callMappings;
        \}

        [Function("$class.functionName$")]
        public void Run([CosmosDBTrigger(databaseName:"$class.databaseName$", containerName:"$class.containerName$", Connection = "$class.connectionName$", LeaseContainerName ="$class.leaseContainerName$",LeaseContainerPrefix ="$class.leaseContainerPrefix$",LeaseDatabaseName ="$class.leaseDatabaseName$",LeaseConnection ="$class.leaseConnection$")] IReadOnlyList<Dictionary<string, object>> doc, FunctionContext context)
        {
           CosmosDBTriggerHandler function = new CosmosDBTriggerHandler(_callmappings);
            function.Run(doc, context);
        \}
       
    \}
    }$
}