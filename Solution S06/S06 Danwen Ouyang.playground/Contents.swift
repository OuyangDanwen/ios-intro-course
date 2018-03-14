enum MealError: Error {
    case emptyMeals
}

class CookieMonster {
    var name: String
    var meals = Stack<Eatable>()
    
    init(name: String) {
        self.name = name
    }
    
    func takeFood(meal: Eatable) {
        meals.push(meal)
    }
    
    func eatFood() throws {
        if (meals.count() == 0) {
            throw MealError.emptyMeals
        }
        
        var totalCalories = 0
        
        while meals.count() > 0 {
            let meal = self.meals.pop()
            totalCalories += meal.calories
            print("Yummy, \(meal.name)!")
        }
        
        print("Total calories are \(totalCalories).")
    }
}

struct Salad: Eatable {
    var name: String
    var calories: Int
}

struct FireHydrant: Eatable {
    var name: String
    var calories: Int
}

struct Cookie: Eatable {
    var name: String
    var calories: Int
}

struct Stack<Element> {
    var items = [Element]()
    
    mutating func push(_ item: Element) {
        items.append(item)
    }
    
    mutating func pop() -> Element {
        return items.removeLast()
    }
    
    mutating func count() -> Int {
        return items.count
    }
}

protocol Eatable {
    var name: String { get set }
    var calories: Int { get set }
}

let cookieMonster = CookieMonster(name: "Tony")

cookieMonster.takeFood(meal: Salad(name: "Mango", calories: 200))
cookieMonster.takeFood(meal: FireHydrant(name: "Rice", calories: 500))
cookieMonster.takeFood(meal: FireHydrant(name: "Noodle", calories: 500))
cookieMonster.takeFood(meal: Cookie(name: "Monster", calories: 300))

do {
    try cookieMonster.eatFood()
} catch MealError.emptyMeals {
    print("Cannot eat. No meals added yet!")
}