# Horizontal Scroll Menu
iOS, Swift 4, horizontal scroll menu.

## Various view controller based transitions

1. Presenting a view controller
2. Transition from one view controller to another
3. Display another view controller. 

## Presenting a view controller
I have a sample project that [here](https://github.com/equitronix/sidemenu) that shows how a view controller can present another view controller. Presenting is usually modal in nature and can use either one of the stock animaitons or custom. The example above uses custom animation to present a side panel menu, also called drawer or side menu or whatever have you.  

## Transition from one view controller to another
All view controller transitions follow a similar pattern (at least as far as I know). There is a container view with a container controller. This can be say a tab or navigation controller or a custom container created by you. The transition is always between child controllers of this container controller. The controller (with its root view) that is currently being displayed is called _presenting controller_ and the new controller to be displayed is called _presented controller_. For the transition to start, note, that the presented controller should be added as a child controller of the container controller. Next by supplying animation block you can control the visual aspects of the transition. Usually, and by default, the presenting controller is removed from the container after the animation ends. But you can however control that. Please refer to this [project](https://github.com/equitronix/sidemenu) to see how this is done.  


## Display another view controller 
[TBD]  

---
## Horizontal Scroll Menu - over view





