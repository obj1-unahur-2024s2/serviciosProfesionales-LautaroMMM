/* WKO well known objects 
1- Instancia de algo
*/
class Caramelo {
  var property sabor
  var peso
  
  method peso() = peso
  
  method mordisco() {
    peso *= 0.9
  }
}

object mariano {
  const bolsa = []
  
  method agregarCaramelo(unCaramelo) {
    bolsa.add(unCaramelo)
  }
  
  method bolsa() = bolsa
}