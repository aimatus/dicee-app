import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var leftDiceImageView: UIImageView!
    @IBOutlet weak var rightDiceImageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func onRollButtonPressed(_ sender: UIButton) {
        leftDiceImageView.image = getRandomDiceImage()
        rightDiceImageView.image = getRandomDiceImage()
    }

    func getRandomDiceImage() -> UIImage? {
        let randomNumber: Int = Int.random(in: 1 ... 6)
        let diceImageName: String = "dice\(randomNumber)"
        return UIImage(named: diceImageName)
    }
}
