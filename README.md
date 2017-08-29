# Storm2
<img src="./logo/logo.jpg" height="48" width="48" >   

 Storm2 is the second version of [Storm][] from [Esteban][] . It is a small 2D Game Framework Development using FFI with Chipmunk2D Physics Engine.
 
 ## Instructions
  Build Chipmunk2D project, for Linux 64bits lib is in libs64 folder. Must put them in "Shared" folder inside pharo folder.
  
  - Then open a Playground and evaluate:

```smalltalk
Metacello new
  baseline: 'Storm';
  repository: 'github://alvarop100/Storm2:master/source';
  load
```

[esteban]: https://github.com/estebanlm
[storm]: https://github.com/cdlm/pharo-storm
