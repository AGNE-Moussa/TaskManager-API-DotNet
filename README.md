# TaskManager API 🗂️

![.NET](https://img.shields.io/badge/.NET-8.0-512BD4?style=flat-square&logo=dotnet)
![C#](https://img.shields.io/badge/C%23-239120?style=flat-square&logo=csharp)
![SQLite](https://img.shields.io/badge/SQLite-003B57?style=flat-square&logo=sqlite)
![Swagger](https://img.shields.io/badge/Swagger-85EA2D?style=flat-square&logo=swagger&logoColor=black)
![Docker](https://img.shields.io/badge/Docker-2496ED?style=flat-square&logo=docker&logoColor=white)

Une API RESTful de gestion de tâches développée avec **ASP.NET Core 8**, **Entity Framework Core** et **SQLite**. Ce projet illustre la conception d'une API CRUD complète avec documentation interactive Swagger.

---

## Fonctionnalités

- Créer, lire, modifier et supprimer des tâches (CRUD complet)
- Marquer une tâche comme terminée avec horodatage automatique
- Documentation interactive via Swagger UI
- Base de données SQLite embarquée (zéro configuration)
- Prêt pour la conteneurisation Docker

---

## Stack technique

| Technologie | Usage |
|---|---|
| ASP.NET Core 8 | Framework web |
| Entity Framework Core | ORM / accès données |
| SQLite | Base de données |
| Swagger / OpenAPI | Documentation API |
| C# | Langage principal |

---

## Endpoints

| Méthode | Route | Description |
|---|---|---|
| GET | `/api/tasks` | Récupérer toutes les tâches |
| GET | `/api/tasks/{id}` | Récupérer une tâche par ID |
| POST | `/api/tasks` | Créer une nouvelle tâche |
| PUT | `/api/tasks/{id}` | Modifier une tâche |
| DELETE | `/api/tasks/{id}` | Supprimer une tâche |

---

## Installation et lancement

### Prérequis
- [.NET 8 SDK](https://dotnet.microsoft.com/download)

### Lancer le projet

```bash
# Cloner le repository
git clone https://github.com/AGNE-Moussa/TaskManager-API-DotNet.git
cd TaskManager-API-DotNet/TaskManager.API

# Restaurer les dépendances
dotnet restore

# Lancer l'application
dotnet run
```

L'API sera disponible sur `http://localhost:5237`
La documentation Swagger sur `http://localhost:5237/swagger`

---

## Exemple d'utilisation

### Créer une tâche
```json
POST /api/tasks
{
  "title": "Apprendre ASP.NET Core",
  "description": "Suivre la documentation officielle Microsoft",
  "isCompleted": false
}
```

### Réponse
```json
{
  "id": 1,
  "title": "Apprendre ASP.NET Core",
  "description": "Suivre la documentation officielle Microsoft",
  "isCompleted": false,
  "createdAt": "2025-04-21T10:00:00Z",
  "completedAt": null
}
```

---

## Structure du projet
TaskManager.API/
├── Controllers/
│   └── TasksController.cs    # Endpoints REST
├── Data/
│   └── AppDbContext.cs       # Contexte Entity Framework
├── Models/
│   └── TaskItem.cs           # Modèle de données
├── Program.cs                # Configuration et démarrage
└── TaskManager.API.csproj    # Dépendances

## Docker

```bash
# Builder l'image
docker build -t taskmanager-api .

# Lancer le conteneur
docker run -p 5237:5237 taskmanager-api
```

---