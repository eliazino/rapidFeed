import yellowStreak;
import redStreak;
import pinkStreak;
import greenStreak;
import blueStreak;
import feedsLayer;
import flash.display.Sprite;
import flash.display.GradientType;
import flash.geom.ColorTransform;
import flash.events.MouseEvent;
import flash.display.MovieClip;
import flash.events.Event;
import flash.utils.Timer;
import flash.display.Sprite;
import flash.net.URLRequest;
import org.bytearray.gif.player.GIFPlayer;
import org.bytearray.gif.decoder.GIFDecoder;
import org.bytearray.gif.events.GIFPlayerEvent;
import org.bytearray.gif.events.FileTypeEvent;
import org.bytearray.gif.events.FrameEvent;
import org.bytearray.gif.events.TimeoutEvent;
import flash.media.Sound;
import flash.media.SoundChannel;

var destroySound:destroyedBoom = new destroyedBoom();
var clickS:clickSound = new clickSound();
var machine:machineCool = new machineCool();
var gameover:gameOver = new gameOver();
var destroyChannel:SoundChannel = new SoundChannel();
var clickChannel:SoundChannel = new SoundChannel();
var machineChannel:SoundChannel = new SoundChannel();
var gameOverChannel:SoundChannel = new SoundChannel();

B1.addEventListener(MouseEvent.CLICK, changeFlow);
B2.addEventListener(MouseEvent.CLICK, changeFlow);
B3.addEventListener(MouseEvent.CLICK, changeFlow);
B4.addEventListener(MouseEvent.CLICK, changeFlow);
B5.addEventListener(MouseEvent.CLICK, changeFlow);
B6.addEventListener(MouseEvent.CLICK, changeFlow);
B7.addEventListener(MouseEvent.CLICK, changeFlow);
B8.addEventListener(MouseEvent.CLICK, changeFlow);
B9.addEventListener(MouseEvent.CLICK, changeFlow);
B10.addEventListener(MouseEvent.CLICK, changeFlow);
B11.addEventListener(MouseEvent.CLICK, changeFlow);
B12.addEventListener(MouseEvent.CLICK, changeFlow);
B13.addEventListener(MouseEvent.CLICK, changeFlow);
B14.addEventListener(MouseEvent.CLICK, changeFlow);
B15.addEventListener(MouseEvent.CLICK, changeFlow);
B16.addEventListener(MouseEvent.CLICK, changeFlow);
B17.addEventListener(MouseEvent.CLICK, changeFlow);
B18.addEventListener(MouseEvent.CLICK, changeFlow);
B19.addEventListener(MouseEvent.CLICK, changeFlow);
B20.addEventListener(MouseEvent.CLICK, changeFlow);
B21.addEventListener(MouseEvent.CLICK, changeFlow);
B22.addEventListener(MouseEvent.CLICK, changeFlow);
B23.addEventListener(MouseEvent.CLICK, changeFlow);
B24.addEventListener(MouseEvent.CLICK, changeFlow);
B25.addEventListener(MouseEvent.CLICK, changeFlow);
var procs:Array = [0, 0, 0, 0, 0];
var misses:Array = [0, 0, 0, 0, 0];
var gameTimer:Timer = new Timer(5000);
var motionTimer:Timer = new Timer(10);
gameTimer.addEventListener(TimerEvent.TIMER, engine);
motionTimer.addEventListener(TimerEvent.TIMER, navigate);
gameTimer.start();
motionTimer.start();
var flowDir:Array = new Array(25);
////Fire!!!!!
var myGIFPlayer01:GIFPlayer = new GIFPlayer();
var myGIFPlayer02:GIFPlayer = new GIFPlayer();
var myGIFPlayer03:GIFPlayer = new GIFPlayer();
var myGIFPlayer04:GIFPlayer = new GIFPlayer();
var myGIFPlayer05:GIFPlayer = new GIFPlayer();
var myGIFPlayer11:GIFPlayer = new GIFPlayer();
var myGIFPlayer12:GIFPlayer = new GIFPlayer();
var myGIFPlayer13:GIFPlayer = new GIFPlayer();
var myGIFPlayer14:GIFPlayer = new GIFPlayer();
var myGIFPlayer15:GIFPlayer = new GIFPlayer();

