<meta http-equiv="content-type" content="text/html; charset=UTF-8"/>
<#import "/common/html.ftl" as html/>
<#import "/common/spring.ftl" as spring/>
<#assign base=request.contextPath/>

<!DOCTYPE html>
<html lang="en">
	<head>
		<@html.commonHead/>
		<title>Funciton Not Found!</title>
	</head>
	<body>
		<div ng-app="myApp" ng-controller="menusCtl">
			<@html.topMenu/>
			
			<@html.content>
				<h1>404, Function Not Found!</h1>
			</@html.content>
			
			
		</div>
	</body>
</html>