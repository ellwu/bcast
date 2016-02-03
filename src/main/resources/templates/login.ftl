<meta http-equiv="content-type" content="text/html; charset=UTF-8"/>
<#import "/common/html.ftl" as html/>
<#import "/common/spring.ftl" as spring/>

<!DOCTYPE html>
<html lang="en">
	<head>
		<#assign base=request.contextPath/>
		<@html.commonHead/>
		<title>Login</title>
	</head>
	<body>
		<div id="content" class="container">
			<div class="row">
				<div class="col-sm-3 col-md-4"></div>
				<div class="col-sm-4 col-md-3">
					<#if loginMsg??>
					<div class="form-login-error">
						<h3>Invalid login</h3>
						<p>${loginMsg}</p>
					</div>
					</#if>

					<form method="post" role="form" id="form_login" action="${base}/valLogin.do">

						<div class="form-group">

							<div class="input-group">
								<div class="input-group-addon">
									<i class="glyphicon glyphicon-user"></i>
								</div>

								<input class="form-control" name="name" id="username" placeholder="<@spring.message "username"/>" autocomplete="off" type="text">
							</div>

						</div>

						<div class="form-group">

							<div class="input-group">
								<div class="input-group-addon">
									<i class="glyphicon glyphicon-lock"></i>
								</div>

								<input class="form-control" name="password" id="password" placeholder="<@spring.message "password"/>" autocomplete="off" type="password">
							</div>

						</div>

						<div class="form-group">
							<button type="submit" class="btn btn-primary btn-block btn-login">
								<i class="fa fa-sign-in"></i>
								<@spring.message "login"/>
							</button>
						</div>
					</form>
				</div>
				
				<div class="col-sm-3 col-md-4"></div>
			</div>
		</div>
	
		<@html.footerJs/>
	</body>
</html>