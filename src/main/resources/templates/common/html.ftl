<#import "/common/spring.ftl" as spring />  

<#macro commonHead>
	<#assign base=request.contextPath/>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
		
	<base id="base" href="${base}"/>
	
	<link href="${base}/css/jquery-ui.css" rel="stylesheet">
	<link href="${base}/css/bootstrap.min.css" rel="stylesheet">
	<link href="${base}/css/showcast.css" rel="stylesheet">
	
	<script src="${base}/js/jquery.min.js"></script>
	<script src="${base}/js/jquery-ui.js"></script>
	<script src="${base}/js/jquery-ui.datepicker.zh-CN.js"></script>
	<script src="${base}/js/bootstrap.min.js"></script>
</#macro>

<#macro topMenu>
	<#assign base=request.contextPath/>
	<#assign topKey=Session["_TOP_KEY"]/>
	<nav class="navbar navbar-inverse navbar-fixed-top">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
				<span class="sr-only">Toggle navigation</span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="index.html">ShowCast</a>
			</div>
			<div id="navbar" class="navbar-collapse collapse">
				<ul class="nav navbar-nav">
				
					<#list Session["_MENU"].childMenus as menu>
					
						<#if menu.childMenus?size == 0 >
						<li><a href="${base}/route.do?from=top&to=${menu.key}">${menu.prompt}</a></li>
						</#if>
						<#if menu.childMenus?size gt 0 >
						<li class="dropdown">
							<a class="dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">
								${menu.prompt}<span class="caret"></span></a>
							<ul class="dropdown-menu">
								<#list menu.childMenus as childMenu>
									<li><a href="${base}/route.do?from=top&to=${childMenu.key}">${childMenu.prompt}</a></li>
								</#list>
						    </ul>
						</li>
						</#if>
					
					</#list>
				</ul>
				<ul class="nav navbar-nav navbar-right">
					<li>
						<a href="${base}/logout.do"><@spring.message "prompt.logout"/></a>
					</li>
				</ul>
			</div>
		</div>
	</nav>
</#macro>

<#macro content>
	<div id="content" class="container-fluid">
			
		<div class="row">
			<#if Session["_SIDE"]?? && Session["_SIDE"]?size gt 0>
			<div class="col-sm-3 col-md-2 sidebar">
				<#assign topMenu=Session["_TOP_MENU"]/>
				<h4>${topMenu.prompt}</h4>
				
				<ul class="nav nav-sidebar">
				
					<#assign sideKey=Session["_SIDE_KEY"]/>
					<#list Session["_SIDE"] as sideMenu>
					<li <#if sideKey == sideMenu.key>class="active"</#if>><a href="${base}/route.do?from=side&to=${sideMenu.key}">${sideMenu.prompt}</a></li>
					</#list>
					
				</ul>
			</div>
			<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
				<#if Session["_CRUMBS"]?? && Session["_CRUMBS"]?size gt 0>
				<ol class="breadcrumb">
					<#list Session["_CRUMBS"] as crumbMenu>
					<li>${crumbMenu.prompt}</li>
					</#list>
				</ol>
				</#if>
				<#nested/>
			</div>
			<#else>
			<div class="main">
				<#if Session["_CRUMBS"]?? && Session["_CRUMBS"]?size gt 0>
				<ol class="breadcrumb">
					<#list Session["_CRUMBS"] as crumbMenu>
					<li>${crumbMenu.prompt}</li>
					</#list>
				</ol>
				</#if>
				<#nested/>
			</div>
			</#if>
		</div>
	</div>
</#macro>

<#macro footerJs>
</#macro>