How to use same code for different platforms
============================================

Much like on the web, sometimes in your NativeScript apps you want to write CSS rules that apply to your entire application, and sometimes you want to write CSS rules that apply to a specific portion of the interface. In the previous section you saw how to use NativeScript’s app.css file to write global rules, and in this section you’ll learn how to use a component’s styleUrls property to apply rules that are scoped to individual components.


**Platform specific files**

In NativeScript you'll find :file:`app.css`, :file:`platform.ios.css`, and :file:`platform.android.css`.This structure gives you a the possibility to add a class attribute in a XML tag and define it on common styling :file:`app.css` or iOS-specific css and Android-specific css. The same can be customized with other files (css or not) like :file:`login.ios.js` and :file:`login.android.js`, for example.

**Platfrom specific attributes by UIComponent**

Some of UICompotents have specific attributes such as:

.. highlight:: xml

::

<ActionItem text="Share" (tap)="share()" android.systemIcon="ic_menu_share_holo_dark" ios.systemIcon="9" ios.position="right"></ActionItem>


**Platform properties in logic**

By convention, NativeScript controls make their iOS and Android native implementations available via ios and android properties, respectively. For example, in a function where the parameter is a TextFiled, args.color.ios resolves to a UIColor, and args.view.ios resolves to a UITextField. Once you have a reference to these controls you can set native properties on them directly in TypeScript. There’s no need to jump into Xcode or AS and write Objective-C, Swift or Java. And this doesn’t apply just to attributes. In NativeScript, all iOS and Android APIs are globally available to use—again, directly in TypeScript code. Let's understand it better with this piece of code
	

.. highlight:: javascript

::

	import { Color } from "color";
	import { TextField } from "ui/text-field";

	declare var NSAttributedString: any;
	declare var NSDictionary: any;
	declare var NSForegroundColorAttributeName: any;
	
	export function setHintColor(args: { view: TextField, color: Color }) {
	  if (args.view.android) {
	    args.view.android.setHintTextColor(args.color.android);
	  }
	if (args.view.ios) {
	    let dictionary = new NSDictionary(
	      [args.color.ios],
	      [NSForegroundColorAttributeName]
	    );
	    args.view.ios.attributedPlaceholder = NSAttributedString.alloc().initWithStringAttributes(
	      args.view.hint, dictionary);
	  }
	}	

