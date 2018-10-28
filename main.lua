-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

-- Your code here 

-- composer = require("composer" )
-- composer.gotoScene( "menu")

--------------------------------


local function nivel3()
	local bnive2 = display.newImageRect("IMG/bnivel.jpg", 600, 320)
	bnive2.x = display.contentCenterX
	bnive2.y = display.contentCenterY

	local mensagem = display.newText("Por enquanto é só isso! :)", display.contentWidth/2, display.contentHeight/2, "Snap ITC", 30)
	mensagem:setFillColor(0,0,0)
end

local function nivel2()
	local bnive2 = display.newImageRect("IMG/bnivel.jpg", 600, 320)
	bnive2.x = display.contentCenterX
	bnive2.y = display.contentCenterY
	
	local quadro1 = display.newImageRect("IMG/quadroAzul.png", 60, 60)
	quadro1.x = -14
	quadro1.y = display.contentHeight/1.33

	local quadro2 = display.newImageRect("IMG/quadroRed.png", 60, 60)
	quadro2.x = 494
	quadro2.y = display.contentHeight/1.33	

	local plataforma3 = display.newImageRect("IMG/plaforma3.png", 250, 60)
	plataforma3.x = 250
	plataforma3.y = display.contentHeight/1.33
		
	local gelo = display.newImageRect("IMG/gelo.png", 40, 40)
	gelo.x = display.contentWidth/2.1
	gelo.y = display.contentHeight/3

	local loop = display.newImageRect("IMG/loop.png", 90, 100)
	loop.x = 216
	loop.y = display.contentHeight/1.5
	loop.anchorX, loop.anchorY = 0,1
	local contadorBatida = 0
	
	function loopEvent(event)
		contadorBatida = contadorBatida+1
		print(contadorBatida)
		if(event.phase == "began") then
			loop.rotation = -25	
		elseif(event.phase == "ended") then
			loop.rotation = 0
		end
		if(contadorBatida==20) then
			transition.to(gelo, {time=10, alpha=0})
			local bola = display.newImageRect("IMG/bola.png", 20, 20)
			bola.x = display.contentWidth/2.1
			bola.y = display.contentHeight/3
			transition.to(bola, {time=3000, x=display.contentWidth/2.1, y=display.contentHeight/1.23})
			--loop:removeEventListener("touch", loopEvent)
			local function quadrado1Event(event)
				if(event.phase == "began") then
					function move3()
						--transition.to(bola, {time=10, alpha=1.0})
						bola.x = display.contentWidth/2.1
						bola.y = display.contentHeight/1.23
						transition.to(bola, {time=3000, display.contentWidth/2.1, display.contentHeight/1.23, alpha=1.0})
					end

					transition.to(bola, {time=3000, x=-14, y=display.contentHeight/1.23, alpha = 0, onComplete = move3})
				end	
			end
			quadro1:addEventListener("touch", quadrado1Event)
			local function quadrado2Event(event)
				if(event.phase == "began") then
					function botao_avance2()
						local widget = require("widget")
						function avancar3(event)
							local phase = event.phase
							if("began" == phase) then
								local bnive3 = display.newImageRect("IMG/bnivel.jpg", 600, 320)
								bnive3.x = display.contentCenterX
								bnive3.y = display.contentCenterY
								local mensagem = display.newText("Nível concluído!", display.contentWidth/2, display.contentHeight/2, "Snap ITC", 50)
								mensagem:setFillColor(0,0,0)
								local widget = require("widget")
								function avancar4()
									local phase = event.phase
									if("began" == phase) then
										nivel3()
									end
								end
								local Botao2 = widget.newButton 
								{
									left = display.contentWidth/2.9,
									top = display.contentHeight/1.7,
									width = 180,
									height = 70,
									defaultFile = "IMG/botaoAvançar.png",
									onEvent = avancar4
								}	
							end		
						end
						local Botao2 = widget.newButton 
						{
							left = display.contentWidth/1.4,
							top = display.contentHeight/3,
							width = 180,
							height = 70,
							defaultFile = "IMG/botaoAvançar.png",
							onEvent = avancar3
						}
					end
					transition.to(bola, {time=3000, x=494, y=display.contentHeight/1.23, alpha = 0, onComplete = botao_avance2})
				end	
			end
			quadro2:addEventListener("touch", quadrado2Event)
		end
	end
	loop:addEventListener("touch", loopEvent)

	local leco = display.newImageRect("IMG/LeCo02.png", 150, 200)
	leco.x = display.contentWidth/1.1
	leco.y = display.contentHeight/1.5
	leco.alpha=0

	local nuvem = display.newImage( "IMG/nuvemgelo.png", 1, 1)
	nuvem.xScale = 0.2
	nuvem.yScale = 0.2
	nuvem.x = display.contentWidth/1.3
	nuvem.y = display.contentHeight/4.2
	nuvem.alpha=0


	transition.fadeIn( leco, {time=3000,alpha=1, onComplete=function ()
		transition.fadeIn( nuvem, {time=1000, alpha=1, onComplete= desaparecer})
		end
	}
		)

	function desaparecer( event )
		transition.fadeOut( leco, {time=5000} )
		transition.fadeOut( nuvem, {time=5000} )
	end
