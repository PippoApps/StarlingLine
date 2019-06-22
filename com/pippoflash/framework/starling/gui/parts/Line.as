package com.pippoflash.framework.starling.gui.parts 
{
	import com.pippoflash.utils.UNumber;
	import flash.geom.Point;
	import starling.display.Canvas;
	
	/**
	 * ...
	 * @author Pippo Gregoretti
	 */
	public class Line extends Canvas 
	{
		private var _color:Number;
		private var _strokeWidth:Number;
		private var _origin:Point;
		private var _destination:Point;
		private var _pointFromZero:Point = new Point();
		/**
		 * 
		 * @param	col
		 * @param	or
		 * @param	dest
		 */
		public function Line(col:Number=0, strokeWidth:Number=1, or:Point=null, dest:Point=null) {
			super();
			_strokeWidth = strokeWidth;
			_color = col;
			_origin = or ? or : new Point();
			_destination = dest ? dest : new Point();
			renderLine();
			update(or ? or : new Point(), dest ? dest : new Point());
		}
		public function update(or:Point, dest:Point):void {
			_origin = or;
			_destination = dest;
			renderLine();
		}
		
		
		// RENDER
		private function renderLine():void {
			x = _origin.x;
			y = _origin.y;
			_pointFromZero.x = _destination.x - _origin.x;
			_pointFromZero.y = _destination.y - _origin.y;
			clear();
			beginFill(_color);
			drawRectangle(0, 0, UNumber.getDistance(_pointFromZero), _strokeWidth);
			endFill();
			rotation = UNumber.getRadians(_pointFromZero);
		}
		
		
		
		// GET SET
		public function get color():Number {
			return _color;
		}
		
		public function set color(value:Number):void {
			_color = value;
			renderLine();
		}
		
		
		public function get origin():Point 
		{
			return _origin;
		}
		
		public function set origin(value:Point):void 
		{
			_origin = value;
			renderLine();
		}
		
		public function get destination():Point 
		{
			return _destination;
		}
		
		public function set destination(value:Point):void 
		{
			_destination = value;
			renderLine();
		}
		
		public function get strokeWidth():Number 
		{
			return _strokeWidth;
		}
		
		public function set strokeWidth(value:Number):void 
		{
			_strokeWidth = value;
			renderLine();
		}
		
		
		
		
		
	}

}