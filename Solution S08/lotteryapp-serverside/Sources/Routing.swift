import Foundation
import PerfectHTTP

/**
 Returns a Routes variable which contains all the possible routes and their handlers.
 
 - return: Routes variable
 */
func generateRoutes() -> Routes {
    var routes = Routes()
    
    routes.add(method: .get, uris: ["/lottery", "/lottery/"], handler: getLottery)
    routes.add(method: .post, uris: ["/lottery", "/lottery/"], handler: createLottery)
    routes.add(method: .put, uris: ["/lottery/{timestamp}", "/lottery/{timestamp}/"],
               handler: editLottery)
    routes.add(method: .delete, uri: "/lottery/{timestamp}", handler: removeLottery)
    
    return routes
}
