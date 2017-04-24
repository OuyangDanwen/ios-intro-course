protocol SaveGuideDelegate: class {
    /**
     Saves an edited "city" which replaces the original one in "cities".
     
     - Parameter cityGuide: the `city` which was edited and is to replace the original one
     - Parameter cityIndex: the index at vhich the "city" can be located in "cities"
     
     */    func saveGuide(cityGuide: City, cityIndex: Int)
}
