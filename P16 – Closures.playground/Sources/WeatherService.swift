import Foundation

/// A fake weather service.

public class WeatherService {
    
    /**
     Provides Weather information.
     
     @param response: A string (closure parameter) with weather information.
     */

    public class func getWeather(response: (detail:String) -> Void) {
        delay(4) { (message) in
            response(detail: message)
        }
    }
    
    class func delay(duration:Int,simulateResponse: (message:String)-> Void) {
        let time = dispatch_time(dispatch_time_t(DISPATCH_TIME_NOW), 2 * Int64(NSEC_PER_SEC))
        dispatch_after(time, dispatch_get_main_queue()) {
            simulateResponse(message: "San Francisco 55°F")
        }
    }
}