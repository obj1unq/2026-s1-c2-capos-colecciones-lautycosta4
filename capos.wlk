import artefactos.*
import castillos.*

object rolando {
const mochila= #{}
var castilloActual=castillo1

const historialArtefactos=[]
var capacidadMochila= 2

var valorBasePelea= 5

var poderPelea= valorBasePelea + poder



method valorBasePelea(_valorBasePelea){valorBasePelea=_valorBasePelea}
method valorBasePelea(){return valorBasePelea}

method historialArtefactos(){return historialArtefactos}

method artefactosEnMochila(){  return mochila}
method capacidadMochila(_capacidadMochila){capacidadMochila=_capacidadMochila}
method capacidadMochila(){return capacidadMochila}

method artefactosEnCastillo(){ return castilloActual}

method artefactosEncontrados(){
    return mochila + castilloActual.artefactos()
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
}

    method poderPelea(){return
    valorBasePelea + 
    mochila.sum({artefacto=>artefacto.poder(self)})
    }

method artefactoMasPoderosoDelCastilloActual(){
        return castilloActual.artefactoMasPoderoso()
}
}

