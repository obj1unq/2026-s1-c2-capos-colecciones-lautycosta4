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
    

    method vencerEnemigo(enemigo){
        if (self.poderPelea()>enemigo.poderPelea()){
            enemigosAVencer.add(enemigo)
            moradasConquistables.add(enemigo.castilloActual())
        }
    }

    method enemigosAVencer() { return enemigosAVencer}

    method moradasConquistables(){return moradasConquistables}

//2.4
/*
Se considera que Rolando es poderoso en la tierra de Erethia si está en condiciones de 
vencer a todos los enemigos.
*/
    const enemigos=[]

    method agregarEnemigo(_enemigo){
        enemigos.add(_enemigo)
    }
    method puedeVencer(enemigo){
        return self.poderPelea()>enemigo.poderPelea()
    }

    method esPoderoso(){ return
        enemigos.size()>0 &&
        enemigos.all({enemigo=> self.puedeVencer(enemigo)})
    }

//2.5
    method poderPeleaCon(artefacto) {
            return artefacto.poder(self)
    }

    method tieneArtefactoFatal(enemigo){return
        mochila.any({artefacto => self.poderPeleaCon(artefacto)>enemigo.poderPelea()})
    }
    method artefactoFatalPara(enemigo){
        if(self.tieneArtefactoFatal(enemigo)){ 
         return   mochila.find({artefacto => self.poderPeleaCon(artefacto)>enemigo.poderPelea()})
        }else self.error("no tiene artefacto fatal para este enemigo")
 }
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




