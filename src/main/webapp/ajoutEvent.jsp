<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="navbar.html" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>${empty evenement.id ? 'Ajouter' : 'Modifier'} un Événement</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
        :root {
            --primary-color: #6c5b7b;
            --secondary-color: #f39c12;
            --success-color: #2ecc71;
        }

        body {
            background-color: #f8f9fa;
            font-family: 'Segoe UI', system-ui, -apple-system, sans-serif;
        }

        .form-container {
            max-width: 700px;
            margin: 80px auto;
            padding: 2rem;
        }

        .form-card {
            border: none;
            border-radius: 15px;
            box-shadow: 0 8px 30px rgba(0, 0, 0, 0.12);
            overflow: hidden;
        }

        .card-header {
            background: linear-gradient(135deg, var(--primary-color), #8b6fa8);
            color: white;
            padding: 1.5rem;
            position: relative;
        }

        .card-header h2 {
            margin: 0;
            font-weight: 600;
            display: flex;
            align-items: center;
            gap: 12px;
        }

        .card-header i {
            font-size: 1.8rem;
        }

        .form-control {
            border-radius: 8px;
            padding: 12px 15px;
            border: 2px solid #e0e0e0;
            transition: all 0.3s ease;
        }

        .form-control:focus {
            border-color: var(--primary-color);
            box-shadow: 0 0 0 3px rgba(108, 91, 123, 0.1);
        }

        .form-label {
            font-weight: 500;
            color: #4a4a4a;
            margin-bottom: 8px;
        }

        .btn-submit {
            background: var(--primary-color);
            border: none;
            padding: 12px 20px;
            font-weight: 600;
            letter-spacing: 0.5px;
            transition: all 0.3s ease;
            width: 100%;
            border-radius: 8px;
        }

        .btn-submit:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(108, 91, 123, 0.3);
        }

        .select-wrapper {
            position: relative;
        }

        .select-wrapper:after {
            content: "▼";
            position: absolute;
            right: 15px;
            top: 50%;
            transform: translateY(-50%);
            color: var(--primary-color);
            pointer-events: none;
        }

        .alert-message {
            position: fixed;
            top: 100px;
            right: 30px;
            z-index: 1000;
            animation: slideIn 0.3s ease-out;
        }

        @keyframes slideIn {
            from { transform: translateX(100%); }
            to { transform: translateX(0); }
        }
    </style>
</head>
<body>

<%@ include file="navbar.html"%>

<div class="form-container">
    <div class="form-card">
        <div class="card-header">
            <h2>
                <i class="fas fa-calendar-plus"></i>
                ${empty evenement.id ? 'Nouvel Événement' : 'Modifier Événement'}
            </h2>
        </div>
        <div class="card-body p-4">
            <c:if test="${not empty message}">
                <div class="alert alert-${type} alert-message">
                    ${message}
                </div>
            </c:if>

            <form method="post" action="${empty evenement.id ? 'ajouter' : 'update'}">
                            <form action="modifier" method="post">
            
                <div class="mb-4">
                    <label for="nom" class="form-label">Nom de l'événement</label>
                    <input type="text" 
                           class="form-control" 
                           name="nom" 
                           id="nom" 
                           value="${evenement.nom}"
                           placeholder="Entrez le nom de l'événement"
                           required>
                </div>

                <div class="mb-4">
                    <label for="lieu" class="form-label">Lieu</label>
                    <input type="text" 
                           class="form-control" 
                           name="lieu" 
                           id="lieu" 
                           value="${evenement.lieu}"
                           placeholder="Adresse complète du lieu"
                           required>
                </div>

               <div class="mb-4">
    <label for="organisateur" class="form-label">Organisateur</label>
    <div class="select-wrapper">
        <select class="form-select" name="organisateur" id="organisateur" required>
            <option value="">Sélectionnez un organisateur</option>
           <c:forEach var="org" items="${allOrganisateurs}">
    <option value="${org.id}">${org.nom}</option>
</c:forEach>
        </select>
    </div>
</div>

                <input type="hidden" name="id" value="${evenement.id}">
                
                <!-- Submit button inside the form -->
                <button type="submit" class="btn btn-submit btn-primary">
                    <i class="fas fa-save me-2"></i>
                    ${empty evenement.id ? 'Créer l\'événement' : 'Mettre à jour'}
                </button>
            </form>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
