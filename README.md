# SIMS（课程作业）
0.3版本

综合信息管理系统，包含了用户信息管理系统，文件管理系统，任务管理系统。

优化了用户界面，添加了左侧导航栏。



0.4版本

完全适配了各个页面的侧边栏，修改了首页界面(万叶太帅了)，原来你也玩原神。

我的原神uid：100618367，欢迎来我世界玩。

**遇到的问题**

css部分中的.home-section部分是用来控制section标签的样式的，其中的position属性用来规定标签内容的位置，原本是设定为relative的，（生成相对定位的元素，相对于其正常位置进行定位。因此，"left:20" 会向元素的 LEFT 位置添加 20 像素。），但在实际使用中会使得整个页面的外边框变宽导致浏览器页面出现左右滑动蓝，**最后导致在侧边栏缩回的时候刷新浏览器，侧边栏会挡住原本的滑动按钮**：![1.png](https://cdn.nlark.com/yuque/0/2021/png/2494810/1625737389453-659298eb-53ff-4dbb-bb1c-5c7e665a28df.png)

正常应该为：![2.png](https://cdn.nlark.com/yuque/0/2021/png/2494810/1625737400493-61095d3e-ec9d-4ab1-8f09-0544183c183b.png)

因为外轮廓太大，底部出现滑动栏：

![3.png](https://cdn.nlark.com/yuque/0/2021/png/2494810/1625737621946-b5718bc9-f7f5-4d69-a0a5-989d6c98e888.png)

解决方法：

position:fixed 生成绝对定位的元素，相对于浏览器窗口进行定位。

定死元素相对浏览器窗口的位置，不会随着画面的滚动而改变。

元素的位置通过 "left", "top", "right" 以及 "bottom" 属性进行规定。

将position的属性该为fixed后问题解决，同时左右滑动栏也消失了，画面边框宽度也正常了：

![3.png](https://cdn.nlark.com/yuque/0/2021/png/2494810/1625737704505-a22dab6f-2120-4dcc-a34b-0b534be3cd29.png)

**原因分析**：relative是用相对位置进行定位的，原本设定中的left可能太大导致右边界面溢出，浏览器刷新时无法回到正常位置，通过fixed属性规定定死标签块相对浏览器窗口的位置，元素不会随着画面的滚动而改变，可以在一定程度上解决这个问题，但缺点可能fixed没有relative那么灵活。