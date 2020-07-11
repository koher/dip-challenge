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
