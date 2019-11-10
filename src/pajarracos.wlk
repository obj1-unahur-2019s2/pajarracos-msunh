import islas.*
import nidos.*

class Aguilucho {

	var property velocidad = 20

	method fuerza() {
		if (velocidad <= 60) {
			return 180
		} else {
			return velocidad * 3
		}
	}

	method recibirUnDisgusto() {
		velocidad = velocidad * 2
	}

	method seRelaja() {
		velocidad = velocidad - 10
	}

	method estaConforme(isla) {
		return isla.alpiste() >= 8
	}

	method tomarAlimento(isla) {
		isla.alpiste() - 3
		velocidad = velocidad + 15
	}

}

class AguiluchoColorado inherits Aguilucho {

	override method fuerza() {
		return super() + 400
	}

}

class Albatros {

	var property peso = 4000
	var property masaMuscular = 600

	method fuerza() {
		if (peso < 6000) {
			return masaMuscular
		} else {
			return masaMuscular / 2
		}
	}

	method recibirUnDisgusto() {
		peso = peso + 800
	}

	method irAlGimnasio() {
		masaMuscular = masaMuscular + 500
		peso = peso + 500
	}

	method seRelaja() {
		peso = peso - 300
	}

	method avesMasFuertesQueYo(isla) {
		return isla.aves().filter({ ave => ave.fuerza() > self.fuerza() })
	}

	method cantidadDeAvesMasFuertesQueYo(isla) {
		return self.avesMasFuertesQueYo(isla).size()
	}

	method estaConforme(isla) {
		return self.cantidadDeAvesMasFuertesQueYo(isla) >= 2
	}

	method tomarAlimento(isla) {
		isla.maiz() - 4
		peso += 700
		masaMuscular += 700
	}

}

class Paloma {

	var property ira = 200

	method fuerza() {
		return ira * 2
	}

	method recibirUnDisgusto() {
		ira = ira + 300
	}

	method seRelaja() {
		ira = ira - 50
	}

	method estaConforme(isla) {
		return isla.cantidadDeAvesDebiles() >= 1
	}

	method tomarAlimento(param) {
	}

	method equilibrarse() {
		if (self.fuerza() <= 700) {
			self.recibirUnDisgusto()
		} else {
			self.seRelaja()
		}
	}

}

class PalomaMontera inherits Paloma {
	var property fuerza = 2000
	
	override method fuerza(){
		return fuerza
	}

	method  fuerza(cuanto){
		fuerza = cuanto.min(2000)
	} 
}

class PalomaManchada inherits Paloma {

	var property nidos = #{}

	method agregarNido(nido) {
		nidos.add(nido)
	}

	override method recibirUnDisgusto() {
		var nido = new Nido()
		self.agregarNido(nido)
		super()
	}

	method cantidadDeNidos() {
		return nidos.size()
	}

	override method seRelaja() {
		if (self.cantidadDeNidos() > 2) {
			nidos.forEach({ nido => nido.grosor() + 1})
		} else {
			super()
		}
	}

	method sumaTotalDePotenciaDeNidos() {
		return nidos.sum({ nido => nido.potencia() })
	}

	override method ira() {
		return super() + self.sumaTotalDePotenciaDeNidos()
	}

}

class PalomaTorcaza inherits Paloma {

	var property huevos = 3

	override method fuerza() {
		return super() + huevos * 100
	}

	override method recibirUnDisgusto() {
		huevos = huevos + 1
		super()
	}

}

