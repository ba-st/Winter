# Winter <!--[![Build Status](https://travis-ci.org/apiorno/Winter.svg?branch=master)](https://travis-ci.org/apiorno/Winter) -->
<img src="./logo/winter.png" height="48" width="48" >   

 Winter is the new and updated version of [Storm][] from [Esteban][] . It is a  2D Game Framework Development using FFI with [Chipmunk2D Physics Engine][].
 
 ## Problems
 
  #### Chipmunk2D is temporaly disabled because of VM crashes problems on Linux and could not build properly on Windows. Physics temporaly simulated in Smalltalk.
  
  #### Sound does not work on pharo for linux distributions, framework works fine but you will not hear sounds on Linux.
 
 ## Instructions
  
  - Open a Playground and evaluate:

```smalltalk
Metacello new
  baseline: 'Winter';
  repository: 'github://apiorno/Winter:master/source';
  load
```
 ## Run Arkanoid example
  Copy files on "Game Examples files" to the image directory
  And then run this on playground:
  
  ```smalltalk
ArkanoidGame new start
```

[esteban]: https://github.com/estebanlm
[storm]: https://github.com/cdlm/pharo-storm
[chipmunk2d physics engine]:https://chipmunk-physics.net/
