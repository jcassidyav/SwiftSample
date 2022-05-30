import Foundation
import SwiftMessages

@objcMembers
@objc(NSCSwiftMessages)
public class NSCSwiftMessages: NSObject {

    @objc public var onDoneCallBack: ((String)-> Void)? = nil;

    public func showMessage(title: String, body: String) {


        // Instantiate a message view from the provided card view layout. SwiftMessages searches for nib
        // files in the main bundle first, so you can easily copy them into your project and make changes.
        let view = MessageView.viewFromNib(layout: .cardView)

        // Theme message elements with the warning style.
        view.configureTheme(.success)
        view.button?.isHidden=true;
        // Add a drop shadow.
        view.configureDropShadow()
        view.button?.isHidden=true;
        // Set message title, body, and icon. Here, we're overriding the default warning
        // image with an emoji character.
        let iconText = ["🤔", "😳", "🙄", "😶"].randomElement()!
        view.configureContent(title: title, body: body, iconText: iconText)

        // Increase the external margin around the card. In general, the effect of this setting
        // depends on how the given layout is constrained to the layout margins.
        view.layoutMarginAdditions = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)

        // Reduce the corner radius (applicable to layouts featuring rounded corners).
        (view.backgroundView as? CornerRoundingView)?.cornerRadius = 10

        var config = SwiftMessages.Config()

        // Specify one or more event listeners to respond to show and hide events.
        config.eventListeners.append() { event in
            if case .didHide = event {
                self.onDoneCallBack?("Message Alert Hidden");
                
            }
        }

        // Show the message.
        SwiftMessages.show(config: config, view: view)


    }
}
