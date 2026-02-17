/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

vida = 1;

alarm[0] = game_get_speed(gamespeed_fps) * random(2);



#region metodos do inimigo
	atirando = function(){
		var _tiro = instance_create_layer(x,y,layer,obj_tiro_inimigo1);
		var _velTiro = 3;

		_tiro.vspeed = _velTiro;	
	}

	morrendo = function(_part){
	
		var _chance = random(100);
		instance_destroy();
		instance_create_layer(x, y, "inst_particulas", _part);
		
		if(_chance >= 90){
			instance_create_layer(x, y, layer , obj_powerUps);	
		}
		
	}

#endregion