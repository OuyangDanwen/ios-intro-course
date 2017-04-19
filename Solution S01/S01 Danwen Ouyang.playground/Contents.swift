class Cookie {
    var type: String
    var brand: String
    
    init(type: String, brand : String) {
        self.type = type
        self.brand = brand
    }
}

class CookieMonster {
    var name: String
    var cookies = [Cookie]()
    
    init(name: String) {
        self.name = name
    }
    
    func takeCookie(cookieInstance : Cookie) {
        cookies.append(cookieInstance)
    }
    
    func eatCookies() {
        print("\(cookies.count) Cooookies!!!! Om nom nom", terminator: "")
        cookies.removeAll()
    }
}

let monsterInstance = CookieMonster.init(name: "Danwen")
var additionalPrinting =  ""
let cookieSelections = [Cookie.init(type: "Chocolate", brand: "Oreo"), Cookie.init(type: "Butter", brand: "Dannish"), Cookie.init(type: "Fruity", brand: "Yummy")]

for i in 0...2 {
    monsterInstance.takeCookie(cookieInstance: cookieSelections[i])
    additionalPrinting = additionalPrinting + " nom nom"
}

monsterInstance.eatCookies()
print(additionalPrinting)
