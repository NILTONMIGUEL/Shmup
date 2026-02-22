/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor


if(y <= -64){
	instance_destroy(id, false);	
} 

image_xscale = lerp(image_xscale , 1 ,0.2);
image_yscale = lerp(image_yscale , 1 ,0.2);

vspeed = lerp(vspeed, -10 , 0.1);