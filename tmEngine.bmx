' tile map engine
Global TileSize:Int = 32
Global Px:Float = 32
Global Py:Float = 32
Global Spx:Float,Spy:Float
 
Global TileMap:Int[][] = [[1,1,1,1,1,1,1,1,1,1],
						  [1,0,0,0,0,0,0,0,0,1],
						  [1,0,0,0,0,0,0,0,0,1],
						  [1,0,1,0,0,1,0,0,0,1],
						  [1,0,0,0,0,1,0,0,0,1],
						  [1,0,0,0,1,1,0,0,1,1],
						  [1,0,0,0,0,0,0,0,0,1],
						  [1,1,1,1,1,1,1,1,1,1]]

Function DrawTileMap()
	For Local i = 0 Until Len TileMap 
		For Local j = 0 Until 10
			If TileMap[i][j] = 1 DrawRect j*TileSize,i*TileSize,TileSize,TileSize
		Next
	Next 
End Function 

Function MovePlayer()

	If KeyDown(key_right) Spx:+1
	If KeyDown(key_left)  Spx:-1
	If KeyDown(key_up) 	 Spy:-1
	If KeyDown(key_down)  Spy:+1
	
	Spx:*0.85
	Spy:*0.85
	
	Px:+Spx
	
	If CollideWithTile(Px,Py,TileSize,TileSize)
		Px:-Spx
		Spx = 0
	EndIf 
	
	Py:+Spy
	
	If CollideWithTile(Px,Py,TileSize,TileSize)
		Py:-Spy
		Spy = 0
	EndIf 
	
End Function 

Function drawPlayer()
	SetColor(0,0,200)
		DrawRect Px,Py,28,28
	SetColor(255,255,255)
End Function 

Function CollideWithTile(x:Float,y:Float,tileWidth:Int,tileHeight:Int)
	Local x1:Int,y1:Int
	Local x2:Int,y2:Int 
	Local w:Int = tileWidth 
	Local h:Int = tileHeight
	
	x1 = x/w 
	y1 = y/h
	x2 = (x+w-4)/w
	y2 = (y+h-4)/h
	
	For Local tileX:Int = x1 To x2 
		For Local tileY:Int = y1 To y2 
			If TileMap[tileY][tileX] = 1 Return True 
		Next
	Next
	
	Return False 
End Function 


Graphics 640,480

While Not KeyHit(KEY_ESCAPE)
	Cls
	
		DrawTileMap()
		DrawPlayer()
		MovePlayer()
		
	
	Flip 
	If AppTerminate() = True Exit 
Wend 
End 