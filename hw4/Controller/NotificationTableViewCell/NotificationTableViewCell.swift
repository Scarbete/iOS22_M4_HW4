import UIKit
import SnapKit



class NotificationTableViewCell: UITableViewCell {

    private lazy var cellView: UIView = MakerView.makerView.createView()
    
    private lazy var userImage: UIImageView = MakerView.makerView.createImage()
    
    private lazy var userTitleLabel: UILabel = MakerView.makerView.createLabel(
        textColor: UIColor(hex: "#212121"), fontSize: 18, fontWeight: .semibold, numberOfLines: 2
    )
    
    private lazy var userDataLabel: UILabel = MakerView.makerView.createLabel(
        textColor: UIColor(hex: "#616161"), fontWeight: .medium
    )
    
    private lazy var userFoodImageView: UIImageView = MakerView.makerView.createImage()
    
    private lazy var userMenuButton: UIButton = MakerView.makerView.createButton(
        setImage: UIImage(named: "userMenu")
    )
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init ( coder ) error")
    }
    
    private func setupCell() {
        configureCellView()
        configureUserImage()
        configureUserMenuButton()
        configureUserFoodImage()
        configureUserTitle()
        configureUserData()
    }
    
    private func configureCellView() {
        contentView.addSubview(cellView)
        
        cellView.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview().inset(20)
            make.horizontalEdges.equalToSuperview()
            make.height.equalTo(84)
        }
    }
    
    private func configureUserImage() {
        cellView.addSubview(userImage)
        
        userImage.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.centerY.equalToSuperview()
            make.width.height.equalTo(48)
        }
    }
    
    private func configureUserMenuButton() {
        cellView.addSubview(userMenuButton)
        
        userMenuButton.snp.makeConstraints { make in
            make.trailing.equalToSuperview()
            make.centerY.equalToSuperview()
            make.height.width.equalTo(24)
        }
    }
    
    private func configureUserFoodImage() {
        cellView.addSubview(userFoodImageView)
        
        userFoodImageView.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.trailing.equalTo(userMenuButton.snp.leading).offset(-12)
            make.width.height.equalTo(72)
        }
    }
    
    private func configureUserTitle() {
        cellView.addSubview(userTitleLabel)
        
        userTitleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(8)
            make.leading.equalTo(userImage.snp.trailing).offset(16)
            make.trailing.equalTo(userFoodImageView.snp.leading).offset(-12)
        }
    }
    
    private func configureUserData() {
        cellView.addSubview(userDataLabel)
        
        userDataLabel.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-8)
            make.leading.equalTo(userImage.snp.trailing).offset(16)
            make.trailing.equalTo(userFoodImageView.snp.leading).offset(-12)
        }
    }
    
    func setupDataCell(userIMG: String, userTitle: String, userData: String, userFoodImage: String) {
        userImage.image = UIImage(named: userIMG)
        userTitleLabel.text = userTitle
        userDataLabel.text = userData
        userFoodImageView.image = UIImage(named: userFoodImage)
    }
    
}
