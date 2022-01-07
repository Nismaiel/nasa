# NASA Project

the nasa project created in flutter using BLoc for state management and NASA astronomy picture of the day api


## Getting Started

The app contains the minimal implementation required to create a new  project. The repository code is preloaded with some basic components like basic app architecture constants and required dependencies to create a new project. By using the app code as standard initializer, we can have same patterns in all the projects that will inherit it. This will also help in reducing setup & development time by allowing you to use same code pattern and avoid re-writing from scratch.

## How to Use 

**Step 1:**

Download or clone this repo by using the link below:

```
https://github.com/Nismaiel/nasa.git
```

**Step 2:**

Go to project root and execute the following command in console to get the required dependencies: 

```
flutter pub get 
```

## NASA Features:

* homeScreen
* Image info
* offline mode
* image caching
* http
* online& offline search
* Bloc state management



### Libraries & Tools Used

* [http](https://github.com/dart-lang/http)  
* [flutter_bloc](https://github.com/felangel/bloc/tree/master/packages/flutter_bloc) (State Management)
* [path_provider](https://github.com/flutter/plugins/tree/master/packages/path_provider/path_provider) (to cache the data and display it offline)
* [cached_network_image](https://github.com/Baseflow/flutter_cached_network_image) (to display images in offline mode)
* [connectivity ](https://github.com/flutter/plugins) (to handle the user's connectivity state)




### Folder Structure
Here is the core folder structure which flutter provides.

```
flutter-app/
|- android
|- build
|- ios
|- lib
|- test
```

Here is the folder structure we have been using in this project

```
lib/
|- blocs/
|- data/
|- presentation/
|- services/
|- main.dart
```




