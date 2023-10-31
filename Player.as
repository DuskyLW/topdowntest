package
{
	import flash.display.Stage;
	import flash.display.MovieClip;
	import flash.events.Event;
	import KeyObject;
	
	public class Player extends MovieClip
	{
		public var stageRef:Stage;
		public var key:KeyObject;
		
		public var leftPressed:Boolean = false;
		public var rightPressed:Boolean = false;
		public var upPressed:Boolean = false;
		public var downPressed:Boolean = false;
		
		public var speed:Number = 5;
		
		public function Player(stageRef: Stage, X:int, Y:int):void
		{
			this.stageRef = stageRef; //assign the parameter to this instance's stageRef variable
			this.x = X;
			this.y = Y;
			
			key = new KeyObject(stageRef); //instantiate "key" by passing it a reference to the stage
			
			addEventListener(Event.ENTER_FRAME, loop, false, 0, true);
		} // end of Player function
		
		public function loop(e:Event):void
		{
			checkKeyPresses();
			
			if (leftPressed){
				x -= speed;
			} else if (rightPressed){
				x += speed;
			} // end of if else
			
			if (upPressed){
				y -= speed;
			} else if (downPressed){
				y += speed;
			} // end of if else
			
			// calculate these values, which we will use to determine the angle we need to rotate to
			var yDifference:Number = stageRef.mouseY - y;
			var xDifference:Number = stageRef.mouseX - x;
			// this constant will convert our angle from radians to degrees
			var radiansToDegrees:Number = 180/Math.PI;
			// this final line uses trigonometry to calculate the rotation
			rotation = Math.atan2(yDifference, xDifference) * radiansToDegrees;
		} // end of loop function
		
		public function checkKeyPresses():void
		{
			if (key.isDown(37) || key.isDown(65)){
				leftPressed = true;
				//trace("left pressed");
			} else {
				leftPressed = false;
			} // end of if else
			
			if (key.isDown(38) || key.isDown(87)){
				upPressed = true;
			} else {
				upPressed = false;
			} // end of if else
			
			if (key.isDown(39) || key.isDown(68)){
				rightPressed = true;
			} else {
				rightPressed = false;
			} // end of if else
			
			if (key.isDown(40) || key.isDown(83)){
				downPressed = true;
				//trace("down pressed");
			} else {
				downPressed = false;
			} // end of if else
		} // end of checkKeyPresses function
	} // end of Player class
} // end of class







































