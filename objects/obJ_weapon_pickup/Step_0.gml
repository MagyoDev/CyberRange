if ( time < duration){
	hover = piranha(time, start, dest - start, duration);
	time++;
}else{
	var tempStart = start;
	start = dest; 
	dest = tempStart;
	time = 0;
}