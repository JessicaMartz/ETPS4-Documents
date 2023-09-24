class Parcial {
    var saldoDeCuenta: Double
    var nombreDelTitular: String
    var numeroDeCuenta: String

    init(nombreDelTitular: String, saldoDeCuenta: Double) {
        self.nombreDelTitular = nombreDelTitular
        self.saldoDeCuenta = saldoDeCuenta
        self.numeroDeCuenta = "" 
        self.numeroDeCuenta = generarNumeroDeCuenta() 
    }

    private func generarNumeroDeCuenta() -> String {
        let numeroAleatorio = Int.random(in: 100000..<999999)
        return "CC\(numeroAleatorio)"
    }

    func setIngreso(monto: Double) {
        saldoDeCuenta += monto
    }

    func setReintegro(monto: Double) {
        if monto > saldoDeCuenta {
            print("No hay saldo suficiente para el reintegro.")
        } else {
            saldoDeCuenta -= monto
        }
    }

    func getSaldoCuenta() -> Double {
        return saldoDeCuenta
    }

    func getDatosCuenta() -> String {
        return "Titular: \(nombreDelTitular)\nNúmero de cuenta: \(numeroDeCuenta) \nSaldo: \(saldoDeCuenta)"
    }

    func realizarTransferenciaEntreCuentas(otraCuenta: Parcial, monto: Double) {
        if monto > saldoDeCuenta {
            print("No hay saldo suficiente para realizar la transferencia.")
        } else {
            saldoDeCuenta -= monto
            otraCuenta.setIngreso(monto: monto)
            print("\n********Transferencia exitosa*********")
        }
    }
}

class OperacionesBanco {
    var parcial1: Parcial
    var parcial2: Parcial

    init() {
        
        print("Ingrese el nombre del titular para Parcial_1:")
        guard let nombreParcial1 = readLine(), !nombreParcial1.isEmpty else {
            fatalError("Nombre no válido.")
        }        
        print("Ingrese el saldo inicial para Parcial_1:")
        guard let saldoParcial1Input = readLine(),
              let saldoParcial1 = Double(saldoParcial1Input) else {
            fatalError("Saldo no válido.")
        }

        parcial1 = Parcial(nombreDelTitular: nombreParcial1, saldoDeCuenta: saldoParcial1)

        print("Ingrese el nombre del titular para Parcial_2:")
        guard let nombreParcial2 = readLine(), !nombreParcial2.isEmpty else {
            fatalError("Nombre no válido.")
        }
        
        print("Ingrese el saldo inicial para Parcial_2:")
        guard let saldoParcial2Input = readLine(),
              let saldoParcial2 = Double(saldoParcial2Input) else {
            fatalError("Saldo no válido.")
        }

        parcial2 = Parcial(nombreDelTitular: nombreParcial2, saldoDeCuenta: saldoParcial2)

        print("Ingrese el monto para la transferencia de Parcial_1 a Parcial_2:")
        guard let montoTransferenciaInput = readLine(),
              let montoTransferencia = Double(montoTransferenciaInput) else {
            fatalError("Monto no válido.")
        }

        parcial1.realizarTransferenciaEntreCuentas(otraCuenta: parcial2, monto: montoTransferencia)
       
        print("Datos de Parcial_1:")
        print(parcial1.getDatosCuenta())
        print("")

        print("Datos de Parcial_2:")
        print(parcial2.getDatosCuenta())
    }
}

let operacionesBanco = OperacionesBanco()
