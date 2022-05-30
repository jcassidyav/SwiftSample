
declare class NSCSwiftMessages extends NSObject {

	static alloc(): NSCSwiftMessages; // inherited from NSObject

	static new(): NSCSwiftMessages; // inherited from NSObject

	onDoneCallBack: (p1: string) => void;

	showMessageWithTitleBody(title: string, body: string): void;
}
