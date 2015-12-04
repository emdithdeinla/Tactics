module(..., package.seeall);

function new()
	local localGroup = display.newGroup();

	
	local background = display.newImage("scbg.jpg");
	background.height = _H; background.width = _W + _W/4;
	background.x = _W/2; background.y = _H/2;
	
	local back = display.newImage("back.png");
	back.height = _H/9 + 17; back.width = _W/9 + 18;
	back.x = _W/30; back.y = _H/10;
	--back.x = _W/30; back.y = _H + _H/10;
	back.scene = "scene1B";

	local boy = display.newImage("boy_normal.png");
	boy.x = _W/2 - 210 ; boy.y = _H/2 + 30;
	boy.width = 230; boy.height = 240;
	
	local scenario = display.newImage("sc2.png");
	scenario.x = _W/3 +  _W/3 - 20; scenario.y = _H/3 + _H/5;
	scenario.width = _W/2 + _W/3 + _W/10; scenario.height = _H/2 +_H/3 + _H/6;
	
    local choice1 = display.newImage("sc2c1.png");
	choice1.x = _W/3  + _W/3 - 20 ; choice1.y = _H/2 + 20;
	choice1.width = _W/2 +_W/3 -10; choice1.height = _H/19;
	choice1.scene = "correctAns2B";
	
	local choice2 = display.newImage("sc2c2.png");
	choice2.x = _W/3 + _W/3 - 20; choice2.y = _H/2 + 60;
	choice2.width = _W/2 +_W/5; choice2.height = _H/19;
	choice2.scene = "wrongAns2B";
	
	
	local anim;
	anim = transition.to( scenario,{
		time = 5000,
		y= 50,
		xScale = 2,
		yScale = 2,
		transition = easing.inQuad,
		customProperty = 1000
	});


	local tmr;
	tmr = timer.performWithDelay(1000, function(e)
		transition.cancel(anim);
		anim = nil;

		timer.cancel(tmr);
		tmr = nil;
	end,1); 

	
	
	function changeScene(e)
		if(e.phase == "ended") then
			director:changeScene(e.target.scene);
		end
	end
	
 	localGroup:insert(background);
	localGroup:insert(back);
	localGroup:insert(boy);
	localGroup:insert(scenario);
	localGroup:insert(choice1);
	localGroup:insert(choice2);
	
	--boy:addEventListener("touch", changeScene);
	back:addEventListener("touch", changeScene);
	choice1:addEventListener("touch", changeScene);
	choice2:addEventListener("touch", changeScene);
	
	
	return localGroup;
end