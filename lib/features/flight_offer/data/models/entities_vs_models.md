# Entity Vs Models
Why and how do you merge an Entity and a model in Flutter?
If we want to maintain the standard clean architecture approach, the entities must be separated from the models. With a large API to process and all the manual work to be done by the developer, this task can become boring and long, with the risk of making typing errors.

## What advantages does the freezed plugin offer?
With the use of the [Freezed](https://pub.dev/packages/freezed) plugin, it is no longer necessary to create an Entity class separately from the Model class.      


## What to do if you want to separate the Model entity? 
First of all, an Entity is a data representation that is closer to the data source (e.g. an API, a DB). To compare objects in Dart, you often need to override the == operator and hashCode. The dart lnaguage does not automatically support this like other languages. You can use the [equatable]() plugin to make life easier.  Normally, an entity does not contain any additional methods.    

In contrast, the model is a data abstraction that can contain additional methods, validation rules and data transformation. In a clean architecture approach, the model includes the fromMap() and toMap() methods. These methods allow raw data (e.g. JSON) to be converted into a specific format for the user interface: this is known as de-serialization.  
Use [Freezed](https://pub.dev/packages/freezed) to simplified your work. In resume: 
1. Define an Entity class without additional method
2. extends Entity to the Model class
3. De-serialization the Model class

