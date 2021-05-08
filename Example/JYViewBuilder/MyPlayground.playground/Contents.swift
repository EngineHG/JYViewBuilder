//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport
import JYViewBuilder

class MyViewController : UIViewController {
    override func loadView() {
        
        self.view = VStack(spacing: 8){
            label("hello")
            label("word!")
            for i in 0...5{
                label("\(i)")
            }
            HStack{
                label("hello")
                label("word!")
            }
        }
        .distribution(.fillEqually)
    }
    
    private func label(_ text: String) -> UILabel {
        let lb = UILabel()
        lb.text = text
        lb.backgroundColor = .lightGray
        return lb
    }
}
// Present the view controller in the Live View window
PlaygroundPage.current.liveView = MyViewController()
