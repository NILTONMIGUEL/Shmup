/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

if(global.debug){
	draw_text(20,20,"level do tiro " + string(level_do_tiro));
}
var _guiHeight = display_get_gui_height();
//desenhando os icones
desenhar_icon(spr_iconPlayer,_guiHeight -60, vidas);
desenhar_icon(spr_iconEscudo,_guiHeight -20,escudos);

