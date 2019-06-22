# StarlingLine
Class to simply draw and update lines in ActionScript 3 in Starling framework.
Line.as extends starling.Canvas.


Use as follows:

import flash.geom.Point;
import com.pippoflash.framework.starling.gui.parts.Line;

// Parameters are: color, stroke width, origin, destination

var line:Line = new Line(0xff0000, 1, new Point(0,0), new Point(100,100)); 
addChild(line);


// You can use the following methods or setters:

line.update(new Point(0,0), new Point(100,100));

line.origin = new Point(0,0);

line.destination = new Point(100,100);

line.color = 0xffffff;

line.strokeWidth = 5;


// BEWARE - this is a canvas extension. The instance itself gets repositioned and rotated, so if you draw other elements inside the canvas they will be rotated and repositioned along the line. This might be a desired effect.
