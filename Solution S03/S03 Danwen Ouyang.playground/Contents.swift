enum CookieType {
    case diablo, monster, dannish, yummy, oreo
}

struct Cookie {
    var type: CookieType
    var cookieCrust: Bool
}

struct Order {
    var cookie: Cookie
    var customer: String
    var delivery: Bool
}

class CookieBaker {
    var name: String
    var orders: [Order] = []
    var delegate: CookieDeliveryMan?
    
    init(name: String) {
        self.name = name
    }
    
    func process(order: Order) {
        print("Baking a \(order.cookie.type) cookie!")
        if order.delivery {
            if let delegate = delegate {
                print("\(delegate.name)! This \(order.cookie.type) cookie needs to be delivered to \(order.customer)!")
                self.delegate?.deliver(order: order)
            } else {
                print("Sorry, \(order.customer). Our delivery man is currently unavailable for delivery. We will deliver it later.")
            }
        } else {
            print("Hi, \(order.customer). Here is your \(order.cookie.type) cookie!")
        }
    }
    
    func processAll() {
        for order in orders {
            process(order: order)
        }
    }
}

class CookieDeliveryMan: DeliveryDelegate {
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    func deliver(order: Order) {
        print("Hi, \(order.customer). \(self.name) is here to deliver your \(order.cookie.type) cookie!")
    }
}

protocol DeliveryDelegate {
    func deliver(order: Order)
}

let cookieBaker = CookieBaker.init(name: "Sebastian")
let cookieDeliveryMan = CookieDeliveryMan.init(name: "Luigi")

let order1 = Order.init(cookie: Cookie.init(type: CookieType.dannish, cookieCrust: false), customer: "Peter", delivery: true)
let order2 = Order.init(cookie: Cookie.init(type: CookieType.diablo, cookieCrust: false), customer: "Tony", delivery: false)
let order3 = Order.init(cookie: Cookie.init(type: CookieType.oreo, cookieCrust: true), customer: "Mike", delivery: true)
let order4 = Order.init(cookie: Cookie.init(type: CookieType.monster, cookieCrust: false), customer: "Sam", delivery: false)
let order5 = Order.init(cookie: Cookie.init(type: CookieType.yummy, cookieCrust: true), customer: "Nancy", delivery: true)
let orders = [order1, order2, order3, order4, order5]

cookieBaker.delegate = cookieDeliveryMan
cookieBaker.orders = orders
cookieBaker.processAll()