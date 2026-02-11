import SwiftUI
import CoreText

@main
struct MyApp: App {
    
    init() {
        registerFont(filename: "WinkySans", fileExtension: "ttf")
    }
    
    func registerFont(filename: String, fileExtension: String) {
        guard let fontURL = Bundle.main.url(forResource: filename, withExtension: fileExtension) else {
            return
        }
        
        var error: Unmanaged<CFError>?
        CTFontManagerRegisterFontsForURL(fontURL as CFURL, .process, &error)
        if let error = error {
        print("deu erro :(")
        }
    }
    var body: some Scene {
        WindowGroup {
//            ContentView()
            DialogTester()
        }
    }
}
