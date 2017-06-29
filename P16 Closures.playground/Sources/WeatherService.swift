import Foundation

/// A fake weather service.

public class WeatherService {
    
    /**
     Provides Weather information.
     
     @param response: A string (closure parameter) with weather information.
     */

    public class func getWeather(response: @escaping (_ detail: String) -> Void) {
        delay(duration: 4) { (message) in
            response(message)
        }
    }
    
    class func delay(duration:Int, simulateResponse: @escaping (_ message: String)-> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            simulateResponse("San Francisco 55°F")
        }
    }
}
