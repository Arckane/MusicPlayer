<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>
<!DOCTYPE html>
<html>
<head runat="server">
    <title>Music Player</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="MVC Music Player">
    <meta name="author" content="Andrew Wood">
    <!-- Bootstrap Core CSS -->
    <link href="../../css/bootstrap.css" rel="stylesheet" />
    <!-- Custom CSS -->
    <link href="../../css/stylish-portfolio.css" rel="stylesheet">
    <!-- Custom Fonts -->
    <link href="../../font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="http://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,700,300italic,400italic,700italic" rel="stylesheet" type="text/css">
    <!-- Jquery -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>
    <script>
        $(function ()
        {
            var tracks = [];
            jQuery.get('http://104.131.99.240/mp3/repo.txt', function (data) {
                tracks = data.split('\n');
                var option = '';
                for (var i = 0; i <= (tracks.length-1); i++) {
                    option += '<option value="' + tracks[i] + '">' + tracks[i] + '</option>';
                }
                $('#tracks').append(option);
            });
        });

        function playTrack()
        {
            if ($("#player").length)
            {
                $("#player").remove();
                $("#playerBreak").remove();
            }
            var track = $('#tracks :selected').text();
            var trackGo = track.replace(" ", "%20");
            var url = "http://104.131.99.240/mp3/" + trackGo;
            var playerDiv = '<br id="playerBreak">' + '<audio id="player" controls>' + '<source src="' + url + '"/>' + '</audio>';
            $('#topHeader').append(playerDiv);
        }
    </script>
</head>
<body>
    <!-- Header -->
    <header id="top" class="header">
        <div id="topHeader" class="text-vertical-center">
            <a href="<%= @Url.Action("Index","Home") %>" class="btn btn-dark btn-lg">Go Home</a>
            <br>
            <h1>Music Player Demo</h1>
            <br>
            <select id="tracks"></select>
            <button onclick="playTrack()">Play Track</button>
            <br>
        </div>
        <!-- /.row -->
    </header>

    <!-- About -->
    <section id="about" class="about">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <h2>By Andrew Wood credit for Stylish Portflio Theme goes to MIT Bootstrap</h2>
                    <p class="lead">This theme features some wonderful photography courtesy of <a target="_blank" href="http://join.deathtothestockphoto.com/">Death to the Stock Photo</a>.</p>
                </div>
            </div>
            <!-- /.row -->
        </div>
        <!-- /.container -->
    </section>
</body>
</html>
