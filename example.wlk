class Arma {
  method poderArma() { }
}
class ArmasConFilo inherits Arma {
  const longitud
  const filo
  method filo () {
    return filo.min(1).max(0)
  }
  override method poderArma() {
    return self.filo() * longitud
  }
}
class ArmaContundente inherits Arma {
  const peso
  override method poderArma() {
    return peso
  }
}
class Armadura {
  method puntosArmadura () { }
}
class Casco inherits Armadura {
  override method puntosArmadura () {
    return 10
  }
}
class Escudo inherits Armadura {
  override method puntosArmadura() {
    return 5 + (self.destrezaGladiador()*0.10)
  }
  method destrezaGladiador() {
    return unGladiador.destreza()
  }
}
class Gladiador {
  var vida = 100
  var arma
  method vida () { 
    return vida}
  method destreza() { return }
  method fuerza() { return }
  method poderAtaque() { }
  method atacar() { 
    self.poderAtaque() - otroGladiador.puntosDefenza()
  }
  method defender() { }
  method arma() { return arma}
  method puntosDefenza() {return }
}
class Mirmillon inherits Gladiador {
/* solo un arma, cambia de armadura, fuerza variable y destreza 15*/
  var armadura
  override method poderAtaque() {
    return self.arma().poderArma() + self.fuerza()
  }
  override method destreza() {
    return 15
  }
  override method puntosDefenza() {
    return armadura.defensa() + self.destreza()
  }
  method cambiarArmadura(otraArmadura) {
    armadura = otraArmadura
  }
  method armadura() {
    return armadura
  }
}
class Dimachaerus inherits Gladiador {
/*usa varias armas, no usa armadura, cambia destreza, fuerza 10*/
  const armasEquipadas = [ ]
  method agregarArma(unArma) {
    armasEquipadas.add(unArma)
  }
  method quitarArmar(unArma){ 
    armasEquipadas.remove(unArma)
  }
  override method fuerza() {
    return 10
  }
  override method poderAtaque() {
    return self.fuerza() + armasEquipadas.forEach(unArma.poderArma())
  }
}