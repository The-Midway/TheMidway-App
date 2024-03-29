//
//  MainViewTableCell.swift
//  TheMidway
//
//  Created by Gui Reis on 20/01/22.
//

import UIKit
import SwiftUI

class MainViewTableCell: UITableViewCell {

    /* MARK: - Atributos */
    
    static let identifier = "IdMainViewTableCell"
    
    private var titleLabel: UILabel
    
    private var datetimeLabel: UILabel
    
    private var participantsLabel: UILabel
    
    private var iconDatetime: UIImageView = {
        let imgView = UIImageView()
        
        imgView.translatesAutoresizingMaskIntoConstraints = false
        
        imgView.tintColor = UIColor(named: "AccentColor")
        return imgView
    }()
    
    
    
    /* MARK: -  */
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        self.titleLabel = MainViewTableCell.newLabelAjustable(color: UIColor(named: "TitleLabel"))
        self.datetimeLabel = MainView.newLabel(color: UIColor.secondaryLabel)
        self.participantsLabel = MainViewTableCell.newLabelAjustable(color: UIColor.secondaryLabel)
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
                
        self.contentView.addSubview(self.titleLabel)
        self.contentView.addSubview(self.datetimeLabel)
        self.contentView.addSubview(self.participantsLabel)
        self.contentView.addSubview(self.iconDatetime)
        
        self.backgroundColor = UIColor(named: "BackgroundColor")
        
        self.accessoryType = .disclosureIndicator
        
        self.setConstraints()
    }
    
    required init?(coder: NSCoder) {fatalError("init(coder:) has not been implemented")}
    
    
    
    /* MARK: - Encapsulamento */
    
    public func setCellInfo(info: MeetingCreatedCellInfo) -> Void {
        // Título
        self.titleLabel.text = info.title.text
        self.titleLabel.font = .systemFont(ofSize: info.title.sizeFont, weight: info.title.weight)
        
        
        // Ícone
        let configIcon = UIImage.SymbolConfiguration(pointSize: info.date.sizeFont, weight: .medium, scale: .medium)
        let img = UIImage(systemName: "calendar", withConfiguration: configIcon)
        self.iconDatetime.image = img
        
        
        // Data e hora
        self.datetimeLabel.text = "\(info.date.text) - \(info.hour)"
        self.datetimeLabel.font = .systemFont(ofSize: info.date.sizeFont, weight: info.date.weight)
        
        
        // Participantes
        var aux = ""

        // Cria a String personalizada para a quantidade de pessoas que tem
        for x in 0..<info.participants.count {
            aux += "\(info.participants[x])"
            
            if x == 1 && info.participants.count > 3 {
                aux += " e \(info.participants.count - 2) outros"
                break
            }
            
            if x + 1 != info.participants.count {
                if x + 2 == info.participants.count {aux += " e "}
                else {aux += ", "}
            }
        }
        
        
        self.participantsLabel.text = aux
        self.participantsLabel.font = .systemFont(
            ofSize: info.participantsConfig.sizeFont,
            weight: info.participantsConfig.weight
        )
    }
    
    
    
    /* MARK: - Configurações */
    
    public override func awakeFromNib() -> Void {
        super.awakeFromNib()
        // Initialization code
    }

    public override func setSelected(_ selected: Bool, animated: Bool) -> Void{
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    
    /* MARK: - Constraints */
    
    private func setConstraints() -> Void {
        let space: CGFloat = 5
        
        // Título
        let titleLabelConstraints: [NSLayoutConstraint] = [
            self.titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: space),
            self.titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.titleLabel.heightAnchor.constraint(equalToConstant: 25)
        ]
        NSLayoutConstraint.activate(titleLabelConstraints)
        
        
        // Ícone
        let iconDatetimeConstraints: [NSLayoutConstraint] = [
            self.iconDatetime.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor, constant: space),
            self.iconDatetime.leadingAnchor.constraint(equalTo: self.titleLabel.leadingAnchor),
            self.iconDatetime.widthAnchor.constraint(equalToConstant: 20),
            self.iconDatetime.heightAnchor.constraint(equalToConstant: 20)
        ]
        NSLayoutConstraint.activate(iconDatetimeConstraints)
        
        
        // Data e hora
        let datetimeLabelConstraints: [NSLayoutConstraint] = [
            self.datetimeLabel.topAnchor.constraint(equalTo: self.iconDatetime.topAnchor),
            self.datetimeLabel.leftAnchor.constraint(equalTo: self.iconDatetime.rightAnchor, constant: space),
            self.datetimeLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.datetimeLabel.heightAnchor.constraint(equalToConstant: 20)
        ]
        NSLayoutConstraint.activate(datetimeLabelConstraints)
        
        
        // Participantes
        let participantsLabelConstraints: [NSLayoutConstraint] = [
            self.participantsLabel.topAnchor.constraint(equalTo: self.iconDatetime.bottomAnchor, constant: space),
            self.participantsLabel.leadingAnchor.constraint(equalTo: self.titleLabel.leadingAnchor),
            self.participantsLabel.trailingAnchor.constraint(equalTo: self.titleLabel.trailingAnchor),
            self.participantsLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ]
        NSLayoutConstraint.activate(participantsLabelConstraints)
    }
    
    
    /* MARK: - Configurações */
    
    static func newLabelAjustable(color: UIColor?) -> UILabel {
        let lbl = MainView.newLabel(color: color)
        lbl.adjustsFontSizeToFitWidth = true
        return lbl
    }

}
