using System.Threading.Tasks;
using Azure.Messaging.ServiceBus;
using GeneXus.Deploy.AzureFunctions.Handlers.Helpers;
using GeneXus.Deploy.AzureFunctions.ServiceBusHandler;
using Microsoft.Azure.Functions.Worker;

namespace ServiceBusQueueFunctions
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
        public async Task RunSingle([ServiceBusTrigger("$class.topicName$","$class.subscriptionName$", Connection = "$class.connectionName$", IsBatched = false, IsSessionsEnabled=$class.sessionEnabled$)] ServiceBusReceivedMessage receivedMessages, FunctionContext context)
        {
            ServiceBusTriggerHandler function = new ServiceBusTriggerHandler(_callmappings);
            await function.RunSingle(receivedMessages, context);
        \}
    \}
    }$
}