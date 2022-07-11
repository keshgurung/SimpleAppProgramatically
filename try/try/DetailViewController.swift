//
//  DetailViewController.swift
//  try
//
//  Created by Kesh Gurung on 10/07/2022.
//

import UIKit




class DetailViewController: UIViewController {

    
    lazy var topImageView : UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = .systemGray
        return imageView
    }()

    lazy var topIndexLabel : UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.text = "Index@"
        label.backgroundColor = .blue
        return label
    }()
    

    lazy var topButton: UIButton = {
        let button = UIButton(frame: .zero)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .systemBlue
        button.setTitle("Dismiss", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemPink
        button.addTarget(self, action: #selector(self.btnPressed), for: .touchUpInside)
        return button
    }()

    let text: String
    let imgStr: String

    init(text: String, imgStr: String ){
        self.text = text
        self.imgStr = imgStr
        super.init(nibName: nil, bundle: nil)
    }
//
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .systemPurple
        
        self.setUpUI()
        self.topIndexLabel.text = self.text
        self.topImageView.image = UIImage(named: imgStr)
        
        // Do any additional setup after loading the view.
    }
     
   
    
    
    private func setUpUI(){
        self.view.addSubview(self.topImageView)
        self.view.addSubview(self.topIndexLabel)
        self.view.addSubview(self.topButton)
        
        self.topImageView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 8).isActive = true
        self.topImageView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -8).isActive = true
        self.topImageView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 8).isActive = true
        self.topImageView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -200).isActive = true

        self.topIndexLabel.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 8).isActive = true
        self.topIndexLabel.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -8).isActive = true

        self.topIndexLabel.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -100).isActive = true
        self.topIndexLabel.heightAnchor.constraint(equalToConstant: 44).isActive = true

        
        self.topButton.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 8).isActive = true
        self.topButton.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -8).isActive = true

        self.topButton.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -8).isActive = true
        self.topButton.heightAnchor.constraint(equalToConstant: 44).isActive = true
        
    }
    
    @objc func btnPressed(){
        self.dismiss(animated: true, completion: nil)
        print("btn pressed")
    }
    
    
}
