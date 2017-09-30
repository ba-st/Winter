# Storm2 [![Build Status](https://travis-ci.org/alvarop100/Storm2.svg?branch=master)](https://travis-ci.org/alvarop100/Storm2)
<img src="./logo/logo.jpg" height="48" width="48" >   

 Storm2 is the second version of [Storm][] from [Esteban][] . It is a small 2D Game Framework Development using FFI with [Chipmunk2D Physics Engine][].
 
 ## Instructions
  Build Chipmunk2D project,  Linux libs and MacOS 64 bits lib are in libs folders. Must put them in image directory inside pharo folder.
  
  - Then open a Playground and evaluate:

```smalltalk
Metacello new
  baseline: 'Storm';
  repository: 'github://apiorno/Storm2:master/source';
  load
```

[esteban]: https://github.com/estebanlm
[storm]: https://github.com/cdlm/pharo-storm
[chipmunk2d physics engine]:https://chipmunk-physics.net/
