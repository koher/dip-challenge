# DIP Challenge

This app has the dependencies shown below.

```
   ----> Input ----->
UI                    Use Cases --> Entities
   <-- Presenters ---

```

Following [DIP](https://en.wikipedia.org/wiki/Dependency_inversion_principle), change the dependencies like below.

```
   ----> Input ----->
UI                    Use Cases --> Entities
   --> Presenters -->
```

## App

This app is named "Weatherteller". It is a kind of fortune-telling apps, whose results are weathers. When you input your birthday, the app shows your "weather" of today.
