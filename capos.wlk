import artefactos.*
import castillos.*

object rolando {
const mochila= #{}
var castilloActual=castillo1

const historialArtefactos=[]
var capacidadMochila= 2

var valorBasePelea= 5

method valorBasePelea(_valorBasePelea){valorBasePelea=_valorBasePelea}
method valorBasePelea(){return valorBasePelea}

method historialArtefactos(){return historialArtefactos}

method artefactosEnMochila(){  return mochila}
method capacidadMochila(_capacidadMochila){capacidadMochila=_capacidadMochila}
method capacidadMochila(){return capacidadMochila}

method artefactosEnCastillo(){ return castilloActual.inventario()}

method artefactosEncontrados(){
    return mochila + castilloActual.inventario()
}

method hayArtefacto(artefacto) {
    self.artefactosEncontrados().contains(artefacto)
	}

method castilloActual(_castilloActual){castilloActual=_castilloActual}

method irACastillo(){
    castilloActual.guardarArtefactos(mochila)
    mochila.clear()
}

method recogerArtefacto(artefacto){
    historialArtefactos.add(artefacto)
    self.puedeLevantar()
    mochila.add(artefacto)
}
method puedeLevantar(){
    if(mochila.size()==capacidadMochila)
    {self.error("la mochila esta llena")
}
}

 
 method batalla (){
    mochila.forEach({artefacto=>artefacto.usar()})
   self.actualizarBase()
  }

    method actualizarBase() {
      valorBasePelea=valorBasePelea+1
    }
    
    method poderPelea(){return
    valorBasePelea + 
    mochila.sum({artefacto=>artefacto.poder(self)})
    }

method artefactoMasPoderosoDelCastilloActual(){
        return castilloActual.artefactoMasPoderoso(self)
}
//2.3
/*Los enemigos en Erethia que Rolando puede vencer son aquellos que tienen un poder de batalla 
menor al suyo. A su vez, las moradas que Rolando podría conquistar son las moradas de los enemigos
a los cuales puede vencer.*/
    const moradasConquistables=[]
    
    const enemigosAVencer=[]


    method puedeVencer(enemigo){
        if (self.poderPelea()>enemigo.poderPelea()){
            enemigosAVencer.add(enemigo)
            moradasConquistables.add(enemigo.castilloActual())
        }
    }

    method enemigosAVencer() { return enemigosAVencer}

    method moradasConquistables(){return moradasConquistables}


}

//Caterina tiene 28 de poder de pelea y vive en la fortaleza de acero
object caterina {

const castilloActual=fortalezaDeAcero
method castilloActual(){return castilloActual}
method poderPelea(){return 28}

}

//Archibaldo tiene 16 de poder de pelea y vive en el palacio de mármol. 
object archibaldo {
  const castilloActual=palacioDeMarmol
method castilloActual(){return castilloActual}
method poderPelea(){return 16}
}

//Astra tiene 14 de poder pelea y vive en la torre de marfil
object astra {
const castilloActual=torreDeMarfil
method castilloActual(){return castilloActual}
method poderPelea(){return 14}
}




