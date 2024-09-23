/// @description Controlar rebate da bola no taco

directionBall = direction;
speedBall = speedInitial;

positionYDown = y + (sprite_height/2);
positionXRight = x + (sprite_width/2);
positionXLeft = x - (sprite_width/2);

otherPositionXLeft = other.x - (other.sprite_width/2);
otherPositionXRight = other.x + (other.sprite_width/2);
otherPositionYTop = other.y - (other.sprite_height/2);
otherPositionYDown = other.y + (other.sprite_height/2);

if (positionYDown - otherPositionYTop < positionXRight - otherPositionXLeft &&
	positionYDown - otherPositionYTop < otherPositionXRight - positionXLeft  &&
	positionYDown <= otherPositionYDown) {

	y = otherPositionYTop - (sprite_height/2) - 1;
	
	intersection = (other.x - x) / (other.sprite_width/2);	
	
	speedBall = speedBall + (speedBall * (intersection < 0 ? intersection * -1 : intersection));

	if (intersection == 0) intersection = (direction <= 270) ? 0.1 : -0.1;
	
	directionBall = 90 + (75 * intersection);	
	
	while (directionBall >= 360) directionBall -= 360;

} else if (positionXRight >= otherPositionXLeft && x <= other.x) {
	x = otherPositionXLeft - (sprite_width/2) - 1;
		
	intersection = (y - other.y) / other.sprite_height;
	if (intersection < 0) intersection *= -1

	directionBall = 180 + (75 * intersection);	

} else if (positionXLeft <= otherPositionXRight && x > other.x) {
	x = otherPositionXRight + (sprite_width/2) + 1;
		
	intersection = (other.y - y) / other.sprite_height;
	if (intersection < 0) intersection *= -1

	directionBall = 0 + (75 * intersection);

	while (directionBall < 0) directionBall += 360;
}	

direction = directionBall;

speed = speedBall