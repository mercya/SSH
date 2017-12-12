import mx.utils.Delegate
import mx.transitions. *
import mx.transitions.easing. *
import include.DepthSet
//
stop ()
//
//
//声明变量
var container : MovieClip //装载显示图片的MC
//
var controlBG : MovieClip //底部控制条的背景
var controlBGWidth : Number = Stage.width //底部控制条背景的宽度
var controlBGHeight : Number = 20 //底部控制条背景的高度
var controlBGX : Number = 0 //底部控制条背景的X坐标
var controlBGY : Number = Stage.height - controlBGHeight //底部控制条背景的Y坐标
//
var controlMenu : MovieClip //底部控制按钮
var controlBtnWidth : Number = 20 //按钮宽度
var controlBtnHeight : Number = 20 //按钮高度
//
var showProgress : TextField //显示加载进度
//
var allBytesLoaded : Number = 0 //总体下载字节数
var allBytesTotal : Number = 0 //总体字节数
//
var titleText : TextField //图片标题
//
var itemTotal : Number //图片总数  XML节点长度是从1开始
//
var xmlArray : Array = [] //保存载入的XML, 方便调用
//
var intervalTime : Number //每张图片显示的间隔时间
var intervalID : Number //存储间隔计时的ID
//
var isRandom : Boolean //标识是否随机显示图片
//
var curShowID : Number = 0 //当前显示的图片的索引
//
//
//载入XML配置文件
var xmlObj : XML = new XML ()
xmlObj.ignoreWhite = true
//判断是否从页面传来xml路径参数
if ((xmlPath == undefined) || (xmlPath == ""))
{
	xmlObj.load ("xml/viewerData.xml")
}
else
{
	xmlObj.load (xmlPath)
}
xmlObj.onLoad = Delegate.create (this, init)
//
//
//绘制矩形函数
function drawBox (mc : MovieClip, x : Number, y : Number, w : Number, h : Number, bgColor : Number, bgAlpha : Number) : Void
{
	mcName.lineStyle (0, 0xE6E6E6, 100, true, "none")
	mc.beginFill (bgColor, bgAlpha)
	mc.moveTo (x, y)
	mc.lineTo (x + w, y)
	mc.lineTo (x + w, y + h)
	mc.lineTo (x, y + h)
	mc.lineTo (x, y)
	mc.endFill ()
}
//
//初始化
function init (isLoadXMLSuccess : Boolean) : Boolean
{
	//判断XML加载是否成功
	if ( ! isLoadXMLSuccess)
	{
		return false
	}
	//
	//
	itemTotal = xmlObj.firstChild.childNodes.length
	intervalTime = xmlObj.firstChild.attributes ["interval"]
	isRandom = Boolean (Number (xmlObj.firstChild.attributes ["isRandom"]))
	//
	//把XML数据保存到数组中
	for (var i = 0; i < itemTotal; i ++)
	{
		xmlArray [i] = {
			title : "", img : "", url : "", target : "", bytesLoaded : 0, bytesTotal : 0, loadComplete : false, btnMC : null, showMC : null
		}
		xmlArray [i].title = xmlObj.firstChild.childNodes [i].attributes ["title"]
		xmlArray [i].img = xmlObj.firstChild.childNodes [i].attributes ["img"]
		xmlArray [i].url = xmlObj.firstChild.childNodes [i].attributes ["url"]
		xmlArray [i].target = xmlObj.firstChild.childNodes [i].attributes ["target"]
	}
	//
	//创建一个容器MC
	container = this.createEmptyMovieClip ("Container", this.getNextHighestDepth ())
	container._visible = false //等全部图片载入完毕后再显示
	//
	//创建文本框显示loading进度
	showProgress = this.createTextField ("ShowProgress", this.getNextHighestDepth () , 0, 0, 0, 0)
	showProgress.textColor = 0x000000
	showProgress.selectable = false //不可选
	showProgress.autoSize = true
	showProgress.text = "开始载入..."
	showProgress._x = Stage.width / 2 - showProgress.textWidth / 2 //居中
	showProgress._y = Stage.height / 2 - showProgress.textHeight / 2
	//
	//判断是否随机显示
	if (isRandom)
	{
		xmlArray = randomOrder (xmlArray) //把该数组随机排序
	}
	//
	//循环载入所有图片
	for (var i = 0; i < itemTotal; i ++)
	{
		loader (i, xmlArray [i].img)
	}
}
//
//控制加载情况
function loader (indexID : Number, path : String) : Void
{
	var loadListener : Object = new Object ()
	//
	loadListener.onLoadStart = function (target_mc : MovieClip)
	{
	}
	loadListener.onLoadProgress = function (target_mc : MovieClip, bytesLoaded : Number, bytesTotal : Number) : Void
	{
		//把该图片下载进度存到数组中
		xmlArray [indexID].bytesLoaded = bytesLoaded
		xmlArray [indexID].bytesTotal = bytesTotal
		//
		//统计全部图片下载进度
		allBytesLoaded = 0
		allBytesTotal = 0
		for (var i in xmlArray)
		{
			allBytesLoaded += xmlArray [i].bytesLoaded
			allBytesTotal += xmlArray [i].bytesTotal
		}
		//
		showProgress.text = Math.round (allBytesLoaded / 1024) + "/" + Math.round (allBytesTotal / 1024) + "KB"
		showProgress._x = Stage.width / 2 - showProgress.textWidth / 2 //居中
		showProgress._y = Stage.height / 2 - showProgress.textHeight / 2
	}
	loadListener.onLoadComplete = function (target_mc : MovieClip, httpStatus : Number) : Void
	{
	}
	loadListener.onLoadInit = function (target_mc : MovieClip) : Void
	{
		target_mc.indexID = indexID
		xmlArray [indexID].showMC = target_mc
		xmlArray [indexID].loadComplete = true //标识该图片载入完毕
		//
		//判断需不需要为图片加单击事件
		if (xmlArray [indexID].url != "#")
		{
			target_mc.onRelease = function ()
			{
				getURL (xmlArray [indexID].url, xmlArray [indexID].target)
			}
		}
		else
		{
			target_mc.onRelease = null
			target_mc.useHandCursor = false
		}
		//
		//调整图片的层深关系
		DepthSet.setTop ("viewer", xmlArray [indexID].showMC)
		//
		//遍历数组, 检查是否已经全部图片加载完毕
		var loadCompleteTotal : Number = 0
		for (var i in xmlArray)
		{
			if (xmlArray [i].loadComplete)
			{
				loadCompleteTotal += 1
			}
		}
		//如果全部加载完毕
		if (loadCompleteTotal == itemTotal)
		{
			removeMovieClip (showProgress)
			formation ()
		}
	}
	loadListener.onLoadError = function (target_mc : MovieClip, errorCode : String, httpStatus : Number)
	{
		showProgress.text = "载入图片发生错误" + errorCode
		showProgress._x = Stage.width / 2 - showProgress.textWidth / 2 //居中
		showProgress._y = Stage.height / 2 - showProgress.textHeight / 2
	}
	//
	var mcLoader : MovieClipLoader = new MovieClipLoader ()
	mcLoader.addListener (loadListener)
	var mc : MovieClip = container.createEmptyMovieClip ("Img" + indexID, container.getNextHighestDepth ())
	mc._lockroot = true //设置该MC的_root为自身
	mcLoader.loadClip (path, mc)
}
//
//随机改变数组的排序
function randomOrder (targetArray : Array) : Array
{
	var arrayLength : Number = targetArray.length
	//
	//先创建一个正常顺序的数组
	var tempArray1 : Array = []
	for (var i = 0; i < arrayLength; i ++)
	{
		tempArray1 [i] = i
	}
	//
	//再根据上一个数组创建一个随机乱序的数组
	var tempArray2 : Array = []
	for (var i = 0; i < arrayLength; i ++)
	{
		tempArray2 [i] = tempArray1.splice (Math.floor (Math.random () * tempArray1.length) , 1) //从正常顺序数组中随机抽出元素
		
	}
	//
	//最后创建一个临时数组存储 根据上一个乱序的数组从targetArray中取得数据
	var tempArray3 : Array = []
	for (var i = 0; i < arrayLength; i ++)
	{
		tempArray3 [i] = targetArray [tempArray2 [i]]
	}
	//
	//返回最后得出的数组
	return tempArray3
}
//
//创建所有元件
function formation () : Void
{
	//创建一个空MC作为底部控制条的背景
	controlBG = this.createEmptyMovieClip ("ControlBG", this.getNextHighestDepth ())
	controlBG._x = controlBGX
	controlBG._y = controlBGY
	drawBox (controlBG, 0, 0, controlBGWidth, controlBGHeight, 0x000000, 40)
	//
	//创建导航按钮
	controlMenu = this.createEmptyMovieClip ("ControlMenu", this.getNextHighestDepth ())
	for (var i = 0; i < itemTotal; i ++)
	{
		//创建按钮
		var btn : MovieClip = controlMenu.createEmptyMovieClip ("Btn" + i, controlMenu.getNextHighestDepth ())
		btn.indexID = i
		xmlArray [i].btnMC = btn
		btn.createEmptyMovieClip ("Bg", btn.getNextHighestDepth ())
		drawBox (btn ["Bg"] , 0, 0, controlBtnWidth, controlBtnHeight, 0x000000, 30)
		btn.onRollOver = function ()
		{
			this ["Bg"].clear ()
			drawBox (this ["Bg"] , 0, 0, controlBtnWidth, controlBtnHeight, 0xFF6600, 100)
		}
		btn.onRollOut = function ()
		{
			//如果当前显示的不是自己
			if (curShowID != this.indexID)
			{
				this ["Bg"].clear ()
				drawBox (this ["Bg"] , 0, 0, controlBtnWidth, controlBtnHeight, 0x000000, 30)
			}
		}
		btn.onRelease = function ()
		{
			//如果当前显示的不是自己
			if (curShowID != this.indexID)
			{
				clearInterval(intervalID)
				show (this.indexID)
				showInterval () //开始定时
			}
		}
		//
		//创建按钮上的数字
		var num : TextField = btn.createTextField ("Num", btn.getNextHighestDepth () , 0, 2, controlBtnWidth, controlBtnHeight)
		num.textColor = 0xFFFFFF
		num.selectable = false //不可选
		num.text = i + 1
		//设置字体格式
		var myformat : TextFormat = new TextFormat ()
		myformat.font = "Verdana"
		myformat.align = "center"
		myformat.size = 10
		num.setTextFormat (myformat)
		//
		//排列按钮位置
		if (i == 0)
		{
			btn._x = 0
			btn._y = 0
		} 
		else
		{
			btn._x = pervBtn._x + pervBtn._width
		}
		//
		var pervBtn : MovieClip = btn //保存上一个排列的按钮
		
	}
	//设置导航条位置
	controlMenu._x = controlBG._width - controlMenu._width
	controlMenu._y = controlBG._y
	//
	//
	//创建标题文本
	titleText = this.createTextField ("Title", this.getNextHighestDepth () , controlBG._x, controlBG._y, controlMenu._x, controlMenu._height)
	titleText.textColor = 0xFFFFFF
	titleText.selectable = false //不可选
	titleText.text = ""
	//
	//
	show (curShowID) //显示第一张图片
	container._visible = true
	showInterval () //开始定时
}
//
//显示
function show (indexID : Number) : Void
{
	DepthSet.setTop ("viewer", xmlArray [indexID].showMC)
	//
	showEffect (indexID) //显示图片过渡效果
	titleEffect (xmlArray [indexID].title) //标题文字切换效果
	//
	xmlArray [indexID].btnMC.onRollOver ()
	curShowID = indexID
	//
	var arrayLength : Number = xmlArray.length
	for (var i = 0; i < arrayLength; i ++)
	{
		if (indexID != i)
		{
			xmlArray [i].btnMC.onRollOut ()
		}
	}
}
//
//显示
function showInterval () : Void
{
	//定时
	intervalID = setInterval (function ()
	{
		curShowID += 1
		if (curShowID >= itemTotal)
		{
			curShowID = 0
		}
		//
		show (curShowID)
	}, intervalTime)
}
//
//标题过渡效果
function titleEffect (content : String) : Void
{
	var myTween : Tween = new Tween (titleText, "_y", mx.transitions.easing.Strong.easeIn, titleText._y, (controlBG._y + controlBG._height), 0.3, true)
	myTween.onMotionFinished = Delegate.create (this, function ()
	{
		titleText.text = content
		var myformat : TextFormat = new TextFormat ()
		myformat.font = "Verdana"
		titleText.setTextFormat (myformat)
		new Tween (titleText, "_y", mx.transitions.easing.Strong.easeOut, (controlBG._y + controlBG._height), controlBG._y, 0.5, true)
	})
}
//
//图片过渡效果
function showEffect (indexID : Number) : Void
{
	var randomNum : Number = Math.floor (Math.random () * 7)
	//
	switch (randomNum)
	{
		case 0 :
		TransitionManager.start (xmlArray [indexID].showMC,
		{
			type : Blinds, direction : Transition.IN, duration : 0.5, easing : None.easeNone, numStrips : 10, dimension : 0
		})
		break;
		case 1 :
		TransitionManager.start (xmlArray [indexID].showMC,
		{
			type : Fade, direction : Transition.IN, duration : 0.5, easing : None.easeNone
		})
		break;
		case 2 :
		TransitionManager.start (xmlArray [indexID].showMC,
		{
			type : Iris, direction : Transition.IN, duration : 0.5, easing : Strong.easeOut, startPoint : 5, shape : Iris.CIRCLE
		})
		break;
		case 3 :
		TransitionManager.start (xmlArray [indexID].showMC,
		{
			type : Photo, direction : Transition.IN, duration : 0.5, easing : None.easeNone
		})
		break;
		case 4 :
		TransitionManager.start (xmlArray [indexID].showMC,
		{
			type : PixelDissolve, direction : Transition.IN, duration : 0.5, easing : None.easeNone, xSections : 10, ySections : 10
		})
		break;
		case 5 :
		TransitionManager.start (xmlArray [indexID].showMC,
		{
			type : Wipe, direction : Transition.IN, duration : 0.5, easing : None.easeNone, startPoint : 1
		});
		break;
		default :
		TransitionManager.start (xmlArray [indexID].showMC,
		{
			type : Fade, direction : Transition.IN, duration : 0.5, easing : None.easeNone
		})
		break;
	}
}
