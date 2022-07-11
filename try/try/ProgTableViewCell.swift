//
//  ProgTableViewCell.swift
//  try
//
//  Created by Kesh Gurung on 10/07/2022.
//


import UIKit

class ProgTableViewCell: UITableViewCell {

    static let reuseID = "\(ProgTableViewCell.self)"

    lazy var newImageView : UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = .systemGray
        return imageView
    }()

    lazy var newIndexLabel : UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.backgroundColor = .systemPink
        return label
    }()
    
    lazy var newSliderLabel : UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.backgroundColor = .systemPurple
        label.isUserInteractionEnabled = true
        label.text = "0.0"
        return label
    }()
    
    lazy var newSlider: UISlider = {
        let slider = UISlider(frame: .zero)
        slider.translatesAutoresizingMaskIntoConstraints = false
        slider.backgroundColor = .systemRed
        slider.minimumValue = 1
        slider.maximumValue = 100
        slider.isUserInteractionEnabled = true
        slider.addTarget(self, action: #selector(self.sliderValue(_: )), for: .valueChanged)
        return slider
    }()

    lazy var newButton: UIButton = {
        let button = UIButton(frame: .zero)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .systemBlue
        return button
    }()


    
    @objc func sliderValue(_ sender: UISlider){
        newSliderLabel.text =   "\(String(format: "%.0f", sender.value)) m"
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        self.setUpUI()

    }

//    always required
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


    private func setUpUI(){
        let vstackView = UIStackView(frame: .zero)
        vstackView.translatesAutoresizingMaskIntoConstraints = false
        vstackView.spacing = 8
        vstackView.axis = .vertical
        vstackView.distribution = .fillEqually

        vstackView.addArrangedSubview(self.newIndexLabel)
        vstackView.addArrangedSubview(self.newSlider)
        vstackView.addArrangedSubview(self.newSliderLabel)
        vstackView.addArrangedSubview(self.newButton)

        let hstackView = UIStackView(frame: .zero)
        hstackView.translatesAutoresizingMaskIntoConstraints = false
        hstackView.spacing = 8
        hstackView.axis = .horizontal


        hstackView.addArrangedSubview(self.newImageView)
        hstackView.addArrangedSubview(vstackView)

        self.newImageView.heightAnchor.constraint(equalToConstant: 150).isActive = true
        self.newImageView.widthAnchor.constraint(equalToConstant: 150).isActive = true

        self.contentView.addSubview(hstackView)

        hstackView.bindToSuperView()

    }





}
