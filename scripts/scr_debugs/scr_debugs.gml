// Os recursos de script mudaram para a v2.3.0; veja
// https://help.yoyogames.com/hc/en-us/articles/360005277377 para obter mais informações

global.debug = false;

function destruindo(_part){
	instance_destroy();
	
	instance_create_layer(x, y , "inst_particulas", _part);
}




function screenShake(_treme){
	
	if(!instance_exists(obj_screenshake)) exit ;
	
	with(obj_screenshake){
		if(_treme > treme){
			
			treme = _treme;
		}
	}
	
}

function criarEfeitoMola(){
	xscale = 1;
	yscale = 1;
}

function usandoEfeitoMola(_xscale,_yscale){
	
	xscale = _xscale;
	yscale = _yscale;
}

function resetandoEfeitoMola(_qtd){
	xscale = lerp(xscale, 1 , _qtd);
	yscale = lerp(yscale , 1 , _qtd);
}

function meDesenhandoEfeitoMola(){
	
	draw_sprite_ext(sprite_index,image_index,x,y,xscale, yscale , image_angle,image_blend,image_alpha);	
}


function iniciandoShader(){
	tomei_tiro = false;	
}
function danoShader(_tempo){
	tomei_tiro = _tempo;
}
function restandoShader(){
	if(tomei_tiro > 0) tomei_tiro--;	
}

function desenhando(_desenhandoShader = draw_self){
	
	if(tomei_tiro){
		shader_set(sh_white);
		_desenhandoShader();	
		shader_reset();
	}
	else{
		_desenhandoShader();	
	}
}	

function efeitoTiro(_snd , _variacao){
	var _pitch = random_range(1 - _variacao , 1 + _variacao);
	
	audio_stop_sound(_snd);
	audio_play_sound(_snd,0,0, , , _pitch);
}