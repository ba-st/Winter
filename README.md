# Winter [![Build Status](https://travis-ci.org/apiorno/Winter.svg?branch=master)](https://travis-ci.org/apiorno/Winter) [![Coverage Status](https://coveralls.io/repos/github/apiorno/Winter/badge.svg)](https://coveralls.io/github/apiorno/Winter)
<img src="./logo/winter.png" height="48" width="48" >   

 Winter is the new and updated version of [Storm][] from [Esteban][] . It is a framework to develop games in 2D using Smalltalk.
  
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

- Particles Effect

## Unresolved issues
   
#### Sound does not work on pharo for linux distributions, framework works fine but you will not hear sounds on Linux.
   
## Instructions
  
  - Open a Playground and evaluate:

```smalltalk
Metacello new
  baseline: 'Winter';
  repository: 'github://ba-st/Winter:master/source';
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
