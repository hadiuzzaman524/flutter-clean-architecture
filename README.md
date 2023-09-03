# Flutter Clean Architecture

## What is clean architecture?
<a href="https://blog.cleancoder.com/uncle-bob/2012/08/13/the-clean-architecture.html"> Clean Architecture </a>, conceptualized by Robert C. Martin, offers a structured approach to organizing applications by breaking them down into modules, each serving a distinct purpose. Its core principle revolves around dividing an application into three primary layers:

**Presentation Layer:** This layer's primary role is to present data to users and manage their input. It should remain devoid of any business logic and maintain simplicity as a fundamental principle.

**Domain Layer:** The domain layer is the hub of business logic within the application. It defines use cases and embodies the essence of the application's functionality. Importantly, it operates independently of other layers, facilitating isolated testing.

**Data Layer:** Responsible for data operations, this layer handles data retrieval and storage. It remains detached from the domain layer, focusing solely on data access and persistence concerns.

Clean Architecture's central tenet is preserving these well-defined layers to enhance application maintainability, scalability, and testability, while also enabling smoother code evolution.
<p float="left">
  <img src="https://github.com/hadiuzzaman524/clean-architecture-flutter/assets/52348628/57d8b605-beb7-4f5d-9c6b-843ab922d2be" width="600">
</p>


The concentric circles within the image represent the different areas within the software. The closer to the center, the higher level the software becomes. Notice how the horizontal arrows only point inwards, this is because the sole principle behind Clean Architecture is known as the Dependency Rule.

This means that code dependencies can only point inwards, as indicated by the arrows. A presenter within the interface adapter layer can't depend on any mechanisms within the drivers layer. However, a use case within the application business layer can depend on an entity within the enterprise business layer, and so on. The dependencies always point inwards.

The four circles illustrated in the diagram are schematic. There is no rule that states you should only have 4 layers within your software, you have have more, or less, but the main principle of the dependency rule still applies overall.

## Benefits of implementing Clean Architecture

**Modularity and Maintainability:** Clean Architecture encourages the separation of concerns into distinct layers. This makes your codebase more modular and easier to maintain. Developers can work on individual layers without affecting others, reducing the risk of unintended side effects.

**Testability:** The separation of the domain layer from the rest of the application allows for comprehensive unit testing of business logic. This ensures that your app behaves as expected, and changes can be validated through tests, reducing the chances of introducing bugs.

**Flexibility and Scalability:** Clean Architecture makes it easier to adapt and scale your app. You can replace or upgrade components within a layer without affecting the entire system. This flexibility is crucial as your app evolves and new features are added.

**Code Reusability:** Clean Architecture promotes the reuse of components. For instance, the domain layer, which contains the core business logic, can be reused across different platforms (e.g., web and mobile) if needed.

**Separation of Concerns:** The architecture enforces a clear separation between the user interface (presentation layer), business logic (domain layer), and data handling (data layer). This separation helps in understanding and maintaining the codebase.

**Reduced Dependency Hell:** Clean Architecture discourages high-level layers from having direct dependencies on lower-level layers. This minimizes the "dependency hell" problem and makes it easier to swap out components without cascading changes.

**Better Collaboration:** With well-defined boundaries between layers, development teams can work more efficiently. Front-end developers can focus on the presentation layer, back-end developers on data access, and domain experts on business logic.

## Clean Architecture implementation using Flutter

Clean Architecture was designed before the introduction of Flutter, and the diagram shared earlier is a broad approach applicable to software development in general, rather than being specific to any one platform. However, we can create our own Clean Architecture diagram customized specifically for Flutter's needs and characteristics.

<p float="center">
  <img src="https://github.com/hadiuzzaman524/clean-architecture-flutter/assets/52348628/b17c7259-b0d8-43e7-ab66-c24396be47a8" width="600">
</p>


## Getting Started 🚀

This project contains 3 flavors:

- development
- staging
- production

To run the desired flavor either use the launch configuration in VSCode/Android Studio or use the following commands:

```sh
# Development
$ flutter run --flavor development --target lib/main_development.dart

# Staging
$ flutter run --flavor staging --target lib/main_staging.dart

# Production
$ flutter run --flavor production --target lib/main_production.dart
```

