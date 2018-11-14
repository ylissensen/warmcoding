/**
 * 通过专业，科目，章节的题库查询
 */

function change()
{
   var x = document.getElementById("first");
   var y = document.getElementById("second");
   var z = document.getElementById("third");
   y.options.length = 0; // 清除second下拉框的所有内容
   z.options.length = 0; // 清除third下拉框的所有内容
   
   //注意：此处的新增option内容要在数据库中读取
   
   if(x.selectedIndex == 0)
   {
	   y.options.add(new Option("Web程序设计", "0", false, true));  // 默认选中科目
	   y.options.add(new Option("算法程序设计", "1"));
	   y.options.add(new Option("计算机组成原理", "2"));
	   z.options.add(new Option("第一章 基础知识", "0", false, true));  //默认选中章节
	   z.options.add(new Option("第二章 HTML/XHTML简介", "1")); 
	   z.options.add(new Option("第三章 层叠样式表", "2")); 
   }
 
   if(x.selectedIndex == 1)
   {
	   y.options.add(new Option("物联网工程课程", "0", false, true));  // 默认选中科目
	   y.options.add(new Option("物联网工程课程", "1"));
	   y.options.add(new Option("物联网工程课程", "2"));
	   z.options.add(new Option("第一章", "0", false, true));  //默认选中章节
	   z.options.add(new Option("第二章", "1")); 
	   z.options.add(new Option("第三章", "2")); 
   }
   if(x.selectedIndex == 2)
   {
	   y.options.add(new Option("软件工程课程", "0", false, true));  // 默认选中科目
	   y.options.add(new Option("软件工程课程", "1"));
	   y.options.add(new Option("软件工程课程", "2"));
	   z.options.add(new Option("第一章", "0", false, true));  //默认选中章节
	   z.options.add(new Option("第二章", "1")); 
	   z.options.add(new Option("第三章", "2")); 
   }
}

function change2(){
	var x = document.getElementById("first");
	var y = document.getElementById("second");
	var z = document.getElementById("third");
	z.options.length = 0; // 清除third下拉框的所有内容
	
	if(y.selectedIndex == 0)
	{
		z.options.add(new Option("第一章 基础知识", "0", false, true));  //默认选中章节
		z.options.add(new Option("第二章 HTML/XHTML简介", "1")); 
		z.options.add(new Option("第三章 层叠样式表", "2")); 
	}
	if(y.selectedIndex == 1)
	{
		z.options.add(new Option("第一章", "0", false, true));  //默认选中章节
		z.options.add(new Option("第二章", "1")); 
		z.options.add(new Option("第三章", "2")); 
	}
	if(y.selectedIndex == 2)
	{
		z.options.add(new Option("第一章", "0", false, true));  //默认选中章节
		z.options.add(new Option("第二章", "1")); 
		z.options.add(new Option("第三章", "2")); 
	}
}

