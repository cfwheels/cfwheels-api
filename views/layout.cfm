<!--- Place HTML here that should be used as the default layout of your application. --->
<cfscript>
    param name="request.fullpagetitle" default="CFWheels API";
	request.wheels.showDebugInformation = false;
	setting showDebugOutput=false;

    if(structKeyExists(request, "pagetitle")){
        request.fullpagetitle= request.pagetitle & ' | ' & request.fullpagetitle;
    }
</cfscript>
<cfoutput>


<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>#request.fullpagetitle#</title>

	<link rel="shortcut icon" href="/favicon.ico" type="image/x-icon">
	<link rel="icon" href="/favicon.ico" type="image/x-icon">
    <!-- Bootstrap Core CSS -->
     #stylesheetLinkTag("https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css,https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css,custom")#
     <link href="https://fonts.googleapis.com/css?family=Open+Sans:400,700" rel="stylesheet">

    <!-- Bootstrap Core JavaScript -->
    #javascriptIncludeTag("jquery.slim.min,https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js,custom")#

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->


<script>
  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  })(window,document,'script','https://www.google-analytics.com/analytics.js','ga');

  ga('create', 'UA-3914949-3', 'auto');
  ga('send', 'pageview');

</script>

</head>

<body>
    <!-- Global Header-->
    <header id="global">
        <a href="https://cfwheels.org"><img src="/images/logo_white.png" alt="CFWheels Logo" class="main-logo" /></a>
        <div class="container-fluid">
            <nav class="navbar navbar-default" role="navigation">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="##mainmenu">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <div class="collapse navbar-collapse" id="mainmenu">
                    <ul class="nav nav-pills center-pills ">
                        <li role="presentation"><a href="https://guides.cfwheels.org">Guides</a></li>
                        <li role="presentation"><a href="https://api.cfwheels.org">API</a></li>
                        <li role="presentation"><a href="https://cfwheels.org/blog">Blog</a></li>
                        <li role="presentation"><a href="https://github.com/cfwheels/cfwheels/discussions">Discussions</a></li>
                        <li role="presentation"><a href="https://github.com/cfwheels/cfwheels/issues">Issue Tracker</a></li>
                        <li role="presentation"><a href="https://www.forgebox.io/type/cfwheels-plugins">Plugins</a></li>
                        <li role="presentation"><a href="https://github.com/cfwheels/cfwheels/releases">Downloads</a></li>
                    </ul>
                </div>
            </nav>
        </div>
    </header>

    <!-- Page Content -->
    <div class="container-fluid ">
				#flashMessages()#
				#includeContent()#
    </div>
    <!-- /.container -->
</body>
</html>
</cfoutput>
