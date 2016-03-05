<meta http-equiv="content-type" content="text/html; charset=UTF-8"/>
<#import "/common/html.ftl" as html/>
<#assign base=request.contextPath/>

<!DOCTYPE html>
<html lang="en">
	<head>
		<@html.commonHead/>
		<title>Home</title>
	</head>
	<body>
		<div ng-app="myApp" ng-controller="customersCtrl">
		<@html.topMenu/>
		
		<@html.content>
			<div style="background: url(${base}/img/logo.jpg) no-repeat right bottom;width:100%;height:280px;border:1px #333 solid;">
			</div>
		</@html.content>
	</body>
</html>