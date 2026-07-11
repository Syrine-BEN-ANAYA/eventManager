<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="navbar.html"%>

<!DOCTYPE html>
<html lang="fr">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>EventManager</title>
  <link rel="icon" href="images/favicon.ico" type="image/x-icon">
  <style>
    body {
      padding-top: 90px;
      background-color: #f8f9fa;
      font-family: 'Inter', system-ui, -apple-system, sans-serif;
    }

    .hero-section {
      min-height: 600px;
      background: linear-gradient(rgba(0, 0, 0, 0.4), rgba(0, 0, 0, 0.4)), 
                  url('images/img.png') center/cover no-repeat;
      border-radius: 12px;
      margin: 30px 0;
    }

    .cta-section {
      background: white;
      border-radius: 12px;
      padding: 2rem;
      margin-top: -50px;
      box-shadow: 0 4px 24px rgba(0, 0, 0, 0.1);
    }

    .feature-card {
      transition: transform 0.3s ease;
      border: none;
    }

    .feature-card:hover {
      transform: translateY(-5px);
    }

    .welcome-container {
      max-width: 600px;
      padding: 3rem;
    }
  </style>
</head>
<body>

<div class="container">
  <div class="hero-section d-flex align-items-center">
    <div class="welcome-container text-white">
      <h1 class="display-4 fw-bold mb-4">Faites de chaque événement un moment parfait !</h1>
      <p class="lead mb-4">Gestion d'événements simplifiée et intuitive</p>
      <div class="d-flex gap-3">
        <a href="#" class="btn btn-primary btn-lg px-4">Sign in</a>
        <a href="#" class="btn btn-outline-light btn-lg px-4">En savoir plus</a>
      </div>
    </div>
  </div>

  <div class="cta-section">
    <div class="row g-4">
      <div class="col-md-4">
        <div class="feature-card card h-100 text-center p-4">
          <div class="card-body">
            <i class="bi bi-calendar-check fs-1 text-primary mb-3"></i>
            <h5 class="card-title">Planification facile</h5>
            <p class="card-text text-muted">Créez et organisez vos événements en quelques clics</p>
          </div>
        </div>
      </div>
      <div class="col-md-4">
        <div class="feature-card card h-100 text-center p-4">
          <div class="card-body">
            <i class="bi bi-people fs-1 text-primary mb-3"></i>
            <h5 class="card-title">Gestion des participants</h5>
            <p class="card-text text-muted">Suivez les inscriptions en temps réel</p>
          </div>
        </div>
      </div>
      <div class="col-md-4">
        <div class="feature-card card h-100 text-center p-4">
          <div class="card-body">
            <i class="bi bi-graph-up fs-1 text-primary mb-3"></i>
            <h5 class="card-title">Analytiques avancés</h5>
            <p class="card-text text-muted">Statistiques détaillées et rapports</p>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>

</body>
</html>