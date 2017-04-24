protocol SaveGuideDelegate: class {
    /**
     Save an edited "city" which replaces the original one in "cities".
     
     - Parameter cityGuide: the `city` which was edited and is to replace the original one
     
     */    func saveGuide(cityGuide: City, cityIndex: Int)
}
