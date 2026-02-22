/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

//me desenhando
draw_self();
// setando o gpu do game para dar brilho
gpu_set_blendmode(bm_add);


//me desenhando novamente com brilho
draw_sprite_ext(sprite_index, image_index,x,y,image_xscale * 1.3, image_yscale * 1.3,image_angle, cor, 0.5);

gpu_set_blendmode(bm_normal);