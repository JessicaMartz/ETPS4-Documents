class Superheroe {
    var nombre: String
    var descripcion: String
    var llevaCapa: Bool

    init(nombre: String) {
        self.nombre = nombre
        self.descripcion = ""
        self.llevaCapa = false
    }

    func mostrar() -> String {
        return "Nombre: \(nombre) \nDescripción: \(descripcion.isEmpty ? "N/A" : descripcion) \nLleva Capa: \(llevaCapa ? "si" : "no")"
    }
}
func obtenerEntrada() -> String? {
    print("Ingrese un valor (o presione Enter para dejarlo vacío):")
    if let input = readLine(), !input.isEmpty {
        return input
    }
    return nil
}
print("Ingrese el nombre del superhéroe:")
guard let nombre = readLine(), !nombre.isEmpty else {
    fatalError("El nombre no puede estar vacío.")
}

let superheroe = Superheroe(nombre: nombre)

print("Ingrese la descripción del superhéroe:")
if let descripcion = obtenerEntrada() {
    superheroe.descripcion = descripcion
}
print("¿El superhéroe lleva capa? (si/no)")
if let llevaCapaInput = readLine(), let llevaCapa = Bool(llevaCapaInput.lowercased()) {
    superheroe.llevaCapa = llevaCapa
}
print("\n**********IMPRIMIENDO DESCRIPCION***********\n")
print("Detalles del superhéroe:")
print(superheroe.mostrar())