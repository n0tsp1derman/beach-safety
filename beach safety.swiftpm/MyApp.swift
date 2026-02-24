import SwiftUI
import CoreText

@main
struct MyApp: App {
    
    
    
    init() {
        
        registerFont(filename: "WinkySans", fileExtension: "ttf")
        
//        for i in UIFont.familyNames.sorted() {
//            for name in UIFont.fontNames(forFamilyName: i){
//                print(name)
//            }
//        }
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
            ContentView()
                .onAppear {
                if let scene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
                    scene.requestGeometryUpdate(.iOS(interfaceOrientations: .landscapeLeft))
                }
            }
        }
        
    }
       
}
