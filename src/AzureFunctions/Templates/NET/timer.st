using Microsoft.Azure.Functions.Worker;
using GeneXus.Deploy.AzureFunctions.Handlers.Helpers;
using GeneXus.Deploy.AzureFunctions.TimerHandler;

namespace TimerTriggerFunctions
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

        public void Run([TimerTrigger("$class.timerSchedule$")] TimerInfo timerInfo, FunctionContext context)
        {
            TimerTriggerHandler function = new TimerTriggerHandler(_callmappings);
            function.Run(timerInfo, context);
        \}
       
    \}
    }$
}