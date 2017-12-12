class include.DepthSet
{
	public static var group : Object = new Object ()
	//
	//构造函数
	function DepthSet ()
	{
	}
	//
	//设置该MC置顶显示
	public static function setTop (groupName : String, mcName : MovieClip) : Void
	{
		//判断是否有该组
		if (group [groupName] == undefined)
		{
			group [groupName] = []
		}
		//
		//判断是否已经加入该MC
		if (checkGroup (groupName, mcName) == -1)
		{
			group [groupName].push (mcName)
		}
		//
		//把数组按照MC深度重新排序
		group [groupName].sort (compare)
		//
		var groupIndex : Number = checkGroup (groupName, mcName) //取得MC在数组中的索引值
		for (var i = groupIndex+1; i < group [groupName].length; i ++)
		{
			//循环交换各MC的深度
			mcName.swapDepths (group [groupName][i])
		}
	}
	//
	//把MC从组中删除
	public static function remove (groupName : String, mcName : MovieClip) : Void
	{
		var groupIndex : Number = checkGroup (groupName, mcName) //取得MC在数组中的索引值
		//
		if (groupIndex != -1)
		{
			group [groupName].splice (groupIndex, 1)
		}
		//
		//如果该组没有任何MC, 就删除
		if (group [groupName].length <= 0)
		{
			delete group [groupName]
		}
	}
	//
	//把数组重新排序
	private static function compare (mc1 : MovieClip, mc2 : MovieClip) : Number
	{
		if (mc1.getDepth () < mc2.getDepth ())
		{
			return -1
		}
		else
		{
			return 1
		}
	}
	//
	//判断是否已经加入该MC, 如果没有就返回-1, 如果有就返回该MC在数组中的索引值
	private static function checkGroup (groupName : String, mcName : MovieClip) : Number
	{
		for (var i = 0; i < group [groupName].length; i ++)
		{
			if (mcName == group [groupName][i])
			{
				return i
				break
			}
		}
		//
		return -1
	}
}
