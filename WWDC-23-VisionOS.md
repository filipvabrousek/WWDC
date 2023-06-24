## visionOS


### Icons
* icons can have up to 3 layers
* shadows are added automatically
* icons highlight when you look at them
* when you tap two fingers together you open the app


### Design
* Icons get bigger once user moves away from the window
* font weight is slightly heavier on visionOS
* vibrancy: primary, secondary, terciary
* use system colors calibrated for high liegibility 
* at least 60 pts tappable target
* 16 pts spacing between multiple buttons
* smaller space between non-interactive elements
* ornaments have 20pt overlaps
* ornaments can expand when you look at them longer
* buttons can show tooltip when you look at them longer


### Modals
* sheets are in the center and open at the original z-index while pushing parent window backwards

### Interaction
* physical keyboard, trackapd
* virtual keyboard
* select with eyes, and two finger flinch together opens the app
* two finger up motion makes the view scroll



### Windows
* go wider, not taller
* windows glass material
* avoid opaque - no transparent windows
* always place close button in the top left


## Ornaments
* any side
* can have any view inside it 192248
* Use system-provided toolbars and tab bars unless you need to create custom components


## Passthrough
* Your app doesn’t receive direct information about the current level of passthrough or when it changes, which means that you don’t know how well a person can see their surroundings
* visionOS implements the following behaviors while people use apps.

If a person moves more than about a meter, the system automatically makes all displayed content translucent to help them navigate their surroundings.

When a fully immersive experience starts, the system defines an invisible zone that extends 1.5 meters from the initial position of the wearer’s head. If their head moves outside of that zone, the experience automatically stops and passthrough returns to help people avoid colliding with objects in their physical surroundings.

The system can stop an immersive experience when people get too close to a physical object or when they move too quickly.
19:33:09 wow !!!
 
### Windows
### Volumes
### Spaces
