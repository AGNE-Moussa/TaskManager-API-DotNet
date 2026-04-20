# ── Étape 1 : Build ──────────────────────────────────────────
FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /src

COPY TaskManager.API.csproj .
RUN dotnet restore TaskManager.API.csproj

COPY . .
RUN dotnet publish -c Release -o /app/publish

# ── Étape 2 : Runtime ────────────────────────────────────────
FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS runtime
WORKDIR /app

RUN adduser --disabled-password --gecos "" appuser && chown -R appuser /app
USER appuser

COPY --from=build /app/publish .

EXPOSE 5237
ENV ASPNETCORE_URLS=http://+:5237

ENTRYPOINT ["dotnet", "TaskManager.API.dll"]