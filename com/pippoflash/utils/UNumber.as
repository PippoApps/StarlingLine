/* UNumber - ver 0.1 - Filippo Gregoretti - www.pippoflash.com

Manages alignment and resizing of clips


*/

package com.pippoflash.utils {

	//import									com.pippoflash.utils.Debug;
	import									flash.system.*;
	import									flash.display.*;
	import									flash.geom.*;
	import									flash.events.*;
// 	import									flash.text.TextField;
// 	import 									fl.motion.Color; 
	
	public class UNumber {
		
// UTILITIES ////////////////////////////////////////////////////////////////////////////
		// Constants
		private static const RADIANS_TO_ANGLE		:Number = 180 / Math.PI;
		private static const ANGLE_TO_RADIANS		:Number = Math.PI / 180;
		public static const POINT_ZERO				:Point = new Point(0, 0);
		// Static switches
		public static var _verbose					:Boolean = true;
		//public static var _debugPrefix				:String = "UNumber";
		// UTY
		private static var _s						:String;
		private static var _i						:int;
		private static var _n						:Number;
// RANDOM ///////////////////////////////////////////////////////////////////////////////////////
		public static function getRandom				(n:uint, plus:uint=0):Number { // Returns a random number from 0 to n-1 (ideal for arrays)
			return							Math.floor(Math.random()*n) + plus;
		}
		public static function getRandomSlot			(o:Object):Object { // Returns a random slot from an array, a vector, or any element with a length property
			if (o is XML)						return o.children()[getRandom(o.children().length())];
			if (o is XMLList)						return o[getRandom(o.length())];
			else if (o.length != undefined && o.length != null) return o[getRandom(o.length)];
			//Debug.error						(_debugPrefix, "Cannot getRandomSlot() from " + o);
			return							null;
		}
// LOOPS AND RANGES ///////////////////////////////////////////////////////////////////////////////////////
		public static function loop					(n:int, end:int, start:int=0):int { // Loops a number. If it is >= then end becomes start. If it is < than start it becomes end-1.
			// This is ideal to loop on arrays, since it never returns end but only end-1
			return							n < start ? end-1 : n >= end ? start : n;
		}
		public static function getRanged				(n:Number, max:Number=100, min:Number=0):Number {
			return							n > max ? max : n < min ? min : n;
		}
		/**
		 * Ranges between 0 and 1
		 * @param	n
		 * @return
		 */
		static public function getRanged01(n:Number):Number {
			return n < 0 ? 0 : n > 1 ? 1 : n;
		}
// GEOMETRY ///////////////////////////////////////////////////////////////////////////////////////
		public static function angleToRadians			(a:Number):Number {
			return							a * ANGLE_TO_RADIANS;
		}
		public static function radiansToAngle			(r:Number):Number {
			return							r * RADIANS_TO_ANGLE;
		}
		public static function getRectCenter			(r:Rectangle):Point { // Center point of a rectangle
			return							new Point(r.x+r.width/2, r.y+r.height/2);
		}
		public static function getAngle				(p1:Point, p2:Point=null):Number {
			return							radiansToAngle(getRadians(p1, p2));
		}
		public static function getRadians(p1:Point, p2:Point=null):Number {
			// Returns radians between 2 points
			// If only one point (p1) is set returns from 0,0
			if (!p2) { // Return from 0,0
				p2 = p1.clone();
				p1 = new Point(0, 0);
			}
			return Math.atan2(p2.y-p1.y, p2.x-p1.x);
		}
		static public function getDistance(p1:Point, p2:Point=null):Number { // Basically hypothenuse
			if (p2) return Math.sqrt(Math.pow(p2.x - p1.x, 2) + Math.pow(p2.y - p1.y, 2)); // Difference between 2 points
			else return Math.sqrt(Math.pow(p1.x, 2) + Math.pow(p1.y, 2)); // Only one point, therefore from 0
		}
		public static function getRelPos				(p:Point, degrees:Number, dist:Number):Point { // relative position in degrees and distance from a point
			var r								:Point = Point.polar(dist, angleToRadians(degrees));
			r.x								+= p.x;
			r.y								+= p.y;
			return							r;
		}
		public static function getPos					(degrees:Number, dist:Number):Point { // Position in degrees and points from 0,0
			return							Point.polar(dist, angleToRadians(degrees));
		}
// PERCENT ////////////////////////////////////////////////////////////////////////////////
		public static function getPercent				(total:Number, percent:Number):Number { // TOTAL, PERCENT
			// Finds a percentage (total, percent)
			return							(total/100)*percent;
		}
		public static function calculatePercent			(fraction:Number, total:Number):Number { // FRACTION, TOTAL
			// (20,200) = 10;  (3,10) = 30;
			return							100/(total/fraction);
		}
		public static function calculatePercentRange		(fraction:Number, total:Number):Number {
			// Calculates a percent which is in range 0-100
			return							checkPercentRange(calculatePercent(fraction, total));
		}
		public static function checkPercentRange		(n:Number):Number {
			// Returns a number which is in the 0-100 range
			return							getRanged(n);
		}
// UTY ///////////////////////////////////////////////////////////////////////////////////////
	}
}


/* ________________________________________________________
All AS files and libraries included in the domain com.pippoflash.*
Are open.source libraries developed by Filippo Gregoretti, and are therefore not copyrightable.
They can be used in commercial projects but must be left free for re-distribution and usage.
They go with all MovieClips included in the .fla or .xfl document, in the folders:
- PippoFlash.com - Framework

- PippoFlash.com - Components
All movieclips and assets within those folders in the source flash document (fla or xfl) 
are open source anc dan be used in commercial projects, but cannot be copyrighted.
__________________________________________________________ */