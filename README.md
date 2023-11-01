# SwapiApp
A simple project that is for list of films and their details.

# Description:
This application includes list of films, details of individual film. Application has search functionality to find film by its title.

# Getting Started:
1. Make sure you have the Xcode version 14.0 or later installed on your computer.
2. Download the project files from repository.
3. Open the SwapiApp.xcodeproj file in Xcode.
4. Review the code.
5. Run the active scheme.

You can see the list of films and search bar added in the main screen. Select any film and check the details of it.

# Architecture:
1. SwapiApp is implemented using Model-View-Controller (MVC) architecture pattern.
2. Model has necessary data or business logic or fetch data from API.
3. View/Controller is responsible for displaying the UI to User.

# Structure:
1. "Model": This contains network and navigation related files.
2. "Views": This contains UI files to render in the application.
3. "Resources": Non-code files which are used by the project. These can include images, colors, fonts, videos etc..

# Dependencies:
Swift Package Manager is used as a dependency manager. 
- Package "Apollo": Apollo iOS executes queries and mutations using a GraphQL server and returns results as pre-generated and operation-specific Swift types. This means that Apollo iOS takes care of forming spec-compliant GraphQL requests, parsing JSON responses, and manually validating and type-casting response data for you.