// we show it
addChild ( myGIFPlayer01 );
addChild ( myGIFPlayer02 );
addChild ( myGIFPlayer03 );
addChild ( myGIFPlayer04 );
addChild ( myGIFPlayer05 );
addChild ( myGIFPlayer11 );
addChild ( myGIFPlayer12 );
addChild ( myGIFPlayer13 );
addChild ( myGIFPlayer14 );
addChild ( myGIFPlayer15 );
myGIFPlayer01.x = 110;
myGIFPlayer01.y = 10;
myGIFPlayer02.x = 210;
myGIFPlayer02.y = 10;
myGIFPlayer03.x = 310;
myGIFPlayer03.y = 10;
myGIFPlayer04.x = 410;
myGIFPlayer04.y = 10;
myGIFPlayer05.x = 510;
myGIFPlayer05.y = 10;
myGIFPlayer11.x = 15;
myGIFPlayer11.y = 80;
myGIFPlayer12.x = 15;
myGIFPlayer12.y = 180;
myGIFPlayer13.x = 15;
myGIFPlayer13.y = 280;
myGIFPlayer14.x = 15;
myGIFPlayer14.y = 380;
myGIFPlayer15.x = 15;
myGIFPlayer15.y = 480;
flowDir = [B1, B2, B3, B4, B5, B6, B7, B8, B9, B10, B11, B12, B13, B14, B15, B16, B17, B18, B19, B20, B21, B22, B23, B24, B25];
var industries:Array = [
						[greenHouse01, pinkHouse01, redHouse01, yellowHouse01, blueHouse01],
						[blueHouse02, greenHouse02, yellowHouse02, pinkHouse02, redHouse02]
						];
var industriesFire:Array = [
							[myGIFPlayer01, myGIFPlayer02, myGIFPlayer03, myGIFPlayer04, myGIFPlayer05],
							[myGIFPlayer11, myGIFPlayer12, myGIFPlayer13, myGIFPlayer14, myGIFPlayer15]
						   ];
var directions:Array = [0, 1, 3, 2, 1,
						/* Row 2 */
						2, 2, 1, 0, 0,
						/* Row 3 */
						1, 0, 3, 1, 0,
						/* Row 4 */
						3, 0, 1, 3, 1,
						/* Row 5 */
						0, 3, 2, 3, 0,
						];
var destroyed:Array = [
					   [0,0,0,0,0],
					   [0,0,0,0,0]
					  ];
var map:Array = [1, 3, 4, 2, 0 ];

