# Winter [![Build Status](https://travis-ci.org/apiorno/Winter.svg?branch=master)](https://travis-ci.org/apiorno/Winter) [![Coverage Status](https://coveralls.io/repos/github/apiorno/Winter/badge.svg)](https://coveralls.io/github/apiorno/Winter)
<img src="./logo/winter.png" height="48" width="48" >   

 Winter is the new and updated version of [Storm][] from [Esteban][] . It is a  2D Game Framework Development using FFI with [Chipmunk2D Physics Engine][].
 
## Problems
 
#### Chipmunk2D is temporarily disabled because of VM crashes problems on Linux and could not build properly on Windows. Physics temporarily simulated in Smalltalk.
  
#### Sound does not work on pharo for linux distributions, framework works fine but you will not hear sounds on Linux.
 
## Supported Media Files
 
### Sound 
      At the moment .aiff and .wav sound extensions are supported
### Images
      .bmp , .gif, .jpeg and .png image extensions are supported.
        
## Features
 <img src="./images/features.png" >  
 
## Future Work

- Tiled Maps

- Camera

- Physics with native library

- Network API (LAN & Online)

- Partciles Effect
   
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

## Run Wizar Battle Arena
  Orginally developed by [Clement Bera][]

```smalltalk
WBAGame start
```	

[clement bera]: https://github.com/clementbera
[esteban]: https://github.com/estebanlm
[storm]: https://github.com/cdlm/pharo-storm
[chipmunk2d physics engine]:https://chipmunk-physics.net/
