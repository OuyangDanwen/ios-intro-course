class Cookie {
    var type: String
    var brand: String
    
    init(type: String, brand: String) {
        self.type = type
        self.brand = brand
    }
}

class CookieMonster {
    var name: String
    var cookies: [Cookie] = []
    
    init(name: String) {
        self.name = name
    }
    
    func takeCookie(cookie: Cookie) {
        cookies.append(cookie)
    }
    
    func eatCookies() {
        print("\(cookies.count) Cooookies!!!! Om nom nom")
        cookies.removeAll()
    }
}

let monster = CookieMonster.init(name: "Danwen")
var additionalPrinting =  ""
let cookieSelections = [
    Cookie.init(type: "Chocolate", brand: "Oreo"),
    Cookie.init(type: "Butter", brand: "Dannish"),
    Cookie.init(type: "Fruity", brand: "Yummy")
]

for cookie in cookieSelections {
    monster.takeCookie(cookie: cookie)
    additionalPrinting = additionalPrinting + "nom nom "
}

monster.eatCookies()
print(additionalPrinting)
