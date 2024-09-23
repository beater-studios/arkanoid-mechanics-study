/// @description Insert description here

directionBall =  direction;

//y = clamp(y, sprite_height, room_height-(sprite_height/2))

if (y-1 <= sprite_height/2) {
	angulo = ((320 - x) / 320);
		
	if (angulo < 0 && directionBall > 180) angulo *= -1
	if (angulo > 0 && directionBall < 180) angulo *= -1
		
	directionBall = 270 + (90 * angulo)
}
	
if (y >= room_height-sprite_width) {
	//y = room_height - sprite_width;
	show_debug_message("--- RESTART ---")
	room_restart();
}

if (x-1 < sprite_width/2) {
	angulo = ((room_height/2) - y) / (room_height/2);
	if (angulo > 0 && directionBall > 180) angulo *= -1
	if (angulo < 0 && directionBall < 180) angulo *= -1
		
	directionBall = 0 + (90 * angulo)
}
	

if (x+1 > room_width-(sprite_width/2)) {
	angulo = ((room_height/2) - y) / (room_height/2);
	if (angulo < 0 && directionBall > 180) angulo *= -1
	if (angulo > 0 && directionBall < 180) angulo *= -1

	directionBall = 180 + (90 * angulo)
}
	
while (directionBall < 0) {
	directionBall += 360;
}
	
direction = directionBall