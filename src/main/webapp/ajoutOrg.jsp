<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="navbar.html"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Ajouter un Organisateur</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        body {
            background: linear-gradient(to right, #e0f7fa, #ffffff);
            min-height: 100vh;
        }
        .card {
            border: none;
            background: #ffffff;
        }
        .card h3 {
            color: #0d6efd;
        }
        .form-label {
            font-weight: 600;
        }
        .btn-primary {
            background-color: #0d6efd;
            border: none;
        }
        .btn-primary:hover {
            background-color: #0b5ed7;
        }
        .btn-outline-secondary:hover {
            color: #fff;
            background-color: #6c757d;
        }
    </style>
</head>
<body>
<div class="container py-5">
    <div class="card shadow-lg rounded-4 mx-auto" style="max-width: 550px;">
        <div class="card-body p-5">
            <h3 class="text-center fw-bold mb-4">
                <i class="fas fa-user-plus me-2 text-primary"></i>Nouvel Organisateur
            </h3>
            
            <form action="saveOrganisateur" method="POST">
                <div class="mb-4">
                    <label class="form-label">Nom</label>
                    <input type="text" 
                           name="nom" 
                           class="form-control form-control-lg"
                           placeholder="Entrez le nom"
                           required>
                </div>
                
                <div class="d-flex justify-content-between">
                    <a href="organisateurs" class="btn btn-outline-secondary px-4">
                        <i class="fas fa-arrow-left me-1"></i>Annuler
                    </a>
                    <button type="submit" class="btn btn-primary px-4">
                        <i class="fas fa-save me-2"></i>Enregistrer
                    </button>
                </div>
            </form>
        </div>
    </div>
</div>
</body>
</html>
