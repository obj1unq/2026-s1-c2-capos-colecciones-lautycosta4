import capos.*
import castillos.*
/*- Espada del destino: La primera vez que se utiliza aporta 
la misma cantidad que el poder base del personaje, 
luego sólo el 50%. */
object espadaDelDestino{
    var usado= false
  
    method usar(){
       usado= true  }

    method poder(personaje){return 
        if(!usado){
            personaje.valorBasePelea()             
        }else personaje.valorBasePelea()/2
        } 

}

/* Collar divino: aporta 3 puntos, pero si el personaje 
tiene un poder base mayor a 6, le suma también un punto 
por cada batalla en la que se haya usado el collar.*/
object collarDivino{
   var cantidadBatallasCollar=0
    const poder= 3 
    
method cantidadBatallasCollar()
{return cantidadBatallasCollar}

    method usar(){      
        cantidadBatallasCollar=cantidadBatallasCollar+1 }

    method poder(personaje){return 
        if (personaje.valorBasePelea()<=6){
           poder    
        }else 
        {poder+cantidadBatallasCollar}} 
}

/*
- Armadura de acero valyrio: Aporta 6 de poder de pelea 
siempre, el acero valyrio no se gasta con las batallas.*/
object armaduraDeAceroValyrio{
    
    const poder= 6  

    method usar(){
        poder     }

    method poder(){return poder}

    method poder(personaje){return poder} 
}


object libroDeHechizos{
    const hechizos=[]
    
    method usar(){
        if (not hechizos.isEmpty()){
         hechizos.remove(hechizos.first())
        } 
    }
    method guardarHechizo(hechizo) {
      hechizos.add(hechizo)
    }
    method poder(personaje){ return
    if (not hechizos.isEmpty()){
        hechizos.first().poder(personaje)
    }else 0
    }
} 
object bendicion {
        method poder(personaje){
            return 4
        }
}
object invisibilidad {
    method poder(personaje){
        return personaje.valorBasePelea()
    }
}
object invocacion {
    method poder(personaje){
        return 
        personaje.artefactoMasPoderosoDelCastilloActual().poder(personaje)
    }
}
