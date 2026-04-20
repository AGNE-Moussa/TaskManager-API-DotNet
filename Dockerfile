# ── Étape 1 : Build ──────────────────────────────────────────
FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /src

# Copier et restaurer les dépendances
COPY TaskManager.API/TaskManager.API.csproj TaskManager.API/
RUN dotnet restore TaskManager.API/TaskManager.API.csproj

# Copier le reste du code et compiler
COPY TaskManager.API/. TaskManager.API/
WORKDIR /src/TaskManager.API
RUN dotnet publish -c Release -o /app/publish

# ── Étape 2 : Runtime ────────────────────────────────────────
FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS runtime
WORKDIR /app

# Utilisateur non-root pour la sécurité
RUN adduser --disabled-password --gecos "" appuser && chown -R appuser /app
USER appuser

# Copier les fichiers compilés
COPY --from=build /app/publish .

# Port exposé
EXPOSE 5237

# Variable d'environnement
ENV ASPNETCORE_URLS=http://+:5237

# Lancement
ENTRYPOINT ["dotnet", "TaskManager.API.dll"]