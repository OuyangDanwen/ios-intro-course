struct City {
    let name: String
    let imageName: String
    var guide: String
    var favorite: Bool
    
    var composedName: String {
        return self.favorite ? self.name + " ❤️" : self.name
    }
}
