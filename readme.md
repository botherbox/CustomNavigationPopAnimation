### 自定义NavigationController的滑动返回操作

NavigationController自带的滑动返回必须在边缘滑动才能触发
此Demo实现了在屏幕的任意位置滑动可以出发返回上一个ViewController的操作

* 将NavigationController自带的边缘滑动返回操作取消
* 通过实现NavigationControllerDelegate的两个代理方法实现自定义pop

```objc
	
	- (id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController animationControllerForOperation:(UINavigationControllerOperation)operation fromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC;
	
	- (id<UIViewControllerInteractiveTransitioning>)navigationController:(UINavigationController *)navigationController interactionControllerForAnimationController:(id<UIViewControllerAnimatedTransitioning>)animationController
	
```