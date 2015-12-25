<meta http-equiv="content-type" content="text/html; charset=UTF-8"/>
<#import "/common/html.ftl" as html/>
<#import "/common/spring.ftl" as spring/>
<#assign base=request.contextPath/>

<!DOCTYPE html>
<html lang="en">
	<head>
		<@html.commonHead/>
		<title><@spring.message "resource.home.title"/></title>
		<script src="${base}/js/angular.js"></script>
	</head>
	<body>
		<div ng-app="myApp" ng-controller="appCtl">
			<@html.topMenu/>
			
			<@html.content>
				<a class="btn btn-default" href="${base}/tofunc.do?key=F_RESOURCE_HOME">back</a>
				Edit Resource
				
			</@html.content>
			
			<script src="${base}/res.do?path=/resource/home.js"></script>
		</div>
	</body>
</html>