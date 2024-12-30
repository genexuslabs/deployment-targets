using GeneXus.Deploy.AzureFunctions.BlobHandler;
using GeneXus.Deploy.AzureFunctions.Handlers.Helpers;
using Microsoft.Azure.Functions.Worker;
using System.IO;

namespace BlobTriggerFunctions
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
        public void Run([BlobTrigger("$class.blobPath$", Source = BlobTriggerSource.EventGrid, Connection = "$class.connectionName$")] Stream blobItem, FunctionContext context)
        {
            BlobTriggerHandler function = new BlobTriggerHandler(_callmappings);
            function.Run(blobItem, context);
        \}
       
    \}
    }$
}