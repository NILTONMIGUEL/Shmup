/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor


//criando minha primeira onda
var _tamanho = array_length(ondas);



if(numero_onda < _tamanho -1){
	layer_sequence_create("ass_sequence",x,y,ondas[numero_onda]);
	
	numero_onda++;
}
else{
	numero_onda = 0;	
}
alarm[0] = game_get_speed(gamespeed_fps) * 6.6;


