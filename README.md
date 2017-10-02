# Winter [![Build Status](https://travis-ci.org/apiorno/Winter.svg?branch=master)](https://travis-ci.org/apiorno/Winter)
<img src="./logo/winter.png" height="48" width="48" >   

 Winter is the new and updated version of [Storm][] from [Esteban][] . It is a  2D Game Framework Development using FFI with [Chipmunk2D Physics Engine][].
 
 ## Instructions
  Build Chipmunk2D project,  Linux libs and MacOS 64 bits lib are in libs folders. Must put them in image directory inside pharo folder.
  
  - Then open a Playground and evaluate:

```smalltalk
Metacello new
  baseline: 'Winter';
  repository: 'github://apiorno/Winter:master/source';
  load
```

[esteban]: https://github.com/estebanlm
[storm]: https://github.com/cdlm/pharo-storm
[chipmunk2d physics engine]:https://chipmunk-physics.net/
