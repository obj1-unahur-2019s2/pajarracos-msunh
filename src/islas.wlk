import pajarracos.*

class Isla {

	var property alpiste = 10
	var property maiz = 10
	var property aves = []

	method agregarAve(ave) {
		aves.add(ave)
	}

	method quitarAve(ave) {
		aves.remove(ave)
	}

	method avesDebiles() {
		return aves.filter({ ave => ave.fuerza() < 1000 })
	}

	method avesFuertes() {
		return aves.filter({ ave => ave.fuerza() > 1000 })
	}

	method cantidadDeAvesDebiles() {
		return self.avesDebiles().size()
	}

	method cantidadDeAvesFuertes() {
		return self.avesFuertes().size()
	}

	method fuerzaTotal() {
		return aves.sum({ ave => ave.fuerza() })
	}

	method esRobusta() {
		return aves.all({ ave => ave.fuerza() > 300 })
	}

	method terremoto() {
		aves.forEach({ ave => ave.recibirUnDisgusto()})
	}

	method tormenta() {
		self.avesDebiles().forEach({ ave => ave.recibirUnDisgusto()})
	}

	method aveCapitana() {
		return aves.find({ ave => ave.fuerza().between(1000, 3000) })
	}

	method sesionDeRelax() {
		aves.forEach({ ave => ave.seRelaja()})
	}

	method estaEnPaz() {
		return aves.all({ ave =>ave.estaConforme(self) } )
	}

}
