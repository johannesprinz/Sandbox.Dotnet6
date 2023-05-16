# Dotnet 6 Sandbox

For the exploration of dotnet 6 language features, minimal apis and best practice
patterns for testing. In addition to this I am exploring the use of Copilot as a
pair programming buddy.

I will draw inspiration from [my experiences](https://www.linkedin.com/in/johannesprinz/),
[ChatGPT](https://chat.openai.com/), [Copilot](https://copilot.github.com/) and
the internet at large.

## Getting started

This project uses containers for development and continuous deployment. I used
[VSCode](https://code.visualstudio.com/) and the
[Dev containers extension](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers)
to get this solution up and running. At this stage the extension only works with
[Docker Desktop](https://www.docker.com/products/docker-desktop/). In the future
I hope to use [Podman](https://podman.io/) and/or [Rancher Desktop](https://rancherdesktop.io/).

Clone the repository and open it in VSCode. You will be prompted to open the
project in a container. This will build the container and open the project in
the container.

Run the tests with `dotnet test` or `dotnet watch test`. Run the application
with `dotnet run --project src/miniapi/miniapi.csproj`.

## How we got here

```bash
dotnet new sln --name Sandbox.Dotnet6
dotnet new xunit -n app.spec -o test/app.spec
dotnet sln add test/app.spec/app.spec.csproj
dotnet add ./test/app.spec/app.spec.csproj package FluentAssertions
dotnet add ./test/app.spec/app.spec.csproj package Moq
dotnet new classlib -n app -o src/app
dotnet sln add src/app/app.csproj
dotnet add ./test/app.spec/app.spec.csproj reference src/app/app.csproj
dotnet new web -n miniapi -o src/miniapi
dotnet sln add src/miniapi/miniapi.csproj
dotnet add ./test/app.spec/app.spec.csproj reference src/miniapi/miniapi.csproj
dotnet add ./test/app.spec/app.spec.csproj package Microsoft.AspNetCore.Mvc.Testing
```
