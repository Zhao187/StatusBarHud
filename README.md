# StatusBarHud
一个简单的状态栏指示器

### Getting Started【开始使用】

### Installation【安装】

------

#### From CocoaPods【使用CocoaPods】

```objc
pod IOSStatusBarHud
```

#### Manually【手动导入】

- Drag all source files under folder `StatusBarHud ` to your project.【将`StatusBarHud` 文件夹中的所有源代码拽入项目中】
- Import the main header file：`#import "StatusBarHud.h"`【导入主头文件：`#import "StatusBarHud.h"`】

### 显示提示信息

```objc
[StatusBarHUD showMessage:@"提示信息"];
```

### 显示成功信息

```objc
[StatusBarHUD showSuccess:@"加载成功"];
```

### 显示失败信息

```objc
[StatusBarHUD showError:@"加载失败"];
```

### 显示加载信息

```objc
[StatusBarHUD showLoading:@"正在加载中"];
```

### 显示隐藏信息

```objc
[StatusBarHUD hide];
```