end

local function nivel1()
	local bnive2 = display.newImageRect("IMG/bnivel.jpg", 600, 320)
	bnive2.x = display.contentCenterX
	bnive2.y = display.contentCenterY

	local quadro = display.newImageRect("IMG/quadroRed.png", 50, 100)
	quadro.x = display.contentWidth/2
	quadro.y = 0
	
	local bolaA = display.newImageRect("IMG/bolaAzul.png", 30, 30)
	bolaA.x = display.contentWidth/2
	bolaA.y = display.contentHeight/4.4

	local p1 = display.newImageRect("IMG/p1.png",200, 100)
	p1.x = display.contentWidth/2
	p1.y = display.contentHeight/2.2

	local balde1 = display.newImageRect("IMG/balAzul.png", 90, 100)
	balde1.x = display.contentWidth/3.8
	balde1.y = display.contentHeight/1.40

	local leco = display.newImageRect("IMG/LeCo02.png", 150, 200)
	leco.x = display.contentWidth/1.1
	leco.y = display.contentHeight/1.5
	leco.alpha=0

	local nuvem = display.newImage( "IMG/nuvembalde.png", 1, 1)
	nuvem.xScale = 0.2
	nuvem.yScale = 0.2
	nuvem.x = display.contentWidth/1.3
	nuvem.y = display.contentHeight/4.2
	nuvem.alpha=0


	transition.fadeIn( leco, {time=3000,alpha=1, onComplete=function ()
		transition.fadeIn( nuvem, {time=10, alpha=1, onComplete= desaparecer})
		end
	}
		)

	function desaparecer( event )
		transition.fadeOut( leco, {time=5000} )
		transition.fadeOut( nuvem, {time=5000} )
	end
	

	local function balde1Event(event)
		if(event.phase == "began") then
			function move2()
				bolaA.x = display.contentWidth/2
				bolaA.y = display.contentHeight/4.4
				transition.to(bolaA, {time=2000,x=display.contentWidth/2, y=display.contentHeight/4.4})
			end
			transition.to(bolaA, {time=2000,x=display.contentWidth/3.8, y=display.contentHeight/1.33, onComplete = move2})
		end	
	end
	balde1:addEventListener("touch", balde1Event)

	local balde2 = display.newImageRect("IMG/balVermelho.png", 80, 60)
	balde2.x = display.contentWidth/1.4
	balde2.y = display.contentHeight/1.33

	local function balde2Event(event)
		if(event.phase == "began") then
			function botao_avance()
				local widget = require("widget")
				function avancar1(event)
					local phase = event.phase
					if("began" == phase) then
						local bnivel = display.newImageRect("IMG/bnivel.jpg", 600, 320)
						bnivel.x = display.contentCenterX
						bnivel.y = display.contentCenterY
						local mensagem = display.newText("Nível concluído!", display.contentWidth/2, display.contentHeight/2, "Snap ITC", 50)
						mensagem:setFillColor(0,0,0)
						local widget = require("widget")
						function avancar2()
							local phase = event.phase
							if("began" == phase) then
								nivel2()
							end
						end
						local Botao2 = widget.newButton 
						{
							left = display.contentWidth/2.9,
							top = display.contentHeight/1.7,
							width = 180,
							height = 70,
							defaultFile = "IMG/botaoAvançar.png",
							onEvent = avancar2
						}
					end		
				end
				local Botao2 = widget.newButton 
				{
					left = display.contentWidth/1.4,
					top = display.contentHeight/3,
					width = 180,
					height = 70,
					defaultFile = "IMG/botaoAvançar.png",
					onEvent = avancar1
				}
			end
			transition.to(bolaA, {time=2000, x=display.contentWidth/1.4, y=display.contentHeight/1.33, onComplete = botao_avance})
		end
	end
	balde2:addEventListener("touch", balde2Event)
end

local function inicio()
	local background = display.newImageRect("IMG/background.png",600, 350)
	background.x = display.contentCenterX
	background.y = display.contentCenterY


	local leco = display.newImageRect("IMG/LeCo01.png",200, 310)
	leco.x = display.contentWidth/1.2
	leco.y = display.contentHeight/2
	transition.from(leco, {time=1000,x=-100,y=300})
--leco.x = -100
--leco.y = 250


	local tleco = display.newText("LeCo", display.contentWidth/3, display.contentHeight/2.4, "Snap ITC", 80)
	tleco:setFillColor(0,0,0)

	local widget = require("widget")
	function Evento(event)
		local phase = event.phase
		if("began" == phase) then
		--print("jogar")
			nivel1()
		end
	end
	local Botao1 = widget.newButton 
	{
		left = display.contentWidth/5.5,
		top = display.contentHeight/1.4,
		width = 190,
		height = 85,
		defaultFile = "IMG/botaoj.png",
		onEvent = Evento
	}	
end

inicio()
