object castillo1 {
  const artefactos=#{}  
  method guardarArtefactos(mochila){
        artefactos.addAll(mochila)
  }
  method inventario(){
    return artefactos
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