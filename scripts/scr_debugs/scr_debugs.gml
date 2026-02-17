// Os recursos de script mudaram para a v2.3.0; veja
// https://help.yoyogames.com/hc/en-us/articles/360005277377 para obter mais informações

global.debug = false;

function destruindo(_part){
	instance_destroy();
	
	instance_create_layer(x, y , "inst_particulas", _part);
}