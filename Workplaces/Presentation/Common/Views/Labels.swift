//
//  Labels.swift
//  Workplaces
//
//  Created by Kseniya Lukoshkina on 22.04.2021.
//

import UIKit

final class TitleLabel: UILabel {
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        textColor = .black
        font = .title
    }
}

final class BodyLargeLabel: UILabel {
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        textColor = .middleGrey
        font = .bodyLarge
    }
}

final class HeaderTitleLabel: UILabel {
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        textColor = .black
        font = .bodyLarge
    }
}