var totalMaterials:Number = 0;
var greenStreaks:Array = new Array();
var blueStreaks:Array = new Array();
var yellowStreaks:Array =  new Array();
var pinkStreaks:Array =  new Array();
var redStreaks:Array =  new Array();
var greenStreaksDir:Array = new Array();
var blueStreaksDir:Array = new Array();
var yellowStreaksDir:Array =  new Array();
var pinkStreaksDir:Array =  new Array();
var redStreaksDir:Array =  new Array();
removeChild(gameoverImage);
removeChild(restart);
function changeFlow(event:MouseEvent):void{
	var obj:Array;
	obj = objFinder(event);
	var Dir:Number = setNextDir(directions[obj[1]], obj[1]);
	obj[0].rotation += 90;
	clickChannel.stop();
	clickChannel = clickS.play();
	/*if(!(obj[0].rotation == 90*Dir)){
		obj[0].rotation = 90*Dir;
	}*/
}
function setNextDir(current:Number, slot:Number):Number{
	var nextInt:Number;
	if(current == 3){
		nextInt = 0;
	}else{
		nextInt = current + 1;
	}
	directions[slot] = nextInt;
	//trace(nextInt);
	return nextInt;
}
function objFinder(ev:Event):Array{
	var i:Number = 0;
	var res:Array = new Array();
	while(i < 25){
		if(ev.target.hitTestObject(flowDir[i])){
			//trace(flowDir[i]);
			res[0] = flowDir[i];
			res[1] = i;
			break;
		}else{
			
		}
		i = i + 1;
	}
	return res;
}
function engine(event:Event){
	var feedsL:feedsLayer = new feedsLayer();
	var chooseMaterial:Number = Math.floor(Math.random() * (5 - 1 + 1)) + 1;
	//trace(chooseMaterial);
	if(chooseMaterial == 1){
		var newMaterial:greenStreak = new greenStreak();
		newMaterial.name = "green"+greenStreaks.length.toString();
		greenStreaks.push(newMaterial);
		greenStreaksDir.push(0);
		stage.addChildAt(newMaterial, 0);
		newMaterial.x = 690;
		newMaterial.y = 500;
		totalMaterials += 1;
		tFeed.text = totalMaterials.toString();
	}else if(chooseMaterial == 2){
		var newMaterial2:pinkStreak = new pinkStreak();
		newMaterial2.name = "pink"+pinkStreaks.length.toString();
		pinkStreaks.push(newMaterial2);
		pinkStreaksDir.push(0);
		stage.addChildAt(newMaterial2, 0);
		newMaterial2.x = 690;
		newMaterial2.y = 500;
		totalMaterials += 1;
		tFeed.text = totalMaterials.toString();
	}else if(chooseMaterial == 3){
		var newMaterial3:blueStreak = new blueStreak();
		newMaterial3.name = "blue"+blueStreaks.length.toString();
		blueStreaks.push(newMaterial3);
		blueStreaksDir.push(0);
		stage.addChildAt(newMaterial3, 0);
		newMaterial3.x = 690;
		newMaterial3.y = 500;
		totalMaterials += 1;
		tFeed.text = totalMaterials.toString();
	}else if(chooseMaterial == 4){
		var newMaterial4:redStreak = new redStreak();
		newMaterial4.name = "red"+redStreaks.length.toString();
		redStreaks.push(newMaterial4);
		redStreaksDir.push(0);
		stage.addChildAt(newMaterial4, 0);
		newMaterial4.x = 690;
		newMaterial4.y = 500;
		totalMaterials += 1;
		tFeed.text = totalMaterials.toString();
	}else if(chooseMaterial == 5){
		var newMaterial5:yellowStreak = new yellowStreak();
		newMaterial5.name = "yellow"+yellowStreaks.length.toString();
		yellowStreaks.push(newMaterial5);
		yellowStreaksDir.push(0);
		stage.addChildAt(newMaterial5, 0);
		newMaterial5.x = 690;
		newMaterial5.y = 500;
		totalMaterials += 1;
		tFeed.text = totalMaterials.toString();
	}
	//setChildIndex(back,0);
}
function surrogate(els:Array, dirs:Array, type:Number){
	var counter:Number = 0;
	while(counter < els.length){
		try{
			var t:Number = boundType(els[counter].x, els[counter].y);
			if(t == 1 || t == 2){
				scoreIt(els[counter],t,type, counter);
			}else if( t == 4){
				var datum = pathFinder(els[counter].x, els[counter].y, dirs[counter], els[counter]);
				if(datum[0]){
					els[counter].rotation = 90*directions[datum[2]];
					dirs[counter] = directions[datum[2]];
					if(directions[datum[2]] == 0){					
						els[counter].x = datum[1].x + 0;
						els[counter].y = datum[1].y + 0;
					}else if(directions[datum[2]] == 1){
						els[counter].y = datum[1].y + 0;
						els[counter].x = datum[1].x + 0;
					}else if(directions[datum[2]] == 2){
						els[counter].x = datum[1].x + 0;
						els[counter].y = datum[1].y + 0;
					}else if(directions[datum[2]] == 3){
						els[counter].y = datum[1].y + 0;
						els[counter].x = datum[1].x + 0;
					}
				}else{
					if(dirs[counter] == 0){
						els[counter].x -= 1;
					}else if(dirs[counter] == 1){
						els[counter].y -= 1;
					}else if(dirs[counter] == 2){
						els[counter].x += 1;
					}else if(dirs[counter] == 3){
						els[counter].y += 1;
					}
				}
			}else{
				scoreIt(els[counter],t,type, counter);
			}
		}catch(e){
			trace(e);
		}
		counter += 1;
	}
}
function navigate(event:Event){
	//greenStreaks
	surrogate(greenStreaks, greenStreaksDir, 0);
	
	//Yellow
	surrogate(yellowStreaks, yellowStreaksDir, 3);
	
	// redStreaks
	surrogate(redStreaks, redStreaksDir, 2);
	
	// blueStreaks
	surrogate(blueStreaks, blueStreaksDir, 4);
	
	// pinkStreaks
	surrogate(pinkStreaks, pinkStreaksDir, 1);
	
}
function pathFinder(xCoord:Number, yCoord:Number, dir:Number, obj:Object):Array{
	var counter:Number = mapper(yCoord);
	var resp:Array = new Array();
	resp[0] = false;
	if(counter == 0) return resp;
	counter = (counter -1)*5;
	var end:Number = counter + 5;
	while(counter < end){
		if(dir == 0){
			if(obj.hitTestObject(flowDir[counter])){
				//trace(counter);
				if(xCoord == flowDir[counter].x + 25 || xCoord == flowDir[counter].x){
					if(dir == directions[counter]){
						break
					}else{
						resp[0] = true;
						resp[1] = flowDir[counter];
						resp[2] = counter;
						//trace("crosses");
						break;
					}
				}else{
					
				}
			}else{
				
			}
		}else if(dir == 1){
			if(obj.hitTestObject(flowDir[counter])){
				//trace(xCoord);
				if(yCoord == flowDir[counter].y + 25 || yCoord == flowDir[counter].y){
					if(dir == directions[counter]){
						break
					}else{
						resp[0] = true;
						resp[1] = flowDir[counter];
						resp[2] = counter;
						//trace("crosses");
						break;
					}
				}else{
					
				}
			}else{
				
			}
		}else if(dir == 2){
			//trace(counter);
			if(obj.hitTestObject(flowDir[counter])){				
				if(xCoord == flowDir[counter].x + 25 || xCoord == flowDir[counter].x){
					if(dir == directions[counter]){
						break
					}else{
						resp[0] = true;
						resp[1] = flowDir[counter];
						resp[2] = counter;
						//trace("crosses");
						break;
					}
				}else{
					
				}
			}else{
				
			}
		}else if(dir == 3){
			if(obj.hitTestObject(flowDir[counter])){				
				if(yCoord == flowDir[counter].y + 25 || yCoord == flowDir[counter].y){
					if(dir == directions[counter]){
						break
					}else{
						resp[0] = true;
						resp[1] = flowDir[counter];
						resp[2] = counter;
						//trace("crosses");
						break;
					}
				}else{
					
				}
			}else{
				
			}
		}
		counter += 1;
	}
	return resp;
}
function mapper(yCoord:Number):Number{
	if(yCoord >= 100 && yCoord <= 150){
		return 1;
	}else if(yCoord >= 200 && yCoord <= 250){
		return 2;
	}else if(yCoord >= 300 && yCoord <= 350){
		return 3
	}else if(yCoord >= 400 && yCoord <= 450){
		return 4
	}else if(yCoord >= 500 && yCoord <= 550){
		return 5
	}else{
		return 0;
	}
}
function boundType(xCoord:Number, yCoord:Number){
	if(yCoord <= 65 && yCoord >= 0){
		//evaluate feed destiny
		return 1;
	}else if(xCoord <= 70 && xCoord >= 0){
		//evaluate feed destiny
		return 2;
	}else if(xCoord < 0 || yCoord < 0 || xCoord > 800 || yCoord > 600){
		//the feed ran away
		return 3;
	}else{
		//feed in boundary
		return 4;
	}
}
function scoreIt(el:Object, bound:Number, eltype:Number, ind:Number){
	var n:Array = new Array();
	el.visibility = false;
	if(bound == 1){
		switch(eltype){
				case 0:
					if(el.hitTestObject(greenHouse01) && destroyed[bound-1][eltype] == 0){
						procs[eltype] += 1;
						greenFeedProc.text = procs[eltype].toString();
						playMachineSound();
					}else{
						misses[eltype] += 1;
						greenFeedMissed.text = misses[eltype].toString();
						destroy(bound, eltype, el);
						playDestroySound();
					}
					n = findAndPop(greenStreaks, greenStreaksDir, ind);
					greenStreaks = n[0];
					greenStreaksDir = n[1];
					break;
				case 1:
					if(el.hitTestObject(pinkHouse01) && destroyed[bound-1][eltype] == 0){
						procs[eltype] += 1;
						pinkFeedProc.text = procs[eltype].toString();
						playMachineSound();
					}else{
						misses[eltype] += 1;
						pinkFeedMissed.text = misses[eltype].toString();
						destroy(bound, eltype, el);
						playDestroySound();
					}
					n = findAndPop(pinkStreaks, pinkStreaksDir, ind);
					pinkStreaks = n[0];
					pinkStreaksDir = n[1];
					break;
				case 2:
					if(el.hitTestObject(redHouse01) && destroyed[bound-1][eltype] == 0){
						procs[eltype] += 1;
						redFeedProc.text = procs[eltype].toString();
						playMachineSound();
					}else{
						misses[eltype] += 1;
						redFeedMissed.text = misses[eltype].toString();
						destroy(bound, eltype, el);
						playDestroySound();
					}
					n = findAndPop(redStreaks, redStreaksDir, ind);
					redStreaks = n[0];
					redStreaksDir = n[1];
					break;
				case 3:
					if(el.hitTestObject(yellowHouse01) && destroyed[bound-1][eltype] == 0){
						procs[eltype] += 1;
						yellowFeedProc.text = procs[eltype].toString();
						playMachineSound();
					}else{
						misses[eltype] += 1;
						yellowFeedMissed.text = misses[eltype].toString();
						destroy(bound, eltype, el);
						playDestroySound();
					}
					n = findAndPop(yellowStreaks, yellowStreaksDir, ind);
					yellowStreaks = n[0];
					yellowStreaksDir = n[1];
					break;
				case 4:
					if(el.hitTestObject(blueHouse01) && destroyed[bound-1][eltype] == 0){
						procs[eltype] += 1;
						blueFeedProc.text = procs[eltype].toString();
						playMachineSound();
					}else{
						misses[eltype] += 1;
						blueFeedMissed.text = misses[eltype].toString();
						destroy(bound, eltype, el);
						playDestroySound();
					}
					n = findAndPop(blueStreaks, blueStreaksDir, ind);
					blueStreaks = n[0];
					blueStreaksDir = n[1];
					break;
				
			}
	}else if(bound == 2){		
		switch(eltype){
				case 0:
					if(el.hitTestObject(greenHouse02) && destroyed[bound-1][map[eltype]] == 0){
						procs[eltype] += 1;
						greenFeedProc.text = procs[eltype].toString();
						playMachineSound();
					}else{
						misses[eltype] += 1;
						greenFeedMissed.text = misses[eltype].toString();
						destroy(bound, eltype, el);
						playDestroySound();
					}
					n = findAndPop(greenStreaks, greenStreaksDir, ind);
					greenStreaks = n[0];
					greenStreaksDir = n[1];
					break;
				case 1:
					if(el.hitTestObject(pinkHouse02) && destroyed[bound-1][map[eltype]] == 0){
						procs[eltype] += 1;
						pinkFeedProc.text = procs[eltype].toString();
						playMachineSound();
					}else{
						misses[eltype] += 1;
						pinkFeedMissed.text = misses[eltype].toString();
						destroy(bound, eltype, el);
						playDestroySound();
					}
					n = findAndPop(pinkStreaks, pinkStreaksDir, ind);
					pinkStreaks = n[0];
					pinkStreaksDir = n[1];
					break;
				case 2:
					if(el.hitTestObject(redHouse02) && destroyed[bound-1][map[eltype]] == 0){
						procs[eltype] += 1;
						redFeedProc.text = procs[eltype].toString();
						playMachineSound();
					}else{
						misses[eltype] += 1;
						redFeedMissed.text = misses[eltype].toString();
						destroy(bound, eltype, el);
						playDestroySound();
					}
					n = findAndPop(redStreaks, redStreaksDir, ind);
					redStreaks = n[0];
					redStreaksDir = n[1];
					break;
				case 3:
					if(el.hitTestObject(yellowHouse02) && destroyed[bound-1][map[eltype]] == 0){
						procs[eltype] += 1;
						yellowFeedProc.text = procs[eltype].toString();
						playMachineSound();
					}else{
						misses[eltype] += 1;
						yellowFeedMissed.text = misses[eltype].toString();
						destroy(bound, eltype, el);
						playDestroySound();
					}
					n = findAndPop(yellowStreaks, yellowStreaksDir, ind);
					yellowStreaks = n[0];
					yellowStreaksDir = n[1];
					break;
				case 4:
					if(el.hitTestObject(blueHouse02) && destroyed[bound-1][map[eltype]] == 0){
						procs[eltype] += 1;
						blueFeedProc.text = procs[eltype].toString();
						playMachineSound();
					}else{
						misses[eltype] += 1;
						blueFeedMissed.text = misses[eltype].toString();
						destroy(bound, eltype, el);
						playDestroySound();
					}
					n = findAndPop(blueStreaks, blueStreaksDir, ind);
					blueStreaks = n[0];
					blueStreaksDir = n[1];
					break;
				
			}
	}else{
		switch(eltype){
				case 0:					
					misses[eltype] += 1;
					greenFeedMissed.text = misses[eltype].toString();
					n = findAndPop(greenStreaks, greenStreaksDir, ind);
					greenStreaks = n[0];
					greenStreaksDir = n[1];
					break;
				case 1:					
					misses[eltype] += 1;
					pinkFeedMissed.text = misses[eltype].toString();
					n = findAndPop(pinkStreaks, pinkStreaksDir, ind);
					pinkStreaks = n[0];
					pinkStreaksDir = n[1];
					break;
				case 2:
					misses[eltype] += 1;						
					redFeedMissed.text = misses[eltype].toString();
					n = findAndPop(redStreaks, redStreaksDir, ind);
					redStreaks = n[0];
					redStreaksDir = n[1];
					break;
				case 3:					
					misses[eltype] += 1;
					yellowFeedMissed.text = misses[eltype].toString();
					n = findAndPop(yellowStreaks, yellowStreaksDir, ind);
					yellowStreaks = n[0];
					yellowStreaksDir = n[1];
					break;
				case 4:					
					misses[eltype] += 1;
					blueFeedMissed.text = misses[eltype].toString();
					n = findAndPop(blueStreaks, blueStreaksDir, ind);
					blueStreaks = n[0];
					blueStreaksDir = n[1];
					break;				
			}
	}
}
function findAndPop(els:Array, elsDir:Array, index:Number):Array{
	var outPut:Array = new Array();
	var inArr:Array = new Array();
	var inArr2:Array = new Array();
	var counter:Number = 0;
	stage.removeChild(els[index]);
	while(counter < els.length){
		counter == index? '' : inArr.push(els[counter]);
		counter == index? '' : inArr2.push(elsDir[counter]);
		counter += 1;
	}
	outPut[0] = inArr;
	outPut[1] = inArr2;
	return outPut;
}
function destroy(type:Number, pos:Number, obj:Object):Boolean{
	var counter:Number = 0;
	type = type-1;
	var f:Number = 0;
	while(counter < 5){
		if(obj.hitTestObject(industries[type][counter])){
			if(type == 1){
				if(destroyed[type][map[counter]] == 0){
					industriesFire[type][counter].load ( new URLRequest ("fire.gif") );
					destroyed[type][map[counter]] = 1;
				}
			}else{
				if(destroyed[type][counter] == 0){
					industriesFire[type][counter].load ( new URLRequest ("fire.gif") );
					destroyed[type][counter] = 1;
				}
			}
			isGameOver();
			return true;
			break;
		}
		counter++;
	}
	isGameOver();
	return true;
}
function resetGame(){
	addChild(gameoverImage);
	addChild(restart);
	playGameOverSound();
	procs = [0, 0, 0, 0, 0];
	misses = [0, 0, 0, 0, 0];
	restart.addEventListener(MouseEvent.CLICK, restartGame);
	gameTimer.stop();
	motionTimer.stop();
	totalMaterials = 0;
	greenStreaks = [];
	blueStreaks = [];
	yellowStreaks =  [];
	pinkStreaks =  [];
	redStreaks =  [];
	greenStreaksDir = [];
	blueStreaksDir = [];
	yellowStreaksDir =  [];
	pinkStreaksDir =  [];
	redStreaksDir =  [];
	destroyed = [
					   [0,0,0,0,0],
					   [0,0,0,0,0]
					  ];
	
}
function isGameOver():Boolean{
	var sum:Number = 0;
	for(var i:Number = 0; i < 5; i++){
		sum = sum + destroyed[0][i] + destroyed[1][i];
	}
	if(sum == 10){
		resetGame();
		return true;
	}else{
		return false;
	}
}
function playMachineSound(){
	machineChannel.stop();
	machineChannel = machine.play();
}
function playGameOverSound(){
	gameOverChannel.stop();
	gameOverChannel = gameover.play();
}
function playDestroySound(){
	destroyChannel.stop();
	destroyChannel = destroySound.play();
}
function restartGame(){
	gameTimer.stop();
	motionTimer.stop();
	stage.removeChild(gameoverImage);
	stage.removeChild(restart);
}