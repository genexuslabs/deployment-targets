using Azure.Storage.Queues.Models;
using GeneXus.Deploy.AzureFunctions.Handlers.Helpers;
using GeneXus.Deploy.AzureFunctions.QueueHandler;
using Microsoft.Azure.Functions.Worker;

namespace QueueTriggerFunctions
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
        public void Run([QueueTrigger("$class.queueName$", Connection = "$class.connectionName$")] QueueMessage queueMessage, FunctionContext context)
        {
            QueueTriggerHandler function = new QueueTriggerHandler(_callmappings);
            function.Run(queueMessage, context);
        \}
       
    \}
    }$
}