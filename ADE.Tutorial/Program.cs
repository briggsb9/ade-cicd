using Microsoft.Extensions.Hosting;
// Program.cs is the entry point for the Azure Functions worker runtime.
var host = new HostBuilder()
    .ConfigureFunctionsWorkerDefaults()
    .Build();

host.Run();
