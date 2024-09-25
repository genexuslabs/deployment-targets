using Azure.Messaging.EventGrid;
using GeneXus.Deploy.AzureFunctions.EventGridHandler;
using GeneXus.Deploy.AzureFunctions.Handlers.Helpers;
using Microsoft.Azure.Functions.Worker;

namespace EventGridAzureSchemaFunctions
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
        public void Run([EventGridTrigger(IsBatched =true)] EventGridEvent[] events, FunctionContext context)
        {
            EventGridTriggerHandlerAzure function = new EventGridTriggerHandlerAzure(_callmappings);
            function.Run(events, context);
        \}
       
    \}
    }$
}