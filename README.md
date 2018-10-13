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
Often times you need to provide a horizontal scrolling menu with multiple buttons. Clicking a button should bring the relevant view controller on a specified area of the screen.  
This is a sample project that shows you how easy it is to create this use case without using any pods. All you need for the menu are:
1. Scroll view
2. Horizontal stack view 
3. Set the constraints of the above as shown in the project
4. A number of buttons - as many view controllers that need to be displayed.
5. A container view - this will be the view that will hold the active view controller. 

You will notice, in the code, that we use UIViewController's transition function to transition from presenting view to presented view. There is some nice and simple animation thrown in as well.  

The transition function is essentially a wrapper over a few other function calls. The code for that is commented in ViewController.swift file for anyone who would like to see what happens internally.  


## Notes on View Controllers
1. View controllers (VC) are of 2 types: content and container.
2. All view controllers have a root view that encloses all of VC content. All other views are sub views of this root view.
2. Content VC have only child views and is responsible for managing them
3. Container VC have root view which has its child views and also has clild view controllers. This a container VC can have both clild view controllers and content including child views of its root view.
4. The container VC manages its root view, its sub views and ONLY the root view of its child view controllers. 
5. Each iOS app has one (can have more than one if multiple devices are being controller simultaneously) window object. 
6. The window has 1 root view controller. This is the overall parent of all other view controllers in the app. 
7. Use rootViewController porperty of UIWindow
8. For example a navigation controller is a container VC which manages the tool bar, navigation bar on its own and loads a VC supplied by you.
9. Similarly split, tab and page are all container VC
10. You can imagine a split view controller to be formed with a container view as the root view of the root controller (one that is attached to Window). To the root view of this container you could add child view containers arranged horizontally and then content view controllers attached via story board or code to these child container view.





