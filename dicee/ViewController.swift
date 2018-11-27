import UIKit

class ViewController: UIViewController {

    let DICE_IMAGE_NAME_PREFIX: String = "dice"
    let START_DOMINO_NUMBER: Int = 1
    let LAST_DOMINO_NUMBER: Int = 6

    @IBOutlet weak var leftDiceImageView: UIImageView!
    @IBOutlet weak var rightDiceImageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        rollDices()
    }

    @IBAction func onRollButtonPressed(_ sender: UIButton) {
        rollDices()
    }

    func rollDices() {
        leftDiceImageView.image = getRandomDiceImage()
        rightDiceImageView.image = getRandomDiceImage()
    }

    func getRandomDiceImage() -> UIImage? {
        let randomDiceNumber: Int = Int.random(in: START_DOMINO_NUMBER ... LAST_DOMINO_NUMBER)
        let diceImageName: String = "\(DICE_IMAGE_NAME_PREFIX)\(randomDiceNumber)"
        return UIImage(named: diceImageName)
    }
}
