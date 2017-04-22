enum MealType {
    case salads, fireHydrants, cookies
}

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

struct Meal: Eatable {
    var name: MealType
    var calories: Int
    
    init(name: MealType, calories: Int) {
        self.name = name
        self.calories = calories
    }
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
    var name: MealType { get set }
    var calories: Int { get set }
}

let cookieMonster = CookieMonster.init(name: "Tony")

cookieMonster.takeFood(meal: Meal.init(name: MealType.fireHydrants, calories: 200))
cookieMonster.takeFood(meal: Meal.init(name: MealType.salads, calories: 500))
cookieMonster.takeFood(meal: Meal.init(name: MealType.fireHydrants, calories: 500))
cookieMonster.takeFood(meal: Meal.init(name: MealType.cookies, calories: 300))

do {
    try cookieMonster.eatFood()
} catch MealError.emptyMeals {
    print("Cannot eat. No meals added yet!")
}

