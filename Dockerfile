FROM mcr.microsoft.com/dotnet/core/sdk:3.1  AS build-env
WORKDIR /app

# Copy csproj and restore as distinct layers
COPY . ./aspnetapp/
WORKDIR /app/aspnetapp
RUN dotnet restore

# Copy everything else and build
COPY . ./api1/
RUN dotnet publish "api1" -c Release -o /app

# Build runtime image
FROM mcr.microsoft.com/dotnet/core/aspnet:3.1 as final
WORKDIR /app
COPY --from=build-env /app .
CMD ASPNETCORE_URLS=http://*:$PORT dotnet api1.dll --environment "Production"