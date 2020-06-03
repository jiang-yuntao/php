<?php
	header("Content-Type:text/html;charset=utf-8");
	session_start();
	$name = $classname = $account = "";
	$a=0;
	if (isset($_SESSION['nickname']))
	{
		$a = 1;
		if ($_SESSION['class'])
		{
			$classname = "图书管理员";
			$a = 2;
		}
		else
			$classname = "普通用户";
		$name = $_SESSION['nickname'];
		$account = $_SESSION['account'];
	}
?>
<html>
<head>
	<title>CEIT图书管理系统</title>
	<meta charset="UTF-8"/>
	<link rel="stylesheet" type="text/css" href="backstage/CSS.css">
<script type="text/javascript">
function land()
{ 
	if (<?php echo $a; ?>==0) 
	{ 
		alert("请先登录");
		window.location='land.php';
	}
}
function check()
{ 
	if (<?php echo $a; ?>==2) 
		window.location='backstage/manage.php';
	else
	{ 
		alert("对不起，你不是图书管理员！有需要可以在右侧留言");
	}
	
}
</script>
</head>
<body onload="land()" >
<table align = "center" border = "1" width = "960" style="text-align: center;">
	<tr>
		<td><a href="#" onclick="check()">图书管理</a></td>
		<td>用户昵称：<a href="user.php"><?php echo $name; ?></a></td>
		<td>级别：<?php echo $classname; ?></td>
		<td><a href="message.php">用户留言</a></td>
		<td><a href="logout.php">注销</a></td>
	</tr>
</table>
<?php
	
	include "backstage/page.cless.php";
	include("config.php");

	$outcome= mysql_query("SELECT * FROM book_message",$online);


	$total = mysql_num_rows($outcome);
	$num = 10;
	$page = new Page($total,$num,"");
	$sql = "select * from book_message {$page->limit}";
	$outcome = mysql_query($sql,$online);

	echo'<table align = "center" border = "1" width = "960" style="text-align: center;">';
	echo "<caption><h1>图书借阅</h1></caption>";
	echo "<tr>";
	echo "<td>"."书名"."</td>";
	echo "<td>"."作者"."</td>";
	echo "<td>"."入库时间"."</td>";
	echo "<td>"."类型"."</td>";
	echo "<td>"."单价"."</td>";
	echo "<td>"."剩余数量"."</td>";
	echo "<td>"."操作"."</td>";
	echo "</tr>";
	
	while($sql = mysql_fetch_array($outcome))
	{
		echo "<tr>";
		$id = $sql['num'];
		echo "<td>".$sql['book_title']."</td>";
		echo "<td>".$sql['author']."</td>";
		echo "<td>".$sql['add_time']."</td>";
		echo "<td>".$sql['type']."</td>";
		echo "<td>".$sql['money']."元</td>";
		echo "<td>".$sql['number']."</td>";
		$zj="SELECT * FROM borrow WHERE book_id='".$id."'";
		$zjsz=mysql_query($zj,$online);
		$var=0;
		while($arr = mysql_fetch_array($zjsz))
		{ 
			if(($arr["book_id"]==$id)&&($arr["user"]==$account))
			{
				echo "<td class='color'>"."<a class=\"remand\" href="."\""."remand.php?id=".$id."&& book_title=".$sql['book_title']."\"".">&nbsp;还书&nbsp;</a></td>";
				$var++;
				break;
			}
		}
		if(($var==0)&&($sql['number']==0))
			echo "<td>本图书已借完</td>";
		else
			if($var==0)
			echo "<td>"."<a class=\"borrow\" href="."\""."borrow.php?id=".$id."&& book_title=".$sql['book_title']."\"".">&nbsp;借书&nbsp;</a></td>";
	
		echo "</tr>";
	}
	echo "<tr><td style='text-align:center;' colspan = \"9\" align = \"right\">".$page->/*fpage(array(0,1,2,3,4,5,6,7,8))*/fpage(array(3,4,5,8,6,7,2,0,))."</td></tr>";
	echo "</table>";
	mysql_close($online);

?>
</body>
</html>