import UIKit

class ProfileHeaderView: UIView {
    
    var nameLabel: UILabel = {
        
        let label = UILabel()
        label.text = "No Drama Lama"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label.textColor = .black
        return label
    }()
    
    var statusLabel: UILabel = {
        
        let label = UILabel()
        label.text = "Waiting for something..."
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.textColor = .gray
        return label
    }()
    
    var profileImageView: UIImageView = {
        
        let image = UIImageView()
        image.image = UIImage(named: "ava2")
        image.translatesAutoresizingMaskIntoConstraints = false
        image.layer.cornerRadius = 50
        image.clipsToBounds = true
        image.layer.borderWidth = 3
        image.layer.borderColor = UIColor.white.cgColor
        return image
    }()
    
    private lazy var statusButton: UIButton = {
        
        let button = UIButton()
        button.setTitle("Show status", for: .normal)
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 10
       
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.layer.shadowOffset = CGSize(width: 10, height: 10)
        button.layer.shadowRadius = 4
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.7
        
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)

        return button
    }()
    
    private lazy var textField: UITextField = {
        
        let textField = UITextField()
        textField.layer.cornerRadius = 10
        textField.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        textField.textColor = .black
        textField.backgroundColor = UIColor.white
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.black.cgColor
        //textField.placeholder = " Enter your text"
        textField.text = " Enter your text"
        textField.textColor = .darkGray
        
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        textField.addTarget(self, action: #selector(statusTextChanged), for: .editingChanged)
        textField.addTarget(self, action: #selector(clearTextField), for: .editingDidBegin)
        textField.addTarget(self, action: #selector(spaceBeforeTyping), for: .editingDidBegin)
        
        return textField
    }()
    
    
    init() {
        super.init(frame: .zero)
        
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        self.addSubview(nameLabel)
        self.addSubview(profileImageView)
        self.addSubview(statusLabel)
        self.addSubview(statusButton)
        self.addSubview(textField)
    }
    
    
    func setupConstraints() {
        
        let safeArea = self.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            
            nameLabel.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor),
            nameLabel.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 27),
            
            
            profileImageView.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 16),
            profileImageView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 16),
            profileImageView.heightAnchor.constraint(equalToConstant: 100),
            profileImageView.widthAnchor.constraint(equalToConstant: 100),
            
            
            statusLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 16),
            statusLabel.leadingAnchor.constraint(equalTo: profileImageView.trailingAnchor, constant: 30),
            
            
            
            statusButton.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -16),
            statusButton.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 16),
            statusButton.topAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: 34),
            statusButton.heightAnchor.constraint(equalToConstant: 50),
            
            
            textField.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -16),
            textField.leadingAnchor.constraint(equalTo: profileImageView.trailingAnchor, constant: 30),
            textField.topAnchor.constraint(equalTo: statusLabel.bottomAnchor, constant: 16),
            textField.heightAnchor.constraint(equalToConstant: 40)
            
        ])
    }
    

    
    @objc func buttonPressed() {
        
        if let text = textField.text, text != " " {
            
            print(statusLabel.text ?? "")
            statusLabel.text = statustext
            textField.layer.borderColor = UIColor.black.cgColor
            
        } else {
            
            textField.layer.borderColor = UIColor.red.cgColor
            print("Enter your text")
        }
        
    }
    
    
    @objc func clearTextField() {

        textField.text = nil
    }
    
    @objc func spaceBeforeTyping() {
        
        textField.text = " " + (textField.text ?? "")
    }
    
    
    private var statustext: String = ""
    
    @objc func statusTextChanged(_ textField: UITextField) {
        
        statustext = textField.text ?? ""
        
    }
    
}
