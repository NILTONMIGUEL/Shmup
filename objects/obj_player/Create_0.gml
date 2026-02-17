/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

#region variaveis do game
//criando função método de movimentação do player

velocidade = 2;

espera_tiro = 10;

timer_tiro = 0;

level_do_tiro = 1;

vidas = 3;

timer_dano = game_get_speed(gamespeed_fps);
timer_vida = 0;


escudos = 3;

meu_escudo = noone;

#endregion


#region metodos

	function controlarPlayer(){
	
		timer_vida--;
		var _cima,_baixo,_esquerda,_direita,_atirar;
	
		_cima = keyboard_check(ord("W")) or keyboard_check(vk_up);
		_baixo = keyboard_check(ord("S")) or keyboard_check(vk_down);
		_esquerda = keyboard_check(ord("A")) or keyboard_check(vk_left);
		_direita = keyboard_check(ord("D")) or keyboard_check(vk_right);
		_atirar = keyboard_check(vk_space) or mouse_check_button(mb_left);
	
		var _velh = (_direita - _esquerda) * velocidade;
		x += _velh;
	
		//limitando o player sair da room na horizontal
	
		x = clamp(x ,sprite_width/2, room_width - sprite_width/2);
	
		var _velv = (_baixo - _cima) * velocidade;
		y += _velv;
	
		//limitando o player sair da room na horizontal
		y = clamp(y ,sprite_height/2 , room_height - sprite_height/2)

		timer_tiro--;
	
		if(_atirar and timer_tiro <= 0){

			if(level_do_tiro == 1){
				tiro_1();	
			}
			else if(level_do_tiro == 2){
				tiro_2();	
			}
			else if(level_do_tiro == 3){
				tiro_3();	
			}
			
			timer_tiro = espera_tiro;
		}
	}
	
	function tiro_1(){
		
		var _tiro = instance_create_layer(x,y,"inst_tiro",obj_tiro_player);	
		_tiro.vspeed = -10;
	}
	
	function tiro_2(){
		var _tiro1 = instance_create_layer(x-15,y,"inst_tiro",obj_tiro_player);
		_tiro1.vspeed = -10;
		
		_tiro1 = instance_create_layer(x+15,y,"inst_tiro",obj_tiro_player);
		_tiro1.vspeed = -10;
	}
	
	function tiro_3(){
		tiro_1();
		tiro_2();
 	}
  	
	
	function aumentandoLevelDoTiro(){
		
		if(level_do_tiro < 3){
			level_do_tiro++;	
		}
	}
	
	desenhar_icon = function(_icon , _altura,_qtd){
		
		var _espaco = 0;
		
		
		
		repeat(_qtd){
			
			draw_sprite_ext(_icon,0,20 + _espaco,_altura,1,1,0,c_white,0.5);
			
			_espaco += 25;
		}
		
	}
	
	perde_vida = function(){
		
		if(vidas > 0 and timer_vida <= 0){
			vidas--;
			
			timer_vida = timer_dano;
		}
		else if(vidas <= 0){
			instance_destroy();	
		}
	}
	
	usar_escudo = function(){
		if(escudos > 0 and meu_escudo == noone){
			
			meu_escudo = instance_create_layer(x, y,"inst_escudos",obj_escudo);
			escudos--;
			
		}
	}
	
	escudo_player = function(){
		if(instance_exists(meu_escudo)){
			meu_escudo.x = x;
			meu_escudo.y = y;
		}
		else{
			meu_escudo = noone;	
		}
	}
	
	
	
	
	
     	
#endregion


#region debugs
	function debug(){
	
		if(keyboard_check_pressed(vk_tab)){
			global.debug = !global.debug;
		}	
	}
	
	perder_vida = function(){
		if(keyboard_check_pressed(vk_enter)){
			perde_vida();
		}	
	}
	
	usando_escudo = function(){
		if(keyboard_check_pressed(ord("E"))){
			usar_escudo();	
		}
	}	
#endregion