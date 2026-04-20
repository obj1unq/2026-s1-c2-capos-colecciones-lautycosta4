import capos.*
import castillos.*
/*- Espada del destino: La primera vez que se utiliza aporta 
la misma cantidad que el poder base del personaje, 
luego sólo el 50%. */
object espadaDelDestino{
    var usado= false
    var poder=  0

    method usada() {
      usado=false
    }

    method sinUsar() {
      usado=true
    }

    method usar(personaje){
        if(usado){
            poder=personaje.valorBasePelea() 
            self.usada()
        }else poder=personaje.valorBasePelea()/2
    }
    method poder(){return poder} 

}

/* Collar divino: aporta 3 puntos, pero si el personaje 
tiene un poder base mayor a 6, le suma también un punto 
por cada batalla en la que se haya usado el collar.*/
object collarDivino{
   var cantidadBatallasCollar=0
    const poder= 0 
    method usar(personaje){
        if (personaje.valorBasePelea()<=6){
           poder==3     
        }else 
        {poder==3+cantidadBatallasCollar}
        cantidadBatallasCollar=+1 
    }
    method poder(){return poder} 
}

/*
- Armadura de acero valyrio: Aporta 6 de poder de pelea 
siempre, el acero valyrio no se gasta con las batallas.*/
object armaduraDeAceroValyrio{
    
    const poder= 6  
    method usar(){
        poder 
    }    
    method poder(){return poder} 
}
object libroDeHechizos{

} 

