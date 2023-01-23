pico-8 cartridge // http://www.pico-8.com
version 39
__lua__
-- reese chong isu
-- red hot collectathon

function _init()
	player={
		sp=1,
		x=64,
		y=64, 
		}
	
	score=0
	peppers={}
	for i=1,20 do
		local pepper={
			sp=4,
			x=flr(rnd(16))*8,
			y=flr(rnd(16))*8,
			}
		add(peppers,pepper)
	end
end

function _update()
	if game_over!= true then
		if btnp(⬆️) then
			player.y-=8
		end
		if btnp(⬇️) then
			player.y+=8
		end
		if btnp(⬅️) then
			player.x-=8
		end
		if btnp(➡️) then
			player.x+=8
		end
	end
  
-- edge detection

	player.x=mid(0,120,player.x)
	player.y=mid(0,120,player.y)
	
-- collision detection

	for pepper in all (peppers) do
		if pepper.x==player.x and pepper.y==player.y then
			del(peppers,pepper)
			sfx(0)
			score+=1
		end
	end
	
	if score==20 and finish_time==nil then
		finish_time=flr(time())
		game_over=true
	end
end

function _draw()
	cls()
	map(0,0,0,0)
	spr(player.sp,player.x,player.y)
 for pepper in all (peppers) do
 	spr(pepper.sp, pepper.x, pepper.y)
	end
	
-- ui (high score, time)
	print('score: '..score,1,1,7)

-- win sequence
	if game_over==true then
		print('you win!',32,48,9)
		print('it took you '..finish_time..' seconds',32,54,9)
	else
		print('time: '..flr(time()),40,1,9)
	end
end	
__gfx__
0000000000bbbb000bbbbbb000000045000003000000004500aaa30000b3b3000000000033333333333333330000000000000000000000000000000000000000
000000000b8bbbb0b288828800000b5300000bb000000a590abbb7303b3b33330000000033333333333333330000000000000000000000000000000000000000
00700700888888bb8888888800000b330000883000000a99abaa7ba3b3b333330000000033333333333b33b30000000000000000000000000000000000000000
00077000882888288800000000007b330007881000007a99a3aaab933333333300000000333333333b3b3bb30000000000000000000000000000000000000000
0007700088888888800000000007bb30000788100007aa90a3aaab9333bbbb33000000003333333333bbbb330000000000000000000000000000000000000000
007007008776767687767676007bb33000788200007aa990a3aaa393000bb00000000000333333333bbbbbb30000000000000000000000000000000000000000
000000008877676788776767bbb3330008882100aaa9990009333930000bb0000000000033333333333333330000000000000000000000000000000000000000
00000000888888888888888803330000822210000999000000999300000bb0000000000033333333333333330000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000777aaaa99998888899988880000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000077aaaa999988888099888888000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000777aaaa99998888899988880000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000077aaaa999988888099888888000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000777aaaa99998888899988880000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000077aaaa999988888099888888000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__map__
0909090909090909090909090909090909090909090909090909090909090909000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0909090909090909090909090909090909090909090909090909090909090909000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
09090909090909090909090a0909090909090909090909090909090a09090909000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
09090909090a0909090909090909090909090909090a09090909090909090909000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0909090909090909090909090909090909090909090909090909090909090909000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0909090a0909090909090909090909090909090a090909090909090909090909000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
09090909090a0909090909090909090909090909090a09090909090909090909000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0909090909090909090909090909090909090909090909090909090909090909000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0909090909090909090909090909090909090909090909090909090a09090909000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
09090909090909090909090909090909090909090a09090909090a0909090909000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0909090909090909090909090909090909090909090909090909090909090909000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0909090a0909090909090909090a0909090909090909090909090909090a0909000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0909090909090a09090909090a09090909090909090a0a09090909090a090909000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0909090909090909090909090909090909090909090909090909090909090909000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0909090909090909090909090909090909090909090909090909090909090909000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0909090909090909090909090909090909090a09090909090909090909090909000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0909090909090909090909090909090909090909090909090909090909090909000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
090909090909090909090909090909090a0a0909090909090909090909090909000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
09090909090909090909090a090909090a090909090909090909090a09090909000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
09090909090a0909090909090909090909090909090a09090909090909090909000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0909090909090909090909090909090909090909090909090909090909090909000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0909090a0909090909090909090909090909090a090909090909090909090909000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
09090909090a0909090909090909090909090909090a09090909090909090909000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0909090909090909090909090909090909090909090909090909090909090909000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
09090909090909090909090a0909090909090909090909090909090a09090909000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
090909090a09090909090a0909090909090909090909090909090a0909090909000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0909090909090909090909090909090909090909090909090909090909090909000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0909090a0909090909090909090a09090909090a0909090909090909090a0909000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0909090909090a09090909090a0909090909090909090a09090909090a090909000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0909090909090909090909090909090909090909090909090909090909090909000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0909090909090909090909090909090909090909090909090909090909090909000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0909090909090909090909090909090909090909090909090909090909090909000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__sfx__
0005000015050150501e7501e7501e7501f0001700014000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
002d00000065000650006500065000650006500065000650006500000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001d00000f10019000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
