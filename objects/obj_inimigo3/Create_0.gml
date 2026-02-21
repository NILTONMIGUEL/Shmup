/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
//Inherit the parent event
vida = 10;

estadoAtual = "chegando";
timer = game_get_speed(gamespeed_fps) * 2;
timer_atual = 0;
contador = 0;
escolher_direcao = false;

morrendo = function(_part){
	if(vida > 0){
		vida--;	
		
	}
	else{
		
		var _chance = random(100);
		
		instance_destroy();
		screenShake(20);
		instance_create_layer(x, y, "inst_particulas", _part)
		
		
		if(_chance >= 40){
			instance_create_layer(x, y, layer , obj_powerUps);	
		}
		
	}
}

estado = function(){

	switch(estadoAtual){
		case "chegando":
			if(y < 192){
				vspeed = 2;	
			}
			else{
				vspeed = 0;
				estadoAtual = "carregando";
			}
			break;
		case "carregando" :
			
			timer_atual++;
			
	
			if(timer_atual >= timer){
				estadoAtual = choose("atirando","atirando2");
				timer_atual = 0;	
				
				contador++;
				
				
			}
			
			break;
			
		case "atirando":
			var _tiro = instance_create_layer(x,y,"inst_tiro",obj_tiroInimigo3A);
			var _dir = point_direction(x,y,obj_player.x , obj_player.y);
			
			
			if(instance_exists(obj_player))
			{
				_tiro.speed = 2;
				_tiro.direction = _dir;
				_tiro.image_angle = _dir + 90;
			}
			if(contador < 3){
				estadoAtual = "carregando";
			}
			else{
				estadoAtual = "fugindo";	
			}
			break;
			
		case "atirando2":
			var _direcao = 255;
			repeat(3){
				var _tiro2 = instance_create_layer(x,y,"inst_tiro",obj_tiroInimigo3B);
				_tiro2.speed = 4;
 				_tiro2.direction = _direcao;
				_direcao += 15;
			}
			
			if(contador < 3){
				estadoAtual = "carregando";
			}
			else{
				estadoAtual = "fugindo";	
			} 
			break;
			
		case "fugindo":
			if(escolher_direcao == false){
				vspeed = -2;
				hspeed = choose(1 , -1);
				
				escolher_direcao = true;
				
			}
			if(y <= -43){
				instance_destroy();	
				
			}
			break;
	}		
}
