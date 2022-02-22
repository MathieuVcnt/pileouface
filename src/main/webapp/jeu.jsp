<%@ page pageEncoding="UTF-8"%>
<%@ page import="metier.JeuPileOuFace"%>
<!DOCTYPE html>
<html lang="fr">
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
</meta>
<style>
nav { text-align:center; background : gray; padding: 4px;}
nav li { display: inline;}
nav li a {
padding: 20px 50px ;
background: gray;
color: white ;
font : 2em "Trebuchet MS",Arial,sans-serif ;
text-decoration: none ;
</style>
<nav>
<a href="jeu.jsp">JEU</a>
<a href="score.jsp">SCORES</a>
</nav>

</head>
<body>
	<div class="container text-center">
		<h1>Pile ou Face</h1>
		Le premier arrivé à 10 a gagné ! </br> Deux faces identiques je gagne, deux
		faces différentes vous gagnez !
		</p>
		</p>
		<%
		// creation ou récupération d'un jeu
		JeuPileOuFace jeu = (JeuPileOuFace) session.getAttribute("jeu");
		if (jeu == null) {
			jeu = new JeuPileOuFace();
			session.setAttribute("jeu", jeu);
		}
		// si il n'y a pas de coup, ou si l'un des deux a gagné, on recommence une partie
		String coup = request.getParameter("coup");
		if (coup == null || jeu.termine()) {
			jeu.init();
		%>
		Nous allons débuter une nouvelle partie
		<%
		} else // prise en compte du dernier coup
		{
		jeu.play(coup.charAt(0));
		%>
		Vous venez de jouer
		<%=jeu.getLastHumain()%>
		et l'ordi
		<%=jeu.getLastOrdi()%>
		<%
}
%>
		</p>
		Scores
		<%=jeu.getPointsHumain()%>
		à
		<%=jeu.getPointsOrdi()%>
		<%
		// Traitement du gagnant
		if (jeu.getPointsHumain() == 10) {
		%>
		<h2>Vous avez gagné !!</h2>
		<a href=jeu.jsp>Voulez-vous rejouer ?</a>
		<%
		} else if (jeu.getPointsOrdi() == 10) {
		%>
		<h2>Vous avez perdu :-(</h2>
		<a href=jeu.jsp>Voulez-vous rejouer ?</a>
		<%
		} else {
		%>
		</p>
		Vous jouez <a href="?coup=P">Pile</a> ou <a href="?coup=F">Face</a> ?
		<%
}
%>
	</div>
</body>
</html>

