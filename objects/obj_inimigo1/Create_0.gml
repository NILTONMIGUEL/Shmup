/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

vida = 1;

criado_em_seq = in_sequence;


alarm[0] = game_get_speed(gamespeed_fps) * random(2);



#region metodos do inimigo
	atirando = function(){
		var _tiro = instance_create_layer(x,y,layer,obj_tiro_inimigo1);
		var _velTiro = 3;

		_tiro.vspeed = _velTiro;	
		
		efeitoTiro(snd_tiroInimigo , 0.4);
	}

	morrendo = function(_part){
		
		vida--;
		
		var _chance = random(100);
		if(vida <= 0){

			instance_destroy();
			audio_stop_sound(snd_explosaoInimigo);
			audio_play_sound(snd_explosaoInimigo,0,0,,,0.5);
			screenShake(15);
			instance_create_layer(x, y, "inst_particulas", _part)
		}
		
		if(_chance >= 90){
			instance_create_layer(x, y, layer , obj_powerUps);	
		}
		
	}
	
	destruindo_inimigo_seq = function(){
		if(criado_em_seq and !in_sequence){
			instance_destroy();	
		}
	}

#endregion