import UIKit

class ViewController: UIViewController {

    let DICE_IMAGE_NAME_PREFIX: String = "dice"
    let START_DOMINO_NUMBER: Int = 1
    let LAST_DOMINO_NUMBER: Int = 6
    let WAIT_TIME_100_MILLISECONDS = 100000
    let TIMES_TO_BE_ROLLED = 5

    @IBOutlet weak var leftDiceImageView: UIImageView!
    @IBOutlet weak var rightDiceImageView: UIImageView!
    @IBOutlet weak var rollButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.updateToRandomDicesNumberImage()
    }

    @IBAction func onRollButtonPressed(_ sender: UIButton) {
        self.rollButton.isEnabled = false
        self.rollButton.backgroundColor = UIColor.gray
        self.rollDices()
    }

    func rollDices() {
        DispatchQueue.global(qos: .default).async {
            self.generateDicesRollingAnimation()
            DispatchQueue.main.async {
                self.rollButton.isEnabled = true
                self.rollButton.backgroundColor = UIColor.init(named: "Salmon")
            }
        }
    }

    func generateDicesRollingAnimation() {
        var timesRolled = 1
        for _ in 0...self.TIMES_TO_BE_ROLLED {
            DispatchQueue.main.async {
                self.updateToRandomDicesNumberImage()
            }
            usleep(useconds_t(self.WAIT_TIME_100_MILLISECONDS * timesRolled))
            timesRolled += 1
        }
    }

    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        updateToRandomDicesNumberImage()
    }

    func updateToRandomDicesNumberImage() {
        leftDiceImageView.image = getRandomDiceImage()
        rightDiceImageView.image = getRandomDiceImage()
    }

    func getRandomDiceImage() -> UIImage? {
        let randomDiceNumber: Int = Int.random(in: START_DOMINO_NUMBER ... LAST_DOMINO_NUMBER)
        let diceImageName: String = "\(DICE_IMAGE_NAME_PREFIX)\(randomDiceNumber)"
        return UIImage(named: diceImageName)
    }
}
