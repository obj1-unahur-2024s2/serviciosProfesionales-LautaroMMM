class Universidad {
  const property provincia
  var property honorarios
  var donaciones = 0
  
  method recibirDonaciones(unImporte) {
    donaciones += unImporte
  }
}

class AsociadoAUniversidad {
  const property universidad
  
  method honorarios() = universidad.honorarios()
  
  method puedeTrabajar() = [universidad.provincia()]
  
  method cobrar(unImporte) {
    universidad.recibirDonaciones(unImporte * 0.5)
  }
}

class AsociadoALitoral {
  const property universidad
  
  method honorarios() = 3000
  
  method puedeTrabajar() = ["Entre Rios", "Santa Fe", "Corrientes"]
  
  method cobrar(unImporte) {
    universidad.recibirDonaciones(unImporte * 0.5)
  }
}

class Libre {
  var property puedeTrabajar
  const property universidad
  var property honorarios
  
  method cobrar(unImporte) {
    universidad.recibirDonaciones(unImporte * 0.5)
  }
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
  
  method esDeGenteAcotada() = !profesionales.any(
    { p => p.puedeTrabajar().size() > 3 }
  )
  
  method satisfacer(unSolicitante) = profesionales.any(
    { p => unSolicitante.puedeSerAtendidoPor(p) }
  )
}

class SolicitantePersona {
  var property provincia
  
  method puedeSerAtendidoPor(
    unProfesional
  ) = unProfesional.puedeTrabajar().contains(provincia)
}

class SolicitanteInstitucion {
  var property universidades
  
  method puedeSerAtendidoPor(unProfesional) = universidades.contains(
    unProfesional.universidad()
  )
}

class SolicitanteClub {
  var property provincias
  
  method puedeSerAtendidoPor(unProfesional) = provincias.any(
    { p => unProfesional.puedeTrabajar().contains(p) }
  )
}