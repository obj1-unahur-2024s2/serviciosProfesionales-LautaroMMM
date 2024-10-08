class Universidad {
  const property provincia
  var property honorarios
}

class AsociadoAUniversidad {
  const property universidad
  
  method honorarios() = universidad.honorarios()
  
  method puedeTrabajar() = [universidad.provincia()]
}

class AsociadoALitoral {
  const property universidad
  
  method honorarios() = 3000
  
  method puedeTrabajar() = ["Entre Rios", "Santa Fe", "Corrientes"]
}

class Libre {
  var property puedeTrabajar
  const property universidad
  var property honorarios
}

class Empresa {
  const property profesionales = []
  var property honorariosReferencia
  
  method agregarProfesional(unProfesional) {
    profesionales.add(unProfesional)
  }
  
  method cuantos(unaUniversidad) = profesionales.count(
    { p => p.universidad() == unaUniversidad }
  )
  
  method caros() = profesionales.filter(
    { p => p.honorarios() > honorariosReferencia }
  )
  
  method formadoras() = profesionales.map({ p => p.universidad() }).asSet()
  
  method masBarato() = profesionales.min({ p => p.honorarios() })
}

class Solicitantes {
  
}