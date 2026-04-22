object castillo1 {
  const artefactos=#{}  

  method guardarArtefactos(mochila){
        artefactos.addAll(mochila)
  }
  method inventario(){
    return artefactos
  }
  method artefactoMasPoderoso(personaje){
        return artefactos.max({artefacto=>artefacto.poder(personaje)})
  }

}
object castillo2 {
  const artefactos=#{}

  method guardarArtefactos(mochila){
        artefactos.addAll(mochila)
  }
  
  method inventario(){
    return artefactos
  }
}