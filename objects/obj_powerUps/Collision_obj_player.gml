/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

//me destruindo
instance_destroy();

//subindo o level do tiro do player

other.aumentandoLevelDoTiro();

//criando o objeto explosão

instance_create_layer(x, y, "inst_powerUps",obj_particulaTiro);
audio_stop_sound(snd_powerUp);
audio_play_sound(snd_powerUp,0,0);
instance_destroy();

