using Azure.Messaging;
using GeneXus.Deploy.AzureFunctions.EventGridHandler;
using GeneXus.Deploy.AzureFunctions.Handlers.Helpers;
using Microsoft.Azure.Functions.Worker;

namespace EventGridCloudEventFunctions
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
        public void Run([EventGridTrigger(IsBatched = true)] CloudEvent[] events, FunctionContext context)
        {
           EventGridTriggerHandlerCloud function = new EventGridTriggerHandlerCloud(_callmappings);
           function.Run(events, context);
        \}
       
    \}
    }$
}