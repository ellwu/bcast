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

		</@html.content>
	</body>
</html>