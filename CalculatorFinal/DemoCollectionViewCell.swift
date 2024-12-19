import UIKit

class DemoCollectionViewCell: UICollectionViewCell {
    static let identifier = "DemoCollectionViewCell"
    
    // Lazy initialization of the UIImageView
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // Configure the cell with the image name
    func configure(with imageName: String) {
        imageView.image = UIImage(systemName: imageName)
        imageView.tintColor = getTintColor(for: imageName)
    }
    
    private func getTintColor(for imageName: String) -> UIColor {
        if ["plus.circle.fill", "minus.circle.fill", "multiply.circle.fill", "divide.circle.fill", "equal.circle.fill"].contains(imageName) {
            return .orange // Operators: Orange fill
        
        }
        else if ["a.circle.fill", "plusminus.circle.fill", "number.circle.fill"].contains(imageName){
            return .systemGray2
        }
        else {
            return .darkGray// Numbers and others: White fill
        }
    }
    
    // Setup the view and add imageView with constraints
    private func setupView() {
        contentView.addSubview(imageView)
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
}

