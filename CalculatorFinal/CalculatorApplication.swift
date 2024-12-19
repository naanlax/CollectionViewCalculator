import UIKit

class CalculatorViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    private var collectionView: UICollectionView!
    private let calculatorButtons = [
        "A/C", "+/-", "#", "÷",
        "7", "8", "9", "×",
        "4", "5", "6", "−",
        "1", "2", "3", "+",
        "<", "0", ".", "=",
    ]

    private var currentInput: String = ""
    private var previousValue: Double? = nil
    private var currentOperation: String? = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
    }

    private func setupCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10

        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: layout)
        collectionView.backgroundColor = .black
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(CalculatorButtonCell.self, forCellWithReuseIdentifier: "cell")

        view.addSubview(collectionView)
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return calculatorButtons.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CalculatorButtonCell
        cell.configure(with: calculatorButtons[indexPath.item])
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        _ = calculatorButtons[indexPath.item]
        //handleButtonPress
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let totalSpacing = (10 * 4)
        let width = (collectionView.bounds.width - CGFloat(totalSpacing)) / 4
        return CGSize(width: width, height: width)
    }
}

class CalculatorButtonCell: UICollectionViewCell {

    private let buttonLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 24, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(buttonLabel)
        contentView.backgroundColor = .darkGray
        contentView.layer.cornerRadius = 8

        NSLayoutConstraint.activate([
            buttonLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            buttonLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(with title: String) {
        buttonLabel.text = title
        switch title {
        case "A", "+/-", "#", "<":
            contentView.backgroundColor = .gray
        case "+", "−", "×", "÷", "=":
            contentView.backgroundColor = .orange
        default:
            contentView.backgroundColor = .darkGray
        }
    }
}

