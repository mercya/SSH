var _huspaceCopyright_isRun : Boolean = true //标识是否已经运行
//
//默认场景宽度和高度
var _huspaceCopyright_StageWidth : Number = 445
var _huspaceCopyright_StageHeight : Number = 200
//=======================================================//start
//创建键盘侦听
var _HuspaceCopyright_KeyListener : Object = new Object ()
//
_HuspaceCopyright_KeyListener.onKeyDown = function ()
{
	//如果按下 CTRL + DEL
	if (Key.isDown (Key.CONTROL) && Key.isDown (Key.DELETEKEY))
	{
		//检测程序是否已经运行
		if ( ! _huspaceCopyright_isRun)
		{
			_huspaceCopyright_isRun = true
			//
			removeMovieClip (_HuspaceCopyright_bgMovieClip) //避免因为多次按快捷键而创建过多MC,先把之前的卸载掉
			removeMovieClip (HuspaceCopyright)
			//
			_root.createEmptyMovieClip ("_HuspaceCopyright_bgMovieClip", 1048574) //在根时间轴创建一个空白MC,层深为最大1048574
			_HuspaceCopyright_bgMovieClip._alpha = 70 //设置成半透明
			_HuspaceCopyright_bgMovieClip.tabIndex = 1 //设置Tab键的排序为1,避免用Tab键可以访问到底下的元件
			//
			//调用画矩形函数
			_huspaceCopyright_DrawBox (_HuspaceCopyright_bgMovieClip, - (Stage.width - _huspaceCopyright_StageWidth) / 2, - (Stage.height - _huspaceCopyright_StageHeight) / 2, Stage.width, Stage.height)
			//
			//=======================================================//start
			//侦听场景宽高是否改变,如果改变,清除当前背景,重新画一个占满场景宽高的背景
			var _HuspaceCopyright_Listener : Object = new Object ()
			_HuspaceCopyright_Listener.onResize = function ()
			{
				//
				_HuspaceCopyright_bgMovieClip.clear ()
				//调用画矩形函数
				_huspaceCopyright_DrawBox (_HuspaceCopyright_bgMovieClip, - (Stage.width - _huspaceCopyright_StageWidth) / 2, - (Stage.height - _huspaceCopyright_StageHeight) / 2, Stage.width, Stage.height)
			}
			Stage.addListener (_HuspaceCopyright_Listener)
			//=======================================================//end
			//
			//=======================================================//start
			//创建鼠标单击事件
			_HuspaceCopyright_bgMovieClip.onRelease = function ()
			{
				_huspaceCopyright_isRun = false
				//单击就清除背景和删除MC
				this.clear ()
				removeMovieClip (this)
				_huspaceCopyright_mainMovieClip ("remove") //移除主要内容MC
				Stage.removeListener (_HuspaceCopyright_Listener) //移除场景宽高侦听
			}
			//=======================================================//end
			//
			_huspaceCopyright_mainMovieClip ("load") //载入主体内容MC
		}
		//如果程序已经运行,再次按快捷键就调用移除
		else
		{
			_HuspaceCopyright_bgMovieClip.onRelease () //调用鼠标单击事件
		}
	}
}
Key.addListener (_HuspaceCopyright_KeyListener)
//=======================================================//end
//
//=======================================================//start
//画矩形函数
function _huspaceCopyright_DrawBox (mcName : MovieClip, mcX : Number, mcY : Number, mcW : Number, mcH : Number) : Void
{
	mcName.lineStyle (0)
	mcName.beginFill (0x000000)
	mcName.moveTo (mcX, mcY)
	mcName.lineTo (mcX + mcW, mcY)
	mcName.lineTo (mcX + mcW, mcY + mcH)
	mcName.lineTo (mcX, mcY + mcH)
	mcName.lineTo (mcX, mcY)
	mcName.endFill ()
}
//=======================================================//end
//
//=======================================================//start
//控制主要内容函数
//types 参数判断是载入或者移除 (load: 载入)(remove: 移除)
function _huspaceCopyright_mainMovieClip (types : String) : Void
{
	if (types == "load")
	{
		//在根时间轴从库中复制具体内容MC出来,层深为最大1048575
		_root.attachMovie ("HuspaceCopyright", "HuspaceCopyright", 1048575 ,
		{
			//初始化X和Y轴等于场景宽高的一半(居中), 不使用Stage.width/2 是因为在场景宽高改变后, 默认的根轴坐标0,0并没有改变
			_x : Math.floor (_huspaceCopyright_StageWidth / 2) , _y : Math.floor (_huspaceCopyright_StageHeight / 2)
		})
		HuspaceCopyright._alpha = 0
		HuspaceCopyright.onEnterFrame = function ()
		{
			this._alpha += 10
			if (this._alpha >= 100)
			{
				delete this.onEnterFrame
			}
		}
	}
	//
	if (types == "remove")
	{
		HuspaceCopyright.onEnterFrame = function ()
		{
			this._alpha -= 10
			if (this._alpha <= 0)
			{
				removeMovieClip (this)
				delete this.onEnterFrame
			}
		}
	}
}
//=======================================================//end
//
